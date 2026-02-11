const db = require('./config/db');

async function checkJobCard() {
    try {
        const info = await db('job_card').columnInfo();
        console.log(JSON.stringify(info, null, 2));
    } catch (err) {
        console.error(err);
    } finally {
        process.exit();
    }
}

checkJobCard();
