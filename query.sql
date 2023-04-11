select * from category where parent_category_id is NULL;

select * from products where category_id in
(select id from category where category_name like '%Мониторы%');

select * from products where category_id in
(select id from category where category_name like '%Видеокарты NVIDIA%');