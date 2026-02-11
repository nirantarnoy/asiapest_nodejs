const fs = require('fs');
const db = require('./config/db');

async function checkColumns() {
    try {
        const columns = await db('customer').columnInfo();
        fs.writeFileSync('customer_columns.json', JSON.stringify(columns, null, 2));
    } catch (err) {
        console.error(err);
    } finally {
        process.exit();
    }
}

checkColumns();
