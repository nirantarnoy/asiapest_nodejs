/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.up = function (knex) {
    return knex.schema
        .createTable('user', table => {
            table.increments('id').primary();
            table.string('username').unique().notNullable();
            table.string('password_hash').notNullable();
            table.string('email').unique();
            table.string('auth_key');
            table.integer('status').defaultTo(1); // 1 = Active
            table.integer('group_id');
            table.integer('emp_id');
            table.timestamps(true, true);
        })
        .createTable('product', table => {
            table.increments('id').primary();
            table.string('code').unique().notNullable();
            table.string('name').notNullable();
            table.text('description');
            table.string('photo');
            table.integer('product_group_id');
            table.integer('product_type_id');
            table.decimal('min_stock', 15, 2);
            table.decimal('max_stock', 15, 2);
            table.decimal('std_cost', 15, 2);
            table.decimal('sale_price', 15, 2);
            table.decimal('sale_price2', 15, 2);
            table.integer('unit_id');
            table.integer('status').defaultTo(1);
            table.integer('created_by');
            table.integer('updated_by');
            table.timestamps(true, true);
        });
};

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.down = function (knex) {
    return knex.schema
        .dropTableIfExists('product')
        .dropTableIfExists('user');
};
