/*用户表数据*/
INSERT INTO ACCOUNT(id,username,password,phone,email,nickname,photo,balance,status,register_time,role,code)
VALUES(1,'jiang','123456','13413600394','jiang@qq.com','新健','http://edu.ruanko.com//images/course/logo.png',100.00,100,'2017-11-29 09:41:32',1,null);
INSERT INTO ACCOUNT(id,username,password,phone,email,nickname,photo,balance,status,register_time,role,code)
VALUES(2,'zhong','123456','13432111111','zhong@163.com','钟仔','http://edu.ruanko.com//images/course/logo.png',0.00,100,'2017-11-29 16:05:37',1,null);
INSERT INTO ACCOUNT(id,username,password,phone,email,nickname,photo,balance,status,register_time,role,code)
VALUES(3,'cao','123456','12345678990','caoxin@sina.com','操心','http://edu.ruanko.com//images/course/logo.png',0.00,100,'2017-11-29 16:07:27',1,null);

/*地址表数据*/
INSERT INTO ADDRESS(id,receiver,phone,location,detail,status,account_id)
VALUES(1,'江爸爸','13413600394','广东省湛江市麻章区','广东海洋大学海浪A',1,1);
INSERT INTO ADDRESS(id,receiver,phone,location,detail,status,account_id)
VALUES(2,'钟儿子','12345567899','广东省湛江市麻章区','广东海洋大学海浪A',0,2);
INSERT INTO ADDRESS(id,receiver,phone,location,detail,status,account_id)
VALUES(3,'钟仔','12345678990','广东省湛江市麻章区','广东海洋大学海浪A',0,2);

/*管理员表数据*/
INSERT INTO MANAGER(id,username,password,phone,email,photo,status,created_time,role)
VALUES(1,'chen','123456','13420255560','admin@qq.com','87e6c27a-2862-4435-9e4b-4e101db3e81a_MG_0470-1451179739 (1).JPG',1,'2017-12-12 17:41:16',1);
INSERT INTO MANAGER(id,username,password,phone,email,photo,status,created_time,role)
VALUES(2,'hong','123456','13525352635','manager@qq.com','www.baidu.com',0,'2017-12-13 00:23:07',2);
INSERT INTO MANAGER(id,username,password,phone,email,photo,status,created_time,role)
VALUES(3,'xin','000000','15856966586','xin@qq.com','profile-pic.jpg',1,'2017-12-13 00:53:22',2);

/*商家表数据*/
INSERT INTO BUSINESS(id, front_photo, inside_photo, id_back_photo, id_front_photo, identifier, business_licence, catering_service_license, account_id)
VALUES(1,'A商家正面照片.jpg','A商家反面照片.jpg','A身份证反面.jpg','A身份证正面.jpg','460033199409111173','A商家营业执照.jpg','A商家餐厅服务营业执照.jpg',1);
INSERT INTO BUSINESS(id, front_photo, inside_photo, id_back_photo, id_front_Photo, identifier, business_licence, catering_service_license, account_id)
VALUES(2,'B商家正面照片.jpg','B商家反面照片.jpg','B身份证反面.jpg','B身份证正面.jpg','460033199409111163','B商家营业执照.jpg','B商家餐厅营业服务.jpg',2);
INSERT INTO business(id, front_photo, inside_photo, id_back_photo, id_front_Photo, identifier, business_licence, catering_service_license, account_id)
VALUES(3,'C商家正面照片.jpg','C商家反面照片.jpg','C商家身份证反面.jpg','C商家身份证正面.jpg','460033199409111193','C商家营业执照.jpg','C商家餐厅营业服务.jpg',3);

/*商店表数据*/
INSERT INTO SHOP (id, shop_name, shop_type, shop_photo, shop_phone, address, operate_time, operate_state, lat, lon, support_payment, shipping_distance, shipping_price, shipping_time, shipping_fee, announcement, business_id)
VALUES(1,'皮皮虾',0,'皮皮虾.jpg','13535570616','广东海洋大学海浪A616','7:30-13:30,16:30-23:30',0,'100.00','100.00',0,'10',10.00,45,0.00,'皮皮虾开业啦',1);
INSERT INTO SHOP (id, shop_name, shop_type, shop_photo, shop_phone, address, operate_time, operate_state, lat, lon, support_payment, shipping_distance, shipping_price, shipping_time, shipping_fee, announcement, business_id)
VALUES(2,'佳士顿',0,'佳士顿.jpg','18320338949','广东海洋大学海花A415','8:30-14:00,17:50-23:00',1,'200.00','200.00',0,'12',12.00,38,0.00,'佳士顿开业啦',2);
INSERT INTO SHOP (id, shop_name, shop_type, shop_photo, shop_phone, address, operate_time, operate_state, lat, lon, support_payment, shipping_distance, shipping_price, shipping_time, shipping_fee, announcement, business_id)
VALUES(3,'美味源',0,'美味源.jpg','13002090126','广东海洋大学凯斯2楼305','9:00-15:00,17:20-12:00',2,'300.00','330.00',0,'14',5.00,23,0.00,'美味源开业啦',3);

/*商品表数据*/
INSERT INTO product(id, product_name, price, status, sales_volume, description, photo, shop_id)
VALUES(1,'红烧爆炒虾',10.00,0,1,'红烧爆炒虾','红烧爆炒虾.jpg',1);
INSERT INTO product(id, product_name, price, status, sales_volume, description, photo, shop_id)
VALUES(2,'白灼虾',12.00,1,2,'白灼虾','白灼虾.jpg',1);
INSERT INTO product(id, product_name, price, status, sales_volume, description, photo, shop_id)
VALUES(3,'香辣虾粉',15.00,2,3,'香辣虾粉','香辣虾粉.jpg',1);
INSERT INTO product(id, product_name, price, status, sales_volume, description, photo, shop_id)
VALUES(4,'鲜虾饺子',18.00,3,4,'鲜虾饺子','鲜虾饺子.jpg',1);
INSERT INTO product(id, product_name, price, status, sales_volume, description, photo, shop_id)
VALUES(5,'龙虾',20.00,4,5,'龙虾','龙虾.jpg',1);
INSERT INTO product(id, product_name, price, status, sales_volume, description, photo, shop_id)
VALUES(6,'香辣鸡翅(2块)',6.00,0,6,'香辣鸡翅(2块)','香辣鸡翅(2块).jpg',2);
INSERT INTO product(id, product_name, price, status, sales_volume, description, photo, shop_id)
VALUES(7,'香辣鸡腿堡',10.00,1,7,'香辣鸡腿堡','香辣鸡腿堡.jpg',2);
INSERT INTO product(id, product_name, price, status, sales_volume, description, photo, shop_id)
VALUES(8,'脆皮鸡',18.00,2,8,'脆皮鸡','脆皮鸡.jpg',2);
INSERT INTO product(id, product_name, price, status, sales_volume, description, photo, shop_id)
VALUES(9,'墨西哥卷',13.00,3,9,'墨西哥卷','墨西哥卷.jpg',2);
INSERT INTO product(id, product_name, price, status, sales_volume, description, photo, shop_id)
VALUES(10,'鸡柳',2.50,4,10,'鸡柳','鸡柳.jpg',2);
INSERT INTO product(id, product_name, price, status, sales_volume, description, photo, shop_id)
VALUES(11,'白切鸡饭',12.00,0,11,'白切鸡饭','白切鸡饭.jpg',3);
INSERT INTO product(id, product_name, price, status, sales_volume, description, photo, shop_id)
VALUES(12,'烧鸭饭',14.00,1,14,'烧鸭饭','烧鸭饭.jpg',3);
INSERT INTO product(id, product_name, price, status, sales_volume, description, photo, shop_id)
VALUES(13,'爆浆大肠饭',13.50,2,12,'爆浆大肠饭','爆浆大肠饭.jpg',3);
INSERT INTO product(id, product_name, price, status, sales_volume, description, photo, shop_id)
VALUES(14,'黑椒牛肉饭',12.50,3,45,'黑椒牛肉饭','黑椒牛肉饭.jpg',3);
INSERT INTO product(id, product_name, price, status, sales_volume, description, photo, shop_id)
VALUES(15,'红烧日本豆腐饭',10.00,4,69,'红烧日本豆腐饭','红烧日本豆腐饭.jpg',3);

/*商店收藏表数据*/
INSERT INTO FAVOR(id, account_id, shop_id) VALUES(1,1,1);
INSERT INTO FAVOR(id, account_id, shop_id) VALUES(2,1,2);
INSERT INTO FAVOR(id, account_id, shop_id) VALUES(3,1,3);
INSERT INTO FAVOR(id, account_id, shop_id) VALUES(4,2,1);
INSERT INTO FAVOR(id, account_id, shop_id) VALUES(5,2,2);
INSERT INTO FAVOR(id, account_id, shop_id) VALUES(6,3,1);

/*订单表数据*/
INSERT INTO `ORDER`(id, order_number, created_time, completed_time, accepted_time, status, payment_method, payment_status, shipping_status, notes, total, account_id, shop_id, business_id,address_id)
VALUES(1,'2017112901','2017-11-29 10:00:00','2017-11-29 13:00:00','2017-11-29 10:00:05','COMPLETED','ONLINE','PAID','ARRIVED','这是一个已完成的订单',37.00,1,1,1,1);
INSERT INTO `ORDER`(id, order_number, created_time, completed_time, accepted_time, status, payment_method, payment_status, shipping_status, notes, total, account_id, shop_id, business_id,address_id)
VALUES(2,'2017112902','2017-11-29 10:15:23','2017-11-29 12:34:28','2017-11-29 10:16:24','COMPLETED','ONLINE','PAID','ARRIVED','测试特殊字符<&lt;',22.00,2,2,2,2);
INSERT INTO `ORDER`(id, order_number, created_time, completed_time, accepted_time, status, payment_method, payment_status, shipping_status, notes, total, account_id, shop_id, business_id,address_id)
VALUES(3,'2017112903','2017-11-29 13:00:00',NULL,NULL,'UNPAID','ONLINE','UNPAID',null,'这是一个要取消的订单',13.50,2,3,3,3);
INSERT INTO `ORDER`(id, order_number, created_time, completed_time, accepted_time, status, payment_method, payment_status, shipping_status, notes, total, account_id, shop_id, business_id,address_id)
VALUES(4,'2017112904','2017-11-29 21:30:03',NULL,'2017-11-29 21:41:29','DELIVERY','ONLINE','PAID','SHIPPING','这是一个未确认的订单',32.50,2,3,3,2);

/*订单项表数据*/
INSERT INTO LINE_ITEM(id, product_name, price, quantity, order_id, product_id)
VALUES(1,'红烧爆炒虾','10.00',1,1,1);
INSERT INTO LINE_ITEM(id, product_name, price, quantity, order_id, product_id)
VALUES(2,'白灼虾','12.00',1,1,2);
INSERT INTO LINE_ITEM(id, product_name, price, quantity, order_id, product_id)
VALUES(3,'香辣虾粉','15.00',1,1,3);
INSERT INTO LINE_ITEM(id, product_name, price, quantity, order_id, product_id)
VALUES(4,'香辣鸡翅(2块)','6.00',2,2,6);
INSERT INTO LINE_ITEM(id, product_name, price, quantity, order_id, product_id)
VALUES(5,'香辣鸡腿堡','10.00',1,2,7);
INSERT INTO LINE_ITEM(id, product_name, price, quantity, order_id, product_id)
VALUES(6,'爆浆大肠饭','13.50',1,3,'13');
INSERT INTO LINE_ITEM(id, product_name, price, quantity, order_id, product_id)
VALUES(7,'黑椒牛肉饭','12.50',1,4,'14');
INSERT INTO LINE_ITEM(id, product_name, price, quantity, order_id, product_id)
VALUES(8,'红烧日本豆腐饭','10.00',2,4,'15');

/*订单评价表数据*/
INSERT INTO ORDER_EVALUATION(id, score, comment, reply, eval_time, order_id, shop_id)
VALUES(1,5,'很满足','已送餐','2017-11-30 09:41:32',1,1);
INSERT INTO ORDER_EVALUATION(id, score, comment, reply, eval_time, order_id, shop_id)
VALUES(2,4,'很满足','已送餐','2017-11-30 09:41:32',2,1);
INSERT INTO ORDER_EVALUATION(id, score, comment, reply, eval_time, order_id, shop_id)
VALUES(3,3,'很满足','已送餐','2017-11-30 09:41:32',3,2);
INSERT INTO ORDER_EVALUATION(id, score, comment, reply, eval_time, order_id, shop_id)
VALUES(4,3,'很满足','已送餐','2017-11-30 09:41:32',4,3);

/*商品评价表数据*/
INSERT INTO PRODUCT_EVALUATION(id, score, comment, eval_time, item_id, order_eval_id)
VALUES(1,3,'很满足','2017-11-30 09:41:32',1,1);
INSERT INTO PRODUCT_EVALUATION(id, score, comment, eval_time, item_id, order_eval_id)
VALUES(2,4,'很满足','2017-11-30 09:41:32',2,1);
INSERT INTO PRODUCT_EVALUATION(id, score, comment, eval_time, item_id, order_eval_id)
VALUES(3,5,'很满足','2017-11-30 09:41:32',3,1);
INSERT INTO PRODUCT_EVALUATION(id, score, comment, eval_time, item_id, order_eval_id)
VALUES(4,3,'很满足','2017-11-30 09:41:32',4,2);
INSERT INTO PRODUCT_EVALUATION(id, score, comment, eval_time, item_id, order_eval_id)
VALUES(5,3,'很满足','2017-11-30 09:41:32',5,2);
INSERT INTO PRODUCT_EVALUATION(id, score, comment, eval_time, item_id, order_eval_id)
VALUES(6,5,'很满足','2017-11-30 09:41:32',6,3);
INSERT INTO PRODUCT_EVALUATION(id, score, comment, eval_time, item_id, order_eval_id)
VALUES(7,2,'很满足','2017-11-30 09:41:32',7,4);
INSERT INTO PRODUCT_EVALUATION(id, score, comment, eval_time, item_id, order_eval_id)
VALUES(8,3,'很满足','2017-11-30 09:41:32',8,4);

/*管理日志表*/
INSERT  INTO MANAGE_LOG(id,detail,type,created_time,manager_id,account_id)
VALUES(1,'添加管理员',1,'2017-11-08 19:19:33',1,NULL);
INSERT INTO MANAGE_LOG(id,detail,type,created_time,manager_id,account_id)
VALUES(2,'审核商家入驻',2,'2017-11-08 19:19:58',2,1);
INSERT INTO MANAGE_LOG(id,detail,type,created_time,manager_id,account_id)
VALUES(3,'删除管理员',1,'2017-11-09 19:20:37',1,NULL);
INSERT INTO MANAGE_LOG(id,detail,type,created_time,manager_id,account_id)
VALUES(4,'查看商家数据分析',2,'2017-11-15 19:21:22',2,NULL);
