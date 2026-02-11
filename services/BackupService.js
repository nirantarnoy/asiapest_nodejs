const { exec } = require('child_process');
const path = require('path');
const fs = require('fs');
const cron = require('node-cron');
const SftpClient = require('ssh2-sftp-client');
const configPath = path.join(__dirname, '../config/backup.json');

class BackupService {
    constructor() {
        this.task = null;
        this.init();
    }

    init() {
        const config = this.getConfig();
        if (config.enabled) {
            this.schedule(config.schedule);
        }
    }

    getConfig() {
        try {
            return JSON.parse(fs.readFileSync(configPath, 'utf8'));
        } catch (err) {
            return {
                schedule: '0 0 * * *',
                enabled: false,
                nas_enabled: false,
                nas_host: '',
                nas_port: 22,
                nas_user: '',
                nas_pass: '',
                nas_path: ''
            };
        }
    }

    saveConfig(config) {
        fs.writeFileSync(configPath, JSON.stringify(config, null, 4));
        if (config.enabled) {
            this.schedule(config.schedule);
        } else if (this.task) {
            this.task.stop();
        }
    }

    schedule(time) {
        if (this.task) this.task.stop();
        this.task = cron.schedule(time, () => {
            console.log('Running scheduled backup...');
            this.runBackup();
        });
    }

    async runBackup() {
        return new Promise(async (resolve, reject) => {
            const dbName = process.env.DB_NAME || 'asiapest';
            const dbUser = process.env.DB_USER || 'root';
            const dbPass = process.env.DB_PASS || '';
            const dbHost = process.env.DB_HOST || 'localhost';

            const timestamp = Math.floor(Date.now() / 1000);
            const fileName = `backup_${dbName}_${timestamp}.sql`;
            const backupDir = path.join(__dirname, '../uploads/backup');

            if (!fs.existsSync(backupDir)) {
                fs.mkdirSync(backupDir, { recursive: true });
            }

            const localFilePath = path.join(backupDir, fileName);

            // XAMPP default path for mysqldump on Windows
            const xamppDumpPath = 'E:\\xampp\\mysql\\bin\\mysqldump.exe';
            const mysqldumpCmd = fs.existsSync(xamppDumpPath) ? `"${xamppDumpPath}"` : 'mysqldump';

            // mysqldump command
            const cmd = `${mysqldumpCmd} -h ${dbHost} -u ${dbUser} ${dbPass ? `-p${dbPass}` : ''} ${dbName} > "${localFilePath}"`;

            exec(cmd, async (error, stdout, stderr) => {
                if (error) {
                    console.error(`Local Backup Error: ${error.message}`);
                    return reject(error);
                }

                console.log(`Local backup created: ${fileName}`);

                // Check NAS Export
                const config = this.getConfig();
                if (config.nas_enabled && config.nas_host) {
                    try {
                        await this.uploadToNAS(localFilePath, fileName, config);
                        console.log(`Successfully exported ${fileName} to NAS`);
                    } catch (nasErr) {
                        console.error(`NAS Export Failed: ${nasErr.message}`);
                    }
                }

                resolve(fileName);
            });
        });
    }

    async uploadToNAS(localPath, remoteName, config) {
        const sftp = new SftpClient();
        try {
            await sftp.connect({
                host: config.nas_host,
                port: config.nas_port || 22,
                username: config.nas_user,
                password: config.nas_pass
            });

            // Create remote dir if not exists (simplified)
            const remoteDir = config.nas_path || '/';
            const exists = await sftp.exists(remoteDir);
            if (!exists) {
                await sftp.mkdir(remoteDir, true);
            }

            const remotePath = path.posix.join(remoteDir, remoteName);
            await sftp.put(localPath, remotePath);
            await sftp.end();
        } catch (err) {
            if (sftp) await sftp.end();
            throw err;
        }
    }

    getBackupFiles() {
        const backupDir = path.join(__dirname, '../uploads/backup');
        if (!fs.existsSync(backupDir)) return [];

        return fs.readdirSync(backupDir)
            .filter(file => file.endsWith('.sql'))
            .map(file => {
                const stats = fs.statSync(path.join(backupDir, file));
                return {
                    name: file,
                    size: stats.size,
                    date: stats.mtime
                };
            })
            .sort((a, b) => b.date - a.date);
    }
}

module.exports = new BackupService();
