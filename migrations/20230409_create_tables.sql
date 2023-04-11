-- migrate:up
create table category (
    id serial primary key,
    parent_category_id integer REFERENCES category ON DELETE CASCADE,
    category_name varchar(200) not null
);

create table products (
    id serial primary key,
    category_id integer references category(id) ON DELETE CASCADE,
    product_name varchar(200) not null,
    cost numeric not null,
    description text
);

create index category_name_index on category(category_name);
create index product_name_index on products(product_name);
create index product_cost_index on products(cost);

-- migrate:down
drop table category, products;