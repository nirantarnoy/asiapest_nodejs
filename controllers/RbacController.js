const db = require('../config/db');

exports.roles = async (req, res) => {
    try {
        const roles = await db('auth_item').where({ type: 1 }).orderBy('name', 'asc');
        res.render('rbac/roles', { roles });
    } catch (err) {
        console.error(err);
        res.status(500).send('Database Error');
    }
};

exports.rolePermissions = async (req, res) => {
    const { roleName } = req.params;
    try {
        const role = await db('auth_item').where({ name: roleName, type: 1 }).first();
        if (!role) return res.status(404).send('Role not found');

        // All available permissions (type 2)
        const allPermissions = await db('auth_item').where({ type: 2 }).orderBy('name', 'asc');

        // Current assigned permissions for this role
        const assigned = await db('auth_item_child').where({ parent: roleName }).select('child');
        const assignedNames = assigned.map(a => a.child);

        // Group permissions by prefix for better UI (e.g., "auth/", "product/")
        const grouped = {};
        allPermissions.forEach(p => {
            const part = p.name.split('/');
            const group = part.length > 1 ? part[0] : 'other';
            if (!grouped[group]) grouped[group] = [];
            grouped[group].push(p);
        });

        res.render('rbac/role_permissions', { role, grouped, assignedNames });
    } catch (err) {
        console.error(err);
        res.status(500).send('Database Error');
    }
};

exports.updateRolePermissions = async (req, res) => {
    const { roleName } = req.params;
    const { permissions } = req.body; // Array of permission names

    const trx = await db.transaction();
    try {
        // 1. Delete old assignments
        await trx('auth_item_child').where({ parent: roleName }).delete();

        // 2. Insert new ones
        if (permissions && permissions.length > 0) {
            const pArray = Array.isArray(permissions) ? permissions : [permissions];
            const inserts = pArray.map(p => ({
                parent: roleName,
                child: p
            }));
            await trx('auth_item_child').insert(inserts);
        }

        await trx.commit();
        res.redirect(`/rbac/permissions/${encodeURIComponent(roleName)}?success=1`);
    } catch (err) {
        await trx.rollback();
        console.error(err);
        res.status(500).send('Error updating permissions');
    }
};
