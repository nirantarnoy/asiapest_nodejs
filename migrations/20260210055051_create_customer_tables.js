exports.up = function (knex) {
    return knex.schema
        .createTable('customer_group', table => {
            table.increments('id').primary();
            table.string('code').unique().notNullable();
            table.string('name').notNullable();
            table.string('description');
            table.integer('status').defaultTo(1);
            table.integer('created_by');
            table.integer('updated_by');
            table.timestamps(true, true);
        })
        .createTable('customer_type', table => {
            table.increments('id').primary();
            table.string('code').unique().notNullable();
            table.string('name').notNullable();
            table.string('description');
            table.integer('status').defaultTo(1);
            table.integer('created_by');
            table.integer('updated_by');
            table.timestamps(true, true);
        })
        .createTable('customer', table => {
            table.increments('id').primary();
            table.string('code').unique().notNullable();
            table.string('name').notNullable();
            table.string('description');
            table.integer('customer_group_id');
            table.integer('customer_type_id');
            table.integer('payment_method_id');
            table.integer('payment_term_id');
            table.string('phone');
            table.string('contact_name');
            table.string('tax_id');
            table.string('email');
            table.text('address');
            table.string('shop_photo');
            table.string('location_info');
            table.integer('status').defaultTo(1);
            table.integer('created_by');
            table.integer('updated_by');
            table.timestamps(true, true);
        });
};

exports.down = function (knex) {
    return knex.schema
        .dropTableIfExists('customer')
        .dropTableIfExists('customer_type')
        .dropTableIfExists('customer_group');
};
