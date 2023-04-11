-- migrate:up
INSERT INTO category (category_name) VALUES ('Бытовая техника');
INSERT INTO category (category_name) VALUES ('Компьютерная техника');
INSERT INTO category (parent_category_id, category_name) VALUES (2, 'Мониторы');
INSERT INTO category (parent_category_id, category_name) VALUES (2, 'HDD');
INSERT INTO category (parent_category_id, category_name) VALUES (2, 'Видеокарты');
INSERT INTO category (parent_category_id, category_name) VALUES (4, 'HDD фирмы Seagate');
INSERT INTO category (parent_category_id, category_name) VALUES (4, 'HDD фирмы WD');
INSERT INTO category (parent_category_id, category_name) VALUES (4, 'HDD фирмы Toshiba');
INSERT INTO category (parent_category_id, category_name) VALUES (5, 'Видеокарты NVIDIA');
INSERT INTO category (parent_category_id, category_name) VALUES (5, 'Видеокарты AMD');
INSERT INTO category (parent_category_id, category_name) VALUES (1, 'Холодильники');
INSERT INTO category (parent_category_id, category_name) VALUES (1, 'Телевизоры');
INSERT INTO category (parent_category_id, category_name) VALUES (12, 'Телевизоры SONY');
INSERT INTO category (parent_category_id, category_name) VALUES (12, 'Телевизоры Samsung');
INSERT INTO category (parent_category_id, category_name) VALUES (11, 'Холодильники АТЛАНТ');
INSERT INTO category (parent_category_id, category_name) VALUES (11, 'Холодильники BEKO');
-- migrate:down