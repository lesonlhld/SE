CREATE TABLE `user` (
  `id` int NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(36) NOT NULL,
  `avatar` varchar(50) DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQ__User__F3DBC5720E56BA47` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `category` (
  `cate_id` int NOT NULL,
  `cate_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`cate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `product` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `price` double DEFAULT NULL,
  `cate_id` int NOT NULL,
  `des` varchar(2000) DEFAULT NULL,
  `image` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__Product__cate_id__15502E78` (`cate_id`),
  CONSTRAINT `FK__Product__cate_id__15502E78` FOREIGN KEY (`cate_id`) REFERENCES `category` (`cate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `cart` (
  `id` varchar(50) NOT NULL,
  `u_id` int NOT NULL,
  `buyDate` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__Cart__u_id__182C9B23` (`u_id`),
  CONSTRAINT `FK__Cart__u_id__182C9B23` FOREIGN KEY (`u_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `cartitem` (
  `id` varchar(50) NOT NULL,
  `quantity` int DEFAULT NULL,
  `unitPrice` double DEFAULT NULL,
  `pro_id` int NOT NULL,
  `cat_id` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__CartItem__pro_id__1B0907CE` (`pro_id`),
  KEY `FK__CartItem__cat_id__1BFD2C07` (`cat_id`),
  CONSTRAINT `FK__CartItem__cat_id__1BFD2C07` FOREIGN KEY (`cat_id`) REFERENCES `cart` (`id`),
  CONSTRAINT `FK__CartItem__pro_id__1B0907CE` FOREIGN KEY (`pro_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO User(email, username, password,avatar,role_id) VALUES ("","admin","123456","","1");
INSERT INTO User(email, username, password,avatar,role_id) VALUES ("abc@gmail.com","abc","123456","","2");
insert into category(cate_id, cate_name) values ("1","men");
INSERT INTO Product(name, price, image, cate_id, des) VALUES ("dads","123","","1","wadad")

select * from user

