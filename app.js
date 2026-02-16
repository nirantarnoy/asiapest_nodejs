require('dotenv').config();
const express = require('express');
const bodyParser = require('body-parser');
const session = require('express-session');
const path = require('path');
const db = require('./config/db');

const app = express();

// View Engine
app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'views'));

// Middleware
app.use(express.static(path.join(__dirname, 'public')));
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(session({
    secret: process.env.SESSION_SECRET || 'secret',
    resave: false,
    saveUninitialized: true
}));

const { accessLogger } = require('./utils/logger');
app.use(accessLogger);

// Route Middlewares for Auth
app.use((req, res, next) => {
    res.locals.user = req.session.user || null;
    res.locals.currentPath = req.path;
    next();
});

// Routes
const authRoutes = require('./routes/authRoutes');
const userRoutes = require('./routes/userRoutes');
const productRoutes = require('./routes/productRoutes');
const customerRoutes = require('./routes/customerRoutes');
const customerGroupRoutes = require('./routes/customerGroupRoutes');
const customerTypeRoutes = require('./routes/customerTypeRoutes');
const carRoutes = require('./routes/carRoutes');
const carTypeRoutes = require('./routes/carTypeRoutes');
const employeeRoutes = require('./routes/employeeRoutes');
const positionRoutes = require('./routes/positionRoutes');
const userGroupRoutes = require('./routes/userGroupRoutes');
const warehouseRoutes = require('./routes/warehouseRoutes');
const locationRoutes = require('./routes/locationRoutes');
const stockTransRoutes = require('./routes/stockTransRoutes');
const stockSumRoutes = require('./routes/stockSumRoutes');
const stockCountRoutes = require('./routes/stockCountRoutes');
const productTypeRoutes = require('./routes/productTypeRoutes');
const productGroupRoutes = require('./routes/productGroupRoutes');
const unitRoutes = require('./routes/unitRoutes');
const companyRoutes = require('./routes/companyRoutes');
const paymentMethodRoutes = require('./routes/paymentMethodRoutes');
const paymentTermRoutes = require('./routes/paymentTermRoutes');
const taskRoutes = require('./routes/taskRoutes');
const serviceTypeRoutes = require('./routes/serviceTypeRoutes');
const stdPriceRoutes = require('./routes/stdPriceRoutes');
const estimatePriceRoutes = require('./routes/estimatePriceRoutes');
const quotationRoutes = require('./routes/quotationRoutes');
const contractRoutes = require('./routes/contractRoutes');
const servicePlanRoutes = require('./routes/servicePlanRoutes');
const jobCardRoutes = require('./routes/jobCardRoutes');
const purchReqRoutes = require('./routes/purchReqRoutes');
const purchApproveRoutes = require('./routes/purchApproveRoutes');
const purchRoutes = require('./routes/purchRoutes');
const vendorsRoutes = require('./routes/vendorRoutes');
const journalIssueRoutes = require('./routes/journalIssueRoutes');
const reportRoutes = require('./routes/reportRoutes');
const dashboardRoutes = require('./routes/dashboardRoutes');
const importRoutes = require('./routes/importRoutes');
const backupRoutes = require('./routes/backupRoutes');
const workTaskRoutes = require('./routes/workTaskRoutes');
const serviceRoutes = require('./routes/serviceRoutes');
const complainRoutes = require('./routes/complainRoutes');
const logRoutes = require('./routes/logRoutes');
const rbacRoutes = require('./routes/rbacRoutes');

// Initialize Services
require('./services/BackupService');

app.use('/', authRoutes);
app.use('/users', userRoutes);
app.use('/products', productRoutes);
app.use('/customers', customerRoutes);
app.use('/customer-groups', customerGroupRoutes);
app.use('/customer-types', customerTypeRoutes);
app.use('/cars', carRoutes);
app.use('/car-types', carTypeRoutes);
app.use('/employees', employeeRoutes);
app.use('/positions', positionRoutes);
app.use('/user-groups', userGroupRoutes);
app.use('/warehouses', warehouseRoutes);
app.use('/locations', locationRoutes);
app.use('/stock-trans', stockTransRoutes);
app.use('/stock-sum', stockSumRoutes);
app.use('/stock-count', stockCountRoutes);
app.use('/product-types', productTypeRoutes);
app.use('/product-groups', productGroupRoutes);
app.use('/units', unitRoutes);
app.use('/company', companyRoutes);
app.use('/pay-methods', paymentMethodRoutes);
app.use('/pay-terms', paymentTermRoutes);
app.use('/tasks', taskRoutes);
app.use('/service-types', serviceTypeRoutes);
app.use('/std-prices', stdPriceRoutes);
app.use('/estimate-price', estimatePriceRoutes);
app.use('/quotations', quotationRoutes);
app.use('/contracts', contractRoutes);
app.use('/service-plans', servicePlanRoutes);
app.use('/job-cards', jobCardRoutes);
app.use('/pur-req', purchReqRoutes);
app.use('/pur-req-approve', purchApproveRoutes);
app.use('/pur-orders', purchRoutes);
app.use('/vendors', vendorsRoutes);
app.use('/journal-issue', journalIssueRoutes);
app.use('/reports', reportRoutes);
app.use('/dashboard', dashboardRoutes);
app.use('/import-master', importRoutes);
app.use('/backup', backupRoutes);
app.use('/work-tasks', workTaskRoutes);
app.use('/service', serviceRoutes);
app.use('/complain', complainRoutes);
app.use('/logs', logRoutes);
app.use('/rbac', rbacRoutes);

// Home Redirect
app.get('/', (req, res) => {
    if (req.session.user) {
        return res.redirect('/dashboard');
    }
    res.redirect('/login');
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`Server started on http://localhost:${PORT}`);
});
