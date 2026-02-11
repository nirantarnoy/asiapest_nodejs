const db = require('../config/db');

async function createLogs() {
    try {
        const hasAccessLog = await db.schema.hasTable('access_log');
        if (!hasAccessLog) {
            await db.schema.createTable('access_log', table => {
                table.increments('id');
                table.integer('user_id').nullable();
                table.string('ip_address', 45);
                table.string('url', 255);
                table.string('method', 10);
                table.text('user_agent');
                table.timestamp('created_at').defaultTo(db.fn.now());
            });
            console.log('Created access_log');
        } else {
            console.log('access_log already exists');
        }

        const hasActionLog = await db.schema.hasTable('action_log');
        if (!hasActionLog) {
            await db.schema.createTable('action_log', table => {
                table.increments('id');
                table.integer('user_id').nullable();
                table.string('action', 50);
                table.string('table_name', 100);
                table.integer('row_id').nullable();
                table.text('data_before').nullable();
                table.text('data_after').nullable();
                table.string('ip_address', 45);
                table.timestamp('created_at').defaultTo(db.fn.now());
            });
            console.log('Created action_log');
        } else {
            console.log('action_log already exists');
        }
    } catch (e) {
        console.error(e);
    } finally {
        process.exit();
    }
}

createLogs();
