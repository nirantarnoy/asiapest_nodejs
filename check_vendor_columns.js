const fs = require('fs');
const db = require('./config/db');

async function checkColumns() {
    try {
        const columns = await db('vendor').columnInfo();
        fs.writeFileSync('vendor_columns.json', JSON.stringify(columns, null, 2));
    } catch (err) {
        console.error(err);
    } finally {
        process.exit();
    }
}

checkColumns();
