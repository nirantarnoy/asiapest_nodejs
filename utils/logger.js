const db = require('../config/db');

/**
 * Access Logger Middleware
 */
exports.accessLogger = async (req, res, next) => {
    try {
        await db('access_log').insert({
            user_id: req.session.user ? req.session.user.id : null,
            ip_address: req.ip || req.connection.remoteAddress,
            url: req.originalUrl,
            method: req.method,
            user_agent: req.headers['user-agent'],
            created_at: db.fn.now()
        });
    } catch (err) {
        console.error('Access Log Error:', err);
    }
    next();
};

/**
 * Action Logger Helper
 */
exports.logAction = async ({ req, action, tableName, rowId, dataBefore, dataAfter }) => {
    try {
        await db('action_log').insert({
            user_id: req.session.user ? req.session.user.id : null,
            action: action, // e.g., 'CREATE', 'UPDATE', 'DELETE'
            table_name: tableName,
            row_id: rowId,
            data_before: dataBefore ? JSON.stringify(dataBefore) : null,
            data_after: dataAfter ? JSON.stringify(dataAfter) : null,
            ip_address: req.ip || req.connection.remoteAddress,
            created_at: db.fn.now()
        });
    } catch (err) {
        console.error('Action Log Error:', err);
    }
};
