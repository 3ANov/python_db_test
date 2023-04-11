-- migrate:up
create table products (
 id serial primary key,
 name varchar(20) not null,
 description text,
 cost numeric not null
);
insert into products (name, description, cost) values('some name', 'some description', 10);

update products set name='new name' where id=1;

delete from products where id=1;

select * from products where name='some name';
create index name_index on products(name);
create index cost_index on products(cost);

-- migrate:down