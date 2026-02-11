const db = require('../config/db');

exports.index = async (req, res) => {
    try {
        const page = parseInt(req.query.page) || 1;
        const limit = req.query.limit === 'all' ? null : parseInt(req.query.limit) || 20;
        const search = req.query.search || '';

        // Build base query
        let countQuery = db('purch as p')
            .leftJoin('vendor as v', 'p.vendor_id', 'v.id');

        let query = db('purch as p')
            .leftJoin('vendor as v', 'p.vendor_id', 'v.id')
            .select('p.*', 'v.name as vendor_name')
            .orderBy('p.id', 'desc');

        // Apply search filter
        if (search) {
            const searchCondition = (builder) => {
                builder
                    .where('p.purch_no', 'like', `%${search}%`)
                    .orWhere('p.note', 'like', `%${search}%`)
                    .orWhere('v.name', 'like', `%${search}%`);
            };
            query.where(searchCondition);
            countQuery.where(searchCondition);
        }

        const totalQuery = await countQuery.count('p.id as count');
        const total = totalQuery[0].count;

        if (limit) {
            const offset = (page - 1) * limit;
            query = query.limit(limit).offset(offset);
        }

        const items = await query;
        const totalPages = limit ? Math.ceil(total / limit) : 1;

        res.render('purch/index', {
            items,
            pagination: {
                page,
                limit: limit || 'all',
                total,
                totalPages
            },
            search
        });
    } catch (err) {
        console.error(err);
        res.status(500).send('Database Error');
    }
};

exports.create = async (req, res) => {
    const { pr_id } = req.query;
    try {
        const vendors = await db('vendor').select('id', 'name');
        const products = await db('product').select('id', 'code', 'name');
        const approvedPRLines = await db('purch_req_line as prl')
            .leftJoin('purch_req as pr', 'prl.purch_req_id', 'pr.id')
            .leftJoin('product as p', 'prl.product_id', 'p.id')
            .select('prl.*', 'pr.purch_req_no', 'p.code as product_code', 'p.name as product_name')
            .where('prl.status', 4); // Approved but not converted

        let autoImportLines = [];
        if (pr_id) {
            autoImportLines = approvedPRLines.filter(l => l.purch_req_id == pr_id);
        }

        res.render('purch/create', { vendors, products, approvedPRLines, autoImportLines });
    } catch (err) {
        console.error(err);
        res.status(500).send('Database Error');
    }
};

exports.store = async (req, res) => {
    const { purch_date, vendor_id, note, lines, pr_line_ids } = req.body;
    const trx = await db.transaction();
    try {
        const lastNo = await generatePONo(trx);
        const [id] = await trx('purch').insert({
            purch_no: lastNo,
            purch_date: purch_date || new Date().toISOString().split('T')[0],
            vendor_id: vendor_id || null,
            note,
            status: 1,
            created_by: req.session.user.id,
            created_at: Math.floor(Date.now() / 1000)
        });

        if (lines && Array.isArray(lines)) {
            const lineData = lines.filter(l => l.product_id).map(line => ({
                purch_id: id,
                product_id: line.product_id,
                qty: line.qty || 0,
                price: line.price || 0,
                remain_qty: line.qty || 0,
                line_total: (line.qty || 0) * (line.price || 0),
                status: 1,
                purch_req_id: line.purch_req_id || null
            }));
            if (lineData.length > 0) {
                await trx('purch_line').insert(lineData);
            }
        }

        // If converting from PR
        if (pr_line_ids && Array.isArray(pr_line_ids)) {
            await trx('purch_req_line').whereIn('id', pr_line_ids).update({
                status: 5, // Converted
                // purch_id: id // if needed
            });
        }

        await trx.commit();
        res.redirect('/pur-orders');
    } catch (err) {
        await trx.rollback();
        console.error(err);
        res.status(500).send('Error creating PO');
    }
};

exports.edit = async (req, res) => {
    const { id } = req.params;
    try {
        const item = await db('purch').where({ id }).first();
        const lines = await db('purch_line as pl')
            .leftJoin('product as p', 'pl.product_id', 'p.id')
            .select('pl.*', 'p.code as product_code', 'p.name as product_name')
            .where({ purch_id: id });
        const vendors = await db('vendor').select('id', 'name');
        const products = await db('product').select('id', 'code', 'name');
        res.render('purch/edit', { item, lines, vendors, products });
    } catch (err) {
        console.error(err);
        res.status(500).send('Database Error');
    }
};

exports.update = async (req, res) => {
    const { id } = req.params;
    const { purch_date, vendor_id, note, lines } = req.body;
    const trx = await db.transaction();
    try {
        await trx('purch').where({ id }).update({
            purch_date,
            vendor_id: vendor_id || null,
            note,
            updated_at: Math.floor(Date.now() / 1000)
        });

        await trx('purch_line').where({ purch_id: id }).delete();
        if (lines && Array.isArray(lines)) {
            const lineData = lines.filter(l => l.product_id).map(line => ({
                purch_id: id,
                product_id: line.product_id,
                qty: line.qty || 0,
                price: line.price || 0,
                remain_qty: line.qty || 0,
                line_total: (line.qty || 0) * (line.price || 0),
                status: 1
            }));
            if (lineData.length > 0) {
                await trx('purch_line').insert(lineData);
            }
        }

        await trx.commit();
        res.redirect('/pur-orders');
    } catch (err) {
        await trx.rollback();
        console.error(err);
        res.status(500).send('Error updating PO');
    }
};

exports.delete = async (req, res) => {
    const { id } = req.params;
    const trx = await db.transaction();
    try {
        await trx('purch_line').where({ purch_id: id }).delete();
        await trx('purch').where({ id }).delete();
        await trx.commit();
        res.redirect('/pur-orders');
    } catch (err) {
        await trx.rollback();
        console.error(err);
        res.status(500).send('Error deleting PO');
    }
};

exports.print = async (req, res) => {
    const { id } = req.params;
    try {
        const item = await db('purch as p')
            .leftJoin('vendor as v', 'p.vendor_id', 'v.id')
            .select('p.*', 'v.name as vendor_name', 'v.location as vendor_address')
            .where('p.id', id)
            .first();

        const lines = await db('purch_line as pl')
            .leftJoin('product as p', 'pl.product_id', 'p.id')
            .select('pl.*', 'p.name as product_name')
            .where({ purch_id: id });

        const company = await db('company').first();

        res.render('purch/print', { item, lines, company });
    } catch (err) {
        console.error(err);
        res.status(500).send('Print Error');
    }
};

exports.receiveItems = async (req, res) => {
    const { id } = req.params;
    try {
        const lines = await db('purch_line as pl')
            .leftJoin('product as p', 'pl.product_id', 'p.id')
            .select('pl.*', 'p.code as product_code', 'p.name as product_name')
            .where('pl.purch_id', id)
            .andWhere('pl.remain_qty', '>', 0);

        res.json(lines);
    } catch (err) {
        console.error(err);
        res.status(500).json({ error: 'Error fetching receive items' });
    }
};

exports.saveReceive = async (req, res) => {
    const { po_id, receives } = req.body; // receives: [{line_id, product_id, qty}]
    const trx = await db.transaction();
    try {
        for (const item of receives) {
            const qty = parseFloat(item.qty);
            if (!qty || qty <= 0) continue;

            // 1. Stock Trans
            await trx('stock_trans').insert({
                trans_no: await generateStockTransNo(trx, 1), // 1 is IN
                trans_date: new Date(),
                product_id: item.product_id,
                qty: qty,
                ref_id: po_id,
                trans_module_id: 2, // 2 = Purchase
                trans_stock_type: 1, // 1 = IN
                created_at: Math.floor(Date.now() / 1000)
            });

            // 2. Update Stock Sum
            const exist = await trx('stock_sum').where({ product_id: item.product_id }).first();
            if (exist) {
                await trx('stock_sum').where({ product_id: item.product_id }).update({
                    qty: exist.qty + qty
                });
            } else {
                await trx('stock_sum').insert({
                    product_id: item.product_id,
                    qty: qty,
                    warehouse_id: 1,
                    location_id: 1,
                    status: 1
                });
            }

            // 3. Update Purch line remain
            const pl = await trx('purch_line').where({ id: item.line_id }).first();
            if (pl) {
                const newRemain = pl.remain_qty - qty;
                await trx('purch_line').where({ id: item.line_id }).update({
                    remain_qty: newRemain > 0 ? newRemain : 0
                });
            }
        }

        // 4. Check if PO completed
        const remainTotal = await trx('purch_line').where({ purch_id: po_id }).sum('remain_qty as total');
        if (remainTotal[0].total <= 0) {
            await trx('purch').where({ id: po_id }).update({ status: 5 }); // Status 5 = Completed
        } else {
            await trx('purch').where({ id: po_id }).update({ status: 2 }); // Status 2 = Partial Received
        }

        await trx.commit();
        res.json({ success: true });
    } catch (err) {
        await trx.rollback();
        console.error(err);
        res.status(500).json({ error: err.message });
    }
};

async function generateStockTransNo(trx, type) {
    const prefix = type === 1 ? 'RIN' : 'ROT';
    const date = new Date();
    const dateStr = date.getFullYear().toString().substr(-2) + (date.getMonth() + 1).toString().padStart(2, '0');
    const last = await trx('stock_trans').where('trans_no', 'like', prefix + dateStr + '%').orderBy('trans_no', 'desc').first();
    if (last) {
        const lastNum = parseInt(last.trans_no.substr(-4));
        return prefix + dateStr + (lastNum + 1).toString().padStart(4, '0');
    }
    return prefix + dateStr + '0001';
}

async function generatePONo(trx) {
    const date = new Date();
    const prefix = 'PO' + date.getFullYear().toString().substr(-2) + (date.getMonth() + 1).toString().padStart(2, '0');
    const lastPO = await trx('purch').where('purch_no', 'like', prefix + '%').orderBy('purch_no', 'desc').first();
    if (lastPO) {
        const lastNum = parseInt(lastPO.purch_no.substr(-4));
        return prefix + (lastNum + 1).toString().padStart(4, '0');
    }
    return prefix + '0001';
}
