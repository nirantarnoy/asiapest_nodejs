const db = require('../config/db');
const XLSX = require('xlsx');
const fs = require('fs');
const path = require('path');

exports.index = (req, res) => {
    res.render('import-master/index', { msg: req.query.msg || null, error: req.query.error || null });
};

// Export Patterns
exports.exportCustomerPattern = (req, res) => {
    const data = [
        ['Code', 'Name', 'Description', 'Phone', 'Email', 'Address', 'Tax ID', 'Contact Name']
    ];
    const ws = XLSX.utils.aoa_to_sheet(data);
    const wb = XLSX.utils.book_new();
    XLSX.utils.book_append_sheet(wb, ws, "Customers");
    const buffer = XLSX.write(wb, { type: 'buffer', bookType: 'xlsx' });
    res.setHeader('Content-Type', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
    res.setHeader('Content-Disposition', 'attachment; filename=customer_pattern.xlsx');
    res.send(buffer);
};

exports.exportEmployeePattern = (req, res) => {
    const data = [
        ['Code', 'First Name', 'Last Name', 'Description']
    ];
    const ws = XLSX.utils.aoa_to_sheet(data);
    const wb = XLSX.utils.book_new();
    XLSX.utils.book_append_sheet(wb, ws, "Employees");
    const buffer = XLSX.write(wb, { type: 'buffer', bookType: 'xlsx' });
    res.setHeader('Content-Type', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
    res.setHeader('Content-Disposition', 'attachment; filename=employee_pattern.xlsx');
    res.send(buffer);
};

exports.exportProductPattern = (req, res) => {
    const data = [
        ['Code', 'Name', 'Description', 'Sale Price', 'Standard Cost']
    ];
    const ws = XLSX.utils.aoa_to_sheet(data);
    const wb = XLSX.utils.book_new();
    XLSX.utils.book_append_sheet(wb, ws, "Products");
    const buffer = XLSX.write(wb, { type: 'buffer', bookType: 'xlsx' });
    res.setHeader('Content-Type', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
    res.setHeader('Content-Disposition', 'attachment; filename=product_pattern.xlsx');
    res.send(buffer);
};

// Imports
exports.importCustomer = async (req, res) => {
    if (!req.file) return res.redirect('/import-master?error=กรุณาเลือกไฟล์');
    try {
        const workbook = XLSX.readFile(req.file.path);
        const sheetName = workbook.SheetNames[0];
        const worksheet = workbook.Sheets[sheetName];
        const results = XLSX.utils.sheet_to_json(worksheet, { header: 1 });

        let successCount = 0;
        for (let i = 1; i < results.length; i++) { // Skip header
            const row = results[i];
            const code = row[0];
            const name = row[1];
            const description = row[2];
            const phone = row[3];
            const email = row[4];
            const address = row[5];
            const tax_id = row[6];
            const contact_name = row[7];

            if (!name) continue;

            const exist = await db('customer').where({ name }).first();
            if (exist) continue;

            let nextCode = code;
            if (!nextCode) {
                const lastCust = await db('customer').orderBy('id', 'desc').first();
                nextCode = lastCust ? `CUS-${(parseInt(lastCust.id) + 1).toString().padStart(5, '0')}` : 'CUS-00001';
            }

            await db('customer').insert({
                code: nextCode,
                name,
                description,
                phone,
                email,
                address,
                tax_id,
                contact_name,
                status: 1,
                created_by: req.session.user.id,
                created_at: Math.floor(Date.now() / 1000)
            });
            successCount++;
        }
        fs.unlinkSync(req.file.path);
        res.redirect(`/import-master?msg=นำเข้าข้อมูลลูกค้าเรียบร้อย ${successCount} รายการ`);
    } catch (err) {
        if (fs.existsSync(req.file.path)) fs.unlinkSync(req.file.path);
        console.error(err);
        res.redirect('/import-master?error=เกิดข้อผิดพลาดในการนำเข้าข้อมูล');
    }
};

exports.importEmployee = async (req, res) => {
    if (!req.file) return res.redirect('/import-master?error=กรุณาเลือกไฟล์');
    try {
        const workbook = XLSX.readFile(req.file.path);
        const sheetName = workbook.SheetNames[0];
        const worksheet = workbook.Sheets[sheetName];
        const results = XLSX.utils.sheet_to_json(worksheet, { header: 1 });

        let successCount = 0;
        for (let i = 1; i < results.length; i++) {
            const row = results[i];
            const code = row[0];
            const fname = row[1];
            const lname = row[2];
            const description = row[3];

            if (!fname) continue;

            const exist = await db('employee').where({ fname, lname }).first();
            if (exist) continue;

            await db('employee').insert({
                code,
                fname,
                lname,
                description,
                status: 1,
                created_by: req.session.user.id,
                created_at: Math.floor(Date.now() / 1000)
            });
            successCount++;
        }
        fs.unlinkSync(req.file.path);
        res.redirect(`/import-master?msg=นำเข้าข้อมูลพนักงานเรียบร้อย ${successCount} รายการ`);
    } catch (err) {
        if (fs.existsSync(req.file.path)) fs.unlinkSync(req.file.path);
        console.error(err);
        res.redirect('/import-master?error=เกิดข้อผิดพลาดในการนำเข้าข้อมูล');
    }
};

exports.importProduct = async (req, res) => {
    if (!req.file) return res.redirect('/import-master?error=กรุณาเลือกไฟล์');
    try {
        const workbook = XLSX.readFile(req.file.path);
        const sheetName = workbook.SheetNames[0];
        const worksheet = workbook.Sheets[sheetName];
        const results = XLSX.utils.sheet_to_json(worksheet, { header: 1 });

        let successCount = 0;
        for (let i = 1; i < results.length; i++) {
            const row = results[i];
            const code = row[0];
            const name = row[1];
            const description = row[2];
            const sale_price = row[3];
            const std_cost = row[4];

            if (!code || !name) continue;

            const exist = await db('product').where({ code }).first();
            if (exist) continue;

            await db('product').insert({
                code,
                name,
                description,
                sale_price: sale_price || 0,
                std_cost: std_cost || 0,
                status: 1,
                created_by: req.session.user.id,
                created_at: Math.floor(Date.now() / 1000)
            });
            successCount++;
        }
        fs.unlinkSync(req.file.path);
        res.redirect(`/import-master?msg=นำเข้าข้อมูลสินค้าเรียบร้อย ${successCount} รายการ`);
    } catch (err) {
        if (fs.existsSync(req.file.path)) fs.unlinkSync(req.file.path);
        console.error(err);
        res.redirect('/import-master?error=เกิดข้อผิดพลาดในการนำเข้าข้อมูล');
    }
};
