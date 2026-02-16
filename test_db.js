require('dotenv').config();
const mysql = require('mysql2/promise');

async function testConnection() {
    console.log('--- Testing Database Connection ---');
    console.log('Host:', process.env.DB_HOST || 'localhost');
    console.log('User:', process.env.DB_USER || 'root');
    console.log('Database:', process.env.DB_NAME || 'asiapest');
    console.log('Password set:', process.env.DB_PASS ? 'YES' : 'NO');

    try {
        const connection = await mysql.createConnection({
            host: process.env.DB_HOST || 'localhost',
            user: process.env.DB_USER || 'root',
            password: process.env.DB_PASS || '',
            database: process.env.DB_NAME || 'asiapest'
        });

        console.log('✅ Connection Successful!');
        await connection.end();
    } catch (err) {
        console.error('❌ Connection Failed!');
        console.error('Error Code:', err.code);
        console.error('Error Message:', err.sqlMessage);

        if (err.code === 'ER_ACCESS_DENIED_ERROR') {
            console.log('\n💡 Suggestion: The password for user "root" is incorrect or missing on this server.');
            console.log('Please check your .env file and ensure DB_PASS is set correctly.');
        }
    }
}

testConnection();
