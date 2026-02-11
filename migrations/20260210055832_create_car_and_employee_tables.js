exports.up = function (knex) {
    return knex.schema
        .createTable('car_type', table => {
            table.increments('id').primary();
            table.string('code').unique().notNullable();
            table.string('name').notNullable();
            table.string('description');
            table.integer('status').defaultTo(1);
            table.integer('created_by');
            table.integer('updated_by');
            table.timestamps(true, true);
        })
        .createTable('car', table => {
            table.increments('id').primary();
            table.string('code').unique().notNullable();
            table.string('name').notNullable();
            table.string('description');
            table.integer('car_type_id');
            table.string('plate_number');
            table.string('photo');
            table.integer('status').defaultTo(1);
            table.integer('created_by');
            table.integer('updated_by');
            table.timestamps(true, true);
        })
        .createTable('position', table => {
            table.increments('id').primary();
            table.string('code').unique().notNullable();
            table.string('name').notNullable();
            table.string('description');
            table.integer('status').defaultTo(1);
            table.integer('created_by');
            table.integer('updated_by');
            table.timestamps(true, true);
        })
        .createTable('employee', table => {
            table.increments('id').primary();
            table.string('code').unique().notNullable();
            table.string('fname').notNullable();
            table.string('lname').notNullable();
            table.integer('gender');
            table.integer('position_id');
            table.integer('salary_type');
            table.date('emp_start');
            table.string('description');
            table.string('photo');
            table.integer('status').defaultTo(1);
            table.integer('created_by');
            table.integer('updated_by');
            table.timestamps(true, true);
        });
};

exports.down = function (knex) {
    return knex.schema
        .dropTableIfExists('employee')
        .dropTableIfExists('position')
        .dropTableIfExists('car')
        .dropTableIfExists('car_type');
};
