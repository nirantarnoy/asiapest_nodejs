const db = require('../config/db');
const fs = require('fs');
const path = require('path');

const ROUTES_DIR = path.join(__dirname, '../routes');

async function syncPermissions() {
    console.log('--- Starting Permission Sync ---');

    try {
        const files = fs.readdirSync(ROUTES_DIR);
        const permissions = new Set();

        for (const file of files) {
            if (file.endsWith('.js')) {
                const filePath = path.join(ROUTES_DIR, file);
                const content = fs.readFileSync(filePath, 'utf8');

                // Simple regex to find router.get, .post, etc.
                // Looking for patterns like router.get('/path', ...)
                const routeRegex = /router\.(get|post|put|delete|patch)\(\s*['"]([^'"]+)['"]/g;
                let match;

                // Prefix based on filename (e.g., authRoutes.js -> auth)
                const prefix = file.replace('Routes.js', '').toLowerCase();

                while ((match = routeRegex.exec(content)) !== null) {
                    const method = match[1].toUpperCase();
                    const rawPath = match[2];

                    // Format: "prefix/path" (cleaned)
                    let cleanPath = rawPath === '/' ? '' : rawPath;
                    if (cleanPath.startsWith('/')) cleanPath = cleanPath.substring(1);

                    const permissionName = cleanPath ? `${prefix}/${cleanPath}` : prefix;
                    permissions.add(permissionName);
                }
            }
        }

        console.log(`Found ${permissions.size} unique permissions.`);

        const now = Math.floor(Date.now() / 1000);
        let createdCount = 0;

        for (const name of permissions) {
            // Check if exists
            const existing = await db('auth_item').where({ name }).first();

            if (!existing) {
                await db('auth_item').insert({
                    name: name,
                    type: 2, // Permission
                    description: `Auto-generated permission for ${name}`,
                    created_at: now,
                    updated_at: now
                });
                createdCount++;
                console.log(`[+] Added: ${name}`);
            }
        }

        console.log('--- Sync Completed ---');
        console.log(`Summary: ${createdCount} new permissions added.`);
        process.exit(0);

    } catch (err) {
        console.error('Error during sync:', err);
        process.exit(1);
    }
}

syncPermissions();
