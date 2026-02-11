const db = require('./config/db');

async function checkContract() {
    try {
        const info = await db('contract').columnInfo();
        console.log(JSON.stringify(info, null, 2));
    } catch (err) {
        console.error(err);
    } finally {
        process.exit();
    }
}

checkContract();
