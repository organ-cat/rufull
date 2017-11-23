DROP TABLE IF EXISTS user_t;

CREATE TABLE user_t (
  id int(11) NOT NULL AUTO_INCREMENT,
  username varchar(40) NOT NULL,
  password varchar(255) NOT NULL,
  age int(4) NOT NULL,
  PRIMARY KEY (id)
);