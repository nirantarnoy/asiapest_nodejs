const fs = require('fs');
const db = require('./config/db');

async function getSchema() {
    try {
        const qJob = await db('quotation_job').columnInfo();
        const qJobLine = await db('quotation_job_line').columnInfo();
        const sPlan = await db('service_plan').columnInfo();

        fs.writeFileSync('schema_info.json', JSON.stringify({
            quotation_job: qJob,
            quotation_job_line: qJobLine,
            service_plan: sPlan
        }, null, 2));
    } catch (err) {
        console.error(err);
    } finally {
        process.exit();
    }
}

getSchema();
