/*用户表*/
CREATE TABLE ACCOUNT (
  id INT(11) NOT NULL AUTO_INCREMENT, /*主键*/
  username VARCHAR(255),              /*用户名*/
  password VARCHAR(255) NOT NULL,     /*密码*/
  phone VARCHAR(255),                 /*手机号*/
  email VARCHAR(255),                 /*邮箱*/
  nickname VARCHAR(255),              /*昵称*/
  photo VARCHAR(255),                 /*头像图片名*/
  balance DECIMAL(11,2),              /*余额*/
  status INT(11) NOT NULL,            /*状态*/
  register_time TIMESTAMP NOT NULL,   /*注册时间*/
  role INT NOT NULL,                  /*角色*/
  code VARCHAR(255),                  /*激活码*/
  PRIMARY KEY (id)
);

/*登录日志表*/
CREATE TABLE LOGIN_LOG (
  id INT(11) NOT NULL AUTO_INCREMENT, /*主键*/
  ip VARCHAR(255) NOT NULL,           /*ip地址*/
  location VARCHAR(255) NOT NULL,     /*定位位置*/
  login_time TIMESTAMP NOT NULL,      /*登录时间*/
  account_id INT(11) NOT NULL,        /*外键,引用ACCOUNT表*/
  PRIMARY KEY (id),
  FOREIGN KEY (account_id) REFERENCES ACCOUNT (id)
);

/*管理员表*/
CREATE TABLE MANAGER (
  id INT(11) NOT NULL AUTO_INCREMENT, /*主键*/
  username VARCHAR(255) NOT NULL,     /*用户名*/
  password VARCHAR(255) NOT NULL,     /*密码*/
  phone VARCHAR(255) NOT NULL,        /*手机*/
  email VARCHAR(255) NOT NULL,        /*邮箱*/
  photo VARCHAR(255) NOT NULL,        /*头像图片名*/
  status INT(11) NOT NULL,            /*状态*/
  created_time TIMESTAMP NOT NULL,    /*创建时间*/
  role INT(11) NOT NULL,              /*角色*/
  PRIMARY KEY (id)
);

/*管理日志表*/
CREATE TABLE MANAGE_LOG (
  id INT(11) NOT NULL AUTO_INCREMENT, /*主键*/
  detail VARCHAR(255) NOT NULL,       /*内容*/
  type INT(11) NOT NULL,              /*日志类型*/
  created_time TIMESTAMP NOT NULL,    /*日志创建时间*/
  manager_id INT(11) NOT NULL,        /*管理者,外键,引用MANAGER表*/
  account_id INT(11),                 /*被管理者,外键,引用ACCOUNT表*/
  PRIMARY KEY (id),
  FOREIGN KEY (account_id) REFERENCES ACCOUNT (id),
  FOREIGN KEY (manager_id) REFERENCES MANAGER (id)
);

/*地址表*/
CREATE TABLE ADDRESS (
  id INT(11) NOT NULL AUTO_INCREMENT, /*主键*/
  receiver VARCHAR(255) NOT NULL,     /*收货人*/
  phone VARCHAR(255) NOT NULL,        /*手机号*/
  location VARCHAR(255) NOT NULL,     /*定位位置*/
  detail VARCHAR(255) NOT NULL,       /*详细地址*/
  status INT(11) NOT NULL,            /*状态*/
  account_id INT(11),                 /*外键,引用ACCOUNT表*/
  PRIMARY KEY (id),
  FOREIGN KEY (account_id) REFERENCES ACCOUNT (id)
);

/*商家表*/
CREATE TABLE BUSINESS (
  id INT(11) NOT NULL AUTO_INCREMENT,             /*主键*/
  front_photo VARCHAR(255) NOT NULL,              /*室外图片名*/
  inside_photo VARCHAR(255) NOT NULL,             /*室内图片名*/
  id_back_photo VARCHAR(255) NOT NULL,            /*身份证背面图片名*/
  id_front_Photo VARCHAR(255) NOT NULL,           /*身份证正面图片名*/
  identifier VARCHAR(255) NOT NULL,               /*身份证号*/
  business_licence VARCHAR(255) NOT NULL,         /*商家营业执照*/
  catering_service_license VARCHAR(255) NOT NULL, /*餐厅服务营业执照*/
  account_id INT(11) NOT NULL,                    /*外键,引用ACCOUNT表*/
  PRIMARY KEY (id),
  FOREIGN KEY (account_id) REFERENCES ACCOUNT (id)
);

/*商店表*/
CREATE TABLE SHOP (
  id INT(11) NOT NULL AUTO_INCREMENT,                 /*主键*/
  shop_name VARCHAR(255) NOT NULL,                    /*商店名*/
  shop_type INT(11) NOT NULL,                         /*商店类型*/
  shop_photo VARCHAR(255) NOT NULL,                   /*商店图片*/
  shop_phone VARCHAR(255) NOT NULL,                   /*商店电话*/
  address VARCHAR(255) NOT NULL,                      /*地址*/
  operate_time VARCHAR(255) NOT NULL,                 /*营业时间*/
  operate_state INT(11) NOT NULL,                     /*营业状态*/
  lat VARCHAR(255) NOT NULL,                          /*经度*/
  lon VARCHAR(255) NOT NULL,                          /*纬度*/
  support_payment INT(11) NOT NULL,                   /*支持支付方式*/
  shipping_distance INT(11) NOT NULL,                 /*配送范围*/
  shipping_price DECIMAL(11,2) NOT NULL,              /*配送起价*/
  shipping_time INT(11) NOT NULL DEFAULT 0,           /*配送时间*/
  shipping_fee  DECIMAL(11,2) NOT NULL default 0.00,  /*配送费*/
  announcement VARCHAR(255) NOT NULL,                 /*公告*/
  business_id INT(11) NOT NULL,                       /*外键,引用BUSINESS表*/
  PRIMARY KEY (id),
  FOREIGN KEY (business_id) REFERENCES BUSINESS (id)
);

/*商品表*/
CREATE TABLE PRODUCT (
  id INT(11) NOT NULL AUTO_INCREMENT, /*主键*/
  product_name VARCHAR(255) NOT NULL, /*商品名*/
  price DECIMAL(11,2) NOT NULL,       /*单价*/
  status INT(11) NOT NULL,            /*状态*/
  sales_volume INT(11),               /*销量*/
  description VARCHAR(255) NOT NULL,  /*商品描述*/
  photo VARCHAR(255) NOT NULL,        /*商品图片路径*/
  shop_id INT(11) NOT NULL,           /*外键,引用SHOP表*/
  PRIMARY KEY (id),
  FOREIGN KEY (shop_id) REFERENCES SHOP (id)
);

/*订单表*/
CREATE TABLE `ORDER` (
  id INT(11) NOT NULL AUTO_INCREMENT,     /*主键*/
  order_number VARCHAR(255) NOT NULL,     /*订单号*/
  created_time TIMESTAMP NOT NULL,        /*创建时间*/
  completed_time TIMESTAMP,               /*完成时间*/
  accepted_time TIMESTAMP,                /*受理时间*/
  status VARCHAR(255) NOT NULL,           /*订单状态*/
  payment_method VARCHAR(255) NOT NULL,   /*支付方式*/
  payment_status VARCHAR(255) NOT NULL,   /*支付状态*/
  shipping_status VARCHAR(255),           /*发货状态*/
  notes VARCHAR(255),                     /*订单备注*/
  total DECIMAL(11,2) NOT NULL,           /*总额*/
  account_id INT(11) NOT NULL,            /*外键,引用ACCOUNT表*/
  shop_id INT(11) NOT NULL,               /*外键,引用SHOP表*/
  business_id INT(11) NOT NULL,           /*外键,引用BUSINESS表*/
  address_id INT(11) NOT NULL,            /*外键,引用ADDRESS表*/
  PRIMARY KEY (id),
  FOREIGN KEY (shop_id) REFERENCES SHOP (id),
  FOREIGN KEY (business_id) REFERENCES BUSINESS (id),
  FOREIGN KEY (account_id) REFERENCES ACCOUNT (id),
  FOREIGN KEY (address_id) REFERENCES ADDRESS (id)
);

/*订单项表*/
CREATE TABLE LINE_ITEM (
  id INT(11) NOT NULL AUTO_INCREMENT, /*主键*/
  product_name VARCHAR(255) NOT NULL, /*商品名*/
  price DECIMAL(11,2) NOT NULL,       /*商品单价*/
  quantity INT(11) NOT NULL,          /*商品数量*/
  order_id INT(11) NOT NULL,          /*外键,引用ORDER表*/
  product_id INT(11) NOT NULL,        /*外键,引用SHOP表*/
  PRIMARY KEY (id),
  FOREIGN KEY (product_id) REFERENCES PRODUCT (id),
  FOREIGN KEY (order_id) REFERENCES `ORDER` (id)
);

/*足迹表*/
CREATE TABLE FOOTPRINT (
  id INT(11) NOT NULL AUTO_INCREMENT, /*主键*/
  access_time DATE NOT NULL,          /*访问时间*/
  account_id INT(11) NOT NULL,        /*外键,引用ACCOUNT表*/
  shop_id INT(11) NOT NULL,           /*外键,引用SHOP表*/
  PRIMARY KEY (id),
  FOREIGN KEY (account_id) REFERENCES ACCOUNT (id),
  FOREIGN KEY (shop_id) REFERENCES SHOP (id)
);

/*商店收藏表*/
CREATE TABLE FAVOR (
  id INT(11) NOT NULL AUTO_INCREMENT, /*主键*/
  account_id INT(11) NOT NULL,        /*外键,引用ACCOUNT表*/
  shop_id INT(11) NOT NULL,           /*外键,引用SHOP表*/
  PRIMARY KEY (id),
  FOREIGN KEY (shop_id) REFERENCES SHOP (id),
  FOREIGN KEY (account_id) REFERENCES ACCOUNT (id)
);

/*订单评价表*/
CREATE TABLE ORDER_EVALUATION (
  id INT(11) NOT NULL AUTO_INCREMENT, /*主键*/
  score INT(11) NOT NULL,             /*评分*/
  comment VARCHAR(255),               /*评论*/
  reply VARCHAR(255),                 /*商家回复*/
  eval_time TIMESTAMP NOT NULL,       /*评价时间*/
  order_id INT(11) NOT NULL,          /*外键,引用ORDER表*/
  shop_id INT(11) NOT NULL,           /*外键,引用SHOP表*/
  PRIMARY KEY (id),
  FOREIGN KEY (order_id) REFERENCES `ORDER` (id),
  FOREIGN KEY (shop_id) REFERENCES SHOP (id)
);

/*商品评价表*/
CREATE TABLE PRODUCT_EVALUATION (
  id INT(11) NOT NULL AUTO_INCREMENT, /*主键*/
  score VARCHAR(255),                 /*评分*/
  comment VARCHAR(255),               /*评论*/
  eval_time TIMESTAMP NOT NULL,       /*评论时间*/
  item_id INT(11) NOT NULL,           /*外键,引用LINE_ITEM表*/
  order_eval_id INT(11) NOT NULL,     /*外键,引用ORDER_EVALUATION表*/
  PRIMARY KEY (id),
  FOREIGN KEY (item_id) REFERENCES LINE_ITEM (id),
  FOREIGN KEY (order_eval_id) REFERENCES ORDER_EVALUATION (id)
);

/*消息表*/
CREATE TABLE MESSAGE (
  id INT(11) NOT NULL AUTO_INCREMENT, /*主键*/
  type VARCHAR(255),                  /*消息类型*/
  content VARCHAR(255),               /*消息内容*/
  status VARCHAR(255) NOT NULL,       /*消息状态*/
  sender_id INT(11) NOT NULL,         /*发送方,外键,引用ACCOUNT表*/
  receiver_id INT(11) NOT NULL,       /*接收方,外键,引用ACCOUNT表*/
  PRIMARY KEY (id),
  FOREIGN KEY (sender_id) REFERENCES ACCOUNT (id),
  FOREIGN KEY (receiver_id) REFERENCES ACCOUNT (id)
);
