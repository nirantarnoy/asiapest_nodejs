const bcrypt = require('bcryptjs');

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> } 
 */
exports.seed = async function (knex) {
  // Deletes ALL existing entries
  await knex('user').del();

  const admin_hash = await bcrypt.hash('admin123', 10);
  const test_admin_hash = await bcrypt.hash('admin1234', 10);

  await knex('user').insert([
    { username: 'admin', password_hash: admin_hash, email: 'admin@example.com', status: 1 },
    { username: 'admintest', password_hash: test_admin_hash, email: 'test@example.com', status: 1 }
  ]);
};
