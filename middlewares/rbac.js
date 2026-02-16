const db = require('../config/db');

/**
 * Check if user has a specific permission
 * @param {number} userId 
 * @param {string} permissionName 
 */
async function hasPermission(userId, permissionName) {
    // 1. Get all roles assigned to this user
    const assignments = await db('auth_assignment').where({ user_id: String(userId) }).select('item_name');
    const userRoles = assignments.map(a => a.item_name);

    if (userRoles.length === 0) return false;

    // 2. Check if the permission is directly assigned to any of these roles
    // We'll use a recursive-like approach or a flatter approach if we assume 1 level (Role -> Permission)
    // For simplicity and performance, we'll fetch all children of these roles

    // Breadth-first search for permissions
    let itemsToCheck = [...userRoles];
    const checkedItems = new Set();
    const foundPermissions = new Set();

    while (itemsToCheck.length > 0) {
        const current = itemsToCheck.shift();
        if (checkedItems.has(current)) continue;
        checkedItems.add(current);

        // Find children of this item
        const children = await db('auth_item_child').where({ parent: current }).select('child');
        for (const child of children) {
            if (child.child === permissionName) return true; // Found it!

            // If it's not the target, add to check list (it might be another role/group)
            itemsToCheck.push(child.child);
        }
    }

    return false;
}

const can = (permissionName) => {
    return async (req, res, next) => {
        if (!req.session.user) {
            return res.redirect('/login');
        }

        const userId = req.session.user.id;

        // Super admin bypass
        if (req.session.user.username === 'admin') return next();

        const allowed = await hasPermission(userId, permissionName);

        if (allowed) {
            return next();
        } else {
            // Check if it's an AJAX request
            if (req.xhr || req.headers.accept.indexOf('json') > -1) {
                return res.status(403).json({ error: 'Permission Denied', message: `You need ${permissionName} permission.` });
            }
            res.status(403).render('error/403', { permissionName });
        }
    };
};

module.exports = { can, hasPermission };
