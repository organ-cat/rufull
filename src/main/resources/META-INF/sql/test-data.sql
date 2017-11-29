/*用户表数据*/
INSERT INTO ACCOUNT(id,username,password,phone,email,nickname,photo,balance,status,register_time)
VALUES(1,'jiang','123456','13413600394','jiang@qq.com','爸爸','url',100,1,'2017-11-29 09:41:32');
INSERT INTO ACCOUNT(id,username,password,phone,email,nickname,photo,balance,status,register_time)
VALUES(2,'zhong','123456','13432111111','zhong@163.com','钟仔','http:www.baidu.com',0,1,'2017-11-29 16:05:37');
INSERT INTO ACCOUNT(id,username,password,phone,email,nickname,photo,balance,status,register_time)
VALUES(3,'cao','123456','12345678990','cao@sina.com','操心','http://edu.ruanko.com//images/course/logo.png',0,1,'2017-11-29 16:07:27');

/*地址表数据*/
INSERT INTO ADDRESS(id,receiver,phone,location,detail,status,account_id)
VALUES(1,'江爸爸','13413600394','广东省湛江市麻章区','广东海洋大学海浪A',1,1);
INSERT INTO ADDRESS(id,receiver,phone,location,detail,status,account_id)
VALUES(2,'钟儿子','12345567899','广东省湛江市麻章区','广东海洋大学海浪A',0,2);
INSERT INTO ADDRESS(id,receiver,phone,location,detail,status,account_id)
VALUES(3,'钟仔','12345678990','广东省湛江市麻章区','广东海洋大学海浪A',0,2);

/*管理员表数据*/
INSERT INTO MANAGER(id,username,password,phone,email,photo,status,created_time,role)
VALUES(1,'超级管理员','123456','98765432100','admin@qq.com','www.google.com',1,'2017-11-01 16:23:41',1);
INSERT INTO MANAGER(id,username,password,phone,email,photo,status,created_time,role)
VALUES(2,'管理员','123456','12345678990','manager@qq.com','www.baidu.com',1,'2017-11-07 16:22:24',2);

/*商家表数据*/
INSERT INTO BUSINESS(id, front_photo, inside_photo, id_back_photo, id_front_photo, identifier, business_licence, catering_service_license, account_id)
VALUES('1','A商家正面照片.jpg','A商家反面照片.jpg','A身份证反面.jpg','A身份证正面.jpg','460033199409111173','A商家营业执照.jpg','A商家餐厅服务营业执照.jpg','1');
INSERT INTO BUSINESS(id, front_photo, inside_photo, id_back_photo, id_front_Photo, identifier, business_licence, catering_service_license, account_id)
VALUES('2','B商家正面照片.jpg','B商家反面照片.jpg','B身份证反面.jpg','B身份证正面.jpg','460033199409111163','B商家营业执照.jpg','B商家餐厅营业服务.jpg','2');
INSERT INTO business(id, front_photo, inside_photo, id_back_photo, id_front_Photo, identifier, business_licence, catering_service_license, account_id)
VALUES('3','C商家正面照片.jpg','C商家反面照片.jpg','C商家身份证反面.jpg','C商家身份证正面.jpg','460033199409111193','C商家营业执照.jpg','C商家餐厅营业服务.jpg','3');

/*商店表数据*/
INSERT INTO SHOP(id, address, lat, lon, operate_state, announcement, support_payment, shop_type, shipping_distance, shipping_price, shipping_time, business_id, shop_name)
VALUES('1','广东海洋大学海浪A616','100.00','100.00','0','今天商品全部100元','0','0','30','10','30','1','皮皮虾');
INSERT INTO SHOP (id, address, lat, lon, operate_state, announcement, support_payment, shop_type, shipping_distance, shipping_price, shipping_time, business_id, shop_name)
VALUES('2','广东海洋大学海浪A613','200.00','200.00','1','今天商品全部免费','1','1','20','11','40','2','佳士顿');
INSERT INTO SHOP (id, address, lat, lon, operate_state, announcement, support_payment, shop_type, shipping_distance, shipping_price, shipping_time, business_id, shop_name)
VALUES('3','广东海洋大学海浪A606','300.00','300.00','2','今天休息','2','2','25','12','35','3','美味源');

/*商品表数据*/
INSERT INTO product(id, product_name, price, status, sales_volume, description, photo, shop_id)
VALUES('1','红烧爆炒虾','10.00','0','1','红烧爆炒虾','红烧爆炒虾.jpg','1');
INSERT INTO product(id, product_name, price, status, sales_volume, description, photo, shop_id)
VALUES('2','白灼虾','12.00','1','2','白灼虾','白灼虾.jpg','1');
INSERT INTO product(id, product_name, price, status, sales_volume, description, photo, shop_id)
VALUES('3','香辣虾粉','15.00','2','3','香辣虾粉','香辣虾粉.jpg','1');
INSERT INTO product(id, product_name, price, status, sales_volume, description, photo, shop_id)
VALUES('4','鲜虾饺子','18.00','3','4','鲜虾饺子','鲜虾饺子.jpg','1');
INSERT INTO product(id, product_name, price, status, sales_volume, description, photo, shop_id)
VALUES('5','龙虾','20.00','4','5','龙虾','龙虾.jpg','1');
INSERT INTO product(id, product_name, price, status, sales_volume, description, photo, shop_id)
VALUES('6','香辣鸡翅(2块)','6.00','0','6','香辣鸡翅(2块)','香辣鸡翅(2块).jpg','2');
INSERT INTO product(id, product_name, price, status, sales_volume, description, photo, shop_id)
VALUES('7','香辣鸡腿堡','10.00','1','7','香辣鸡腿堡','香辣鸡腿堡.jpg','2');
INSERT INTO product(id, product_name, price, status, sales_volume, description, photo, shop_id)
VALUES('8','脆皮鸡','18.00','2','8','脆皮鸡','脆皮鸡.jpg','2');
INSERT INTO product(id, product_name, price, status, sales_volume, description, photo, shop_id)
VALUES('9','墨西哥卷','13.00','3','9','墨西哥卷','墨西哥卷.jpg','2');
INSERT INTO product(id, product_name, price, status, sales_volume, description, photo, shop_id)
VALUES('10','鸡柳','2.50','4','10','鸡柳','鸡柳.jpg','2');
INSERT INTO product(id, product_name, price, status, sales_volume, description, photo, shop_id)
VALUES('11','白切鸡饭','12.00','0','11','白切鸡饭','白切鸡饭.jpg','3');
INSERT INTO product(id, product_name, price, status, sales_volume, description, photo, shop_id)
VALUES('12','烧鸭饭','14.00','1','14','烧鸭饭','烧鸭饭.jpg','3');
INSERT INTO product(id, product_name, price, status, sales_volume, description, photo, shop_id)
VALUES('13','爆浆大肠饭','13.50','2','12','爆浆大肠饭','爆浆大肠饭.jpg','3');
INSERT INTO product(id, product_name, price, status, sales_volume, description, photo, shop_id)
VALUES('14','黑椒牛肉饭','12.50','3','45','黑椒牛肉饭','黑椒牛肉饭.jpg','3');
INSERT INTO product(id, product_name, price, status, sales_volume, description, photo, shop_id)
VALUES('15','红烧日本豆腐饭','10.00','4','69','红烧日本豆腐饭','红烧日本豆腐饭.jpg','3');

/*商店收藏表数据*/
INSERT INTO FAVOR(id, account_id, shop_id) VALUES('1','1','1');
INSERT INTO FAVOR(id, account_id, shop_id) VALUES('2','1','2');
INSERT INTO FAVOR(id, account_id, shop_id) VALUES('3','1','3');
INSERT INTO FAVOR(id, account_id, shop_id) VALUES('4','2','1');
INSERT INTO FAVOR(id, account_id, shop_id) VALUES('5','2','2');
INSERT INTO FAVOR(id, account_id, shop_id) VALUES('6','3','1');

/*订单表数据*/
INSERT INTO ORDER(id, order_number, created_time, completed_time, accepted_time, status, payment_method, payment_status, shipping_address, shipping_status, notes, total, account_id, shop_id, business_id)
VALUES('1','2017112901','2017-11-29 10:00:00','2017-11-29 13:00:00','2017-11-29 10:00:05','已完成','在线支付','完成支付','广东海洋大学海浪A','已送达','这是一个已完成的订单','37.00','1','1','1');
INSERT INTO ORDER(id, order_number, created_time, completed_time, accepted_time, status, payment_method, payment_status, shipping_address, shipping_status, notes, total, account_id, shop_id, business_id)
VALUES('2','2017112902','2017-11-29 10:15:23','2017-11-29 12:34:28','2017-11-29 10:16:24','已完成','在线支付','完成支付','广东海洋大学海浪A','已送达','测试特殊字符<&lt;','22.00','2','2','2');
INSERT INTO ORDER(id, order_number, created_time, completed_time, accepted_time, status, payment_method, payment_status, shipping_address, shipping_status, notes, total, account_id, shop_id, business_id)
VALUES('3','2017112903','2017-11-29 13:00:00',NULL,NULL,'已取消','在线支付','未支付','广东海洋大学海浪A','可为null','这是一个取消的订单','13.50','2','3','3');
INSERT INTO ORDER(id, order_number, created_time, completed_time, accepted_time, status, payment_method, payment_status, shipping_address, shipping_status, notes, total, account_id, shop_id, business_id)
VALUES('4','2017112904','2017-11-29 21:30:03',NULL,'2017-11-29 21:41:29','等待收货','在线支付','完成支付','广东海洋大学海浪A','已发货','这是一个未确认的订单','32.50','3','3','3');

/*订单项表数据*/
INSERT INTO LINE_ITEM(id, product_name, price, quantity, order_id, product_id)
VALUES('1','红烧爆炒虾','10.00','1','1','1');
INSERT INTO LINE_ITEM(id, product_name, price, quantity, order_id, product_id)
VALUES('2','白灼虾','12.00','1','1','2');
INSERT INTO LINE_ITEM(id, product_name, price, quantity, order_id, product_id)
VALUES('3','香辣虾粉','15.00','1','1','3');
INSERT INTO LINE_ITEM(id, product_name, price, quantity, order_id, product_id)
VALUES('4','香辣鸡翅(2块)','6.00','2','2','6');
INSERT INTO LINE_ITEM(id, product_name, price, quantity, order_id, product_id)
VALUES('5','香辣鸡腿堡','10.00','1','2','7');
INSERT INTO LINE_ITEM(id, product_name, price, quantity, order_id, product_id)
VALUES('6','爆浆大肠饭','13.50','1','3','13');
INSERT INTO LINE_ITEM(id, product_name, price, quantity, order_id, product_id)
VALUES('7','黑椒牛肉饭','12.50','1','4','14');
INSERT INTO LINE_ITEM(id, product_name, price, quantity, order_id, product_id)
VALUES('8','红烧日本豆腐饭','10.00','2','4','15');
