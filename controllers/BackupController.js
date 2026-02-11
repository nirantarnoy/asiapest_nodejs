const backupService = require('../services/BackupService');
const path = require('path');
const fs = require('fs');

exports.index = (req, res) => {
    const files = backupService.getBackupFiles();
    const config = backupService.getConfig();
    res.render('backup/index', {
        files,
        config,
        msg: req.query.msg || null,
        error: req.query.error || null
    });
};

exports.runManualBackup = async (req, res) => {
    try {
        const fileName = await backupService.runBackup();
        res.redirect('/backup?msg=สำรองข้อมูลและส่งออกไปยัง NAS แล้ว (หากเปิดใช้งาน): ' + fileName);
    } catch (err) {
        console.error(err);
        res.redirect('/backup?error=เกิดข้อผิดพลาดในการสำรองข้อมูล: ' + err.message);
    }
};

exports.updateSettings = (req, res) => {
    const { schedule, enabled, nas_enabled, nas_host, nas_port, nas_user, nas_pass, nas_path } = req.body;
    try {
        backupService.saveConfig({
            schedule: schedule || '0 0 * * *',
            enabled: enabled === 'true',
            nas_enabled: nas_enabled === 'true',
            nas_host: nas_host || '',
            nas_port: parseInt(nas_port) || 22,
            nas_user: nas_user || '',
            nas_pass: nas_pass || '',
            nas_path: nas_path || ''
        });
        res.redirect('/backup?msg=บันทึกการตั้งค่าสำเร็จ');
    } catch (err) {
        console.error(err);
        res.redirect('/backup?error=เกิดข้อผิดพลาดในการบันทึกการตั้งค่า');
    }
};

exports.download = (req, res) => {
    const { fileName } = req.params;
    const filePath = path.join(__dirname, '../uploads/backup', fileName);

    if (fs.existsSync(filePath)) {
        res.download(filePath);
    } else {
        res.status(404).send('File not found');
    }
};

exports.delete = (req, res) => {
    const { fileName } = req.params;
    const filePath = path.join(__dirname, '../uploads/backup', fileName);

    try {
        if (fs.existsSync(filePath)) {
            fs.unlinkSync(filePath);
            res.redirect('/backup?msg=ลบไฟล์สำรองข้อมูลเรียบร้อย');
        } else {
            res.redirect('/backup?error=ไม่พบไฟล์ที่ต้องการลบ');
        }
    } catch (err) {
        res.redirect('/backup?error=เกิดข้อผิดพลาดในการลบไฟล์');
    }
};
