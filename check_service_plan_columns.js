const db = require('./config/db');

async function checkColumns() {
    try {
        const columns = await db('service_plan').columnInfo();
        console.log(JSON.stringify(columns, null, 2));
    } catch (err) {
        console.error(err);
    } finally {
        process.exit();
    }
}

checkColumns();
