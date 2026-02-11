const db = require('../config/db');

exports.index = async (req, res) => {
    try {
        const manualEvents = await db('calendar_event').select('*');

        // Fetch service plans
        const servicePlans = await db('service_plan as sp')
            .leftJoin('quotation as q', 'sp.quotation_id', 'q.id')
            .leftJoin('customer as c', 'q.customer_id', 'c.id')
            .select('sp.id', 'sp.plan_no', 'sp.target_date', 'c.name as customer_name')
            .whereNotNull('sp.target_date');

        const planEvents = servicePlans.map(plan => ({
            id: 'plan_' + plan.id,
            title: plan.plan_no + (plan.customer_name ? ' - ' + plan.customer_name : ''),
            start: plan.target_date,
            backgroundColor: '#10b981', // emerald-500
            textColor: '#ffffff',
            type: 'plan'
        }));

        const formattedManual = manualEvents.map(e => ({
            id: 'ev_' + e.id,
            title: e.title,
            start: e.start,
            backgroundColor: e.backgroundColor || '#fbbf24',
            textColor: e.textColor || '#000000',
            type: 'manual'
        }));

        const events = [...formattedManual, ...planEvents];

        const customerCount = await db('customer').count('* as count');
        const productCount = await db('product').count('* as count');
        const contractCount = await db('contract').where('status', 1).count('* as count');
        const poCount = await db('purch').where('status', 1).count('* as count');

        const stats = {
            customers: customerCount[0].count,
            products: productCount[0].count,
            contracts: contractCount[0].count,
            pos: poCount[0].count
        };

        res.render('dashboard/index', { events, stats });
    } catch (err) {
        console.error(err);
        res.status(500).send('Database Error');
    }
};

exports.findEvent = async (req, res) => {
    const { event_date } = req.body;
    try {
        if (!event_date) return res.send('');

        // event_date format might be MM/DD/YYYY from FullCalendar format('L')
        let formattedDate;
        if (event_date.includes('-')) {
            formattedDate = event_date;
        } else if (event_date.includes('/')) {
            const parts = event_date.split('/');
            if (parts.length === 3) {
                // If the first part is 4 digits, it's YYYY/MM/DD
                if (parts[0].length === 4) {
                    formattedDate = `${parts[0]}-${parts[1]}-${parts[2]}`;
                } else {
                    // Logic for DD/MM/YYYY or MM/DD/YYYY to YYYY-MM-DD
                    // We'll assume DD/MM/YYYY if the first part could be a day > 12
                    formattedDate = `${parts[2]}-${parts[1]}-${parts[0]}`;
                }
            } else {
                formattedDate = event_date;
            }
        } else {
            formattedDate = event_date;
        }

        const events = await db('calendar_event')
            .whereRaw('DATE(start) = ?', [formattedDate])
            .select('*');

        const plans = await db('service_plan as sp')
            .leftJoin('quotation as q', 'sp.quotation_id', 'q.id')
            .leftJoin('customer as c', 'q.customer_id', 'c.id')
            .select('sp.*', 'c.name as customer_name')
            .whereRaw('DATE(sp.target_date) = ?', [formattedDate]);

        let html = '';
        for (const event of events) {
            const planNo = event.param_id ? await getServicePlanNo(event.param_id) : '-';
            html += `
                <tr>
                    <td class="px-4 py-3 text-center">${new Date(event.start).toLocaleDateString('th-TH')}</td>
                    <td class="px-4 py-3 text-center"><a href="/service-plans/edit/${event.param_id}" class="text-emerald-600 hover:underline">${planNo}</a></td>
                    <td class="px-4 py-3">ลูกค้าทั่วไป</td>
                    <td class="px-4 py-3">${event.title}</td>
                    <td class="px-4 py-3 text-center"><span class="bg-amber-100 text-amber-800 text-xs font-bold px-2 py-0.5 rounded">นัดหมาย</span></td>
                </tr>
            `;
        }

        for (const plan of plans) {
            html += `
                <tr>
                    <td class="px-4 py-3 text-center">${new Date(plan.target_date).toLocaleDateString('th-TH')}</td>
                    <td class="px-4 py-3 text-center"><a href="/service-plans/edit/${plan.id}" class="text-emerald-600 hover:underline">${plan.plan_no}</a></td>
                    <td class="px-4 py-3">${plan.customer_name || '-'}</td>
                    <td class="px-4 py-3">แผนบริการ</td>
                    <td class="px-4 py-3 text-center"><span class="bg-emerald-100 text-emerald-800 text-xs font-bold px-2 py-0.5 rounded">Service Plan</span></td>
                </tr>
            `;
        }

        if (html === '') {
            html = '<tr><td colspan="5" class="text-center py-4 text-slate-400">ไม่มีรายการในวันนี้</td></tr>';
        }

        res.send(html);
    } catch (err) {
        console.error(err);
        res.status(500).send('Error finding events');
    }
};

exports.storeEvent = async (req, res) => {
    const { new_event_date, new_event_title } = req.body;
    try {
        await db('calendar_event').insert({
            start: new_event_date,
            title: new_event_title,
            status: 1,
            textColor: 'blue',
            backgroundColor: 'yellow'
        });
        res.redirect('/dashboard');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error creating event');
    }
};

async function getServicePlanNo(id) {
    const plan = await db('service_plan').where({ id }).first();
    return plan ? plan.plan_no : '-';
}
