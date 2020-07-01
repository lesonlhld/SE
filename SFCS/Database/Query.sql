-- ----------------------------------------------------------------------------
-- MySQL Workbench Migration
-- Migrated Schemata: UNIFY
-- Source Schemata: UNIFY
-- Created: Wed Jul  1 09:48:12 2020
-- Workbench Version: 8.0.20
-- ----------------------------------------------------------------------------

SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------------------------------------------------------
-- Schema UNIFY
-- ----------------------------------------------------------------------------
DROP SCHEMA IF EXISTS `UNIFY` ;
CREATE SCHEMA IF NOT EXISTS `UNIFY` ;

-- ----------------------------------------------------------------------------
-- Table UNIFY.User
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `UNIFY`.`User` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(50) NULL,
  `username` VARCHAR(50) NOT NULL,
  `password` VARCHAR(36) NOT NULL,
  `avatar` VARCHAR(50) NULL,
  `role_id` INT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `UQ__User__F3DBC5720E56BA47` (`username` ASC) VISIBLE);

-- ----------------------------------------------------------------------------
-- Table UNIFY.Category
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `UNIFY`.`Category` (
  `cate_id` INT NOT NULL AUTO_INCREMENT,
  `cate_name` VARCHAR(255) CHARACTER SET 'utf8mb4' NOT NULL,
  PRIMARY KEY (`cate_id`));

-- ----------------------------------------------------------------------------
-- Table UNIFY.Product
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `UNIFY`.`Product` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) CHARACTER SET 'utf8mb4' NOT NULL,
  `price` DOUBLE NULL,
  `cate_id` INT NOT NULL,
  `des` VARCHAR(2000) NULL,
  `image` VARCHAR(50) NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK__Product__cate_id__15502E78`
    FOREIGN KEY (`cate_id`)
    REFERENCES `UNIFY`.`Category` (`cate_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table UNIFY.Cart
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `UNIFY`.`Cart` (
  `id` VARCHAR(50) NOT NULL,
  `u_id` INT NOT NULL,
  `buyDate` DATE NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK__Cart__u_id__182C9B23`
    FOREIGN KEY (`u_id`)
    REFERENCES `UNIFY`.`User` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table UNIFY.CartItem
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `UNIFY`.`CartItem` (
  `id` VARCHAR(50) NOT NULL,
  `quantity` INT NULL,
  `unitPrice` DOUBLE NULL,
  `pro_id` INT NOT NULL,
  `cat_id` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK__CartItem__pro_id__1B0907CE`
    FOREIGN KEY (`pro_id`)
    REFERENCES `UNIFY`.`Product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK__CartItem__cat_id__1BFD2C07`
    FOREIGN KEY (`cat_id`)
    REFERENCES `UNIFY`.`Cart` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table UNIFY.sysdiagrams
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `UNIFY`.`sysdiagrams` (
  `name` VARCHAR(160) NOT NULL,
  `principal_id` INT NOT NULL,
  `diagram_id` INT NOT NULL,
  `version` INT NULL,
  `definition` LONGBLOB NULL,
  PRIMARY KEY (`diagram_id`),
  UNIQUE INDEX `UK_principal_name` (`principal_id` ASC, `name` ASC) VISIBLE);
SET FOREIGN_KEY_CHECKS = 1;

USE unify;

INSERT INTO User(email, username, password,avatar,role_id) VALUES ("","admin","123456","","1");
INSERT INTO User(email, username, password,avatar,role_id) VALUES ("abc@gmail.com","abc","123456","","2");
insert into category(cate_id, cate_name) values ("1","men");
INSERT INTO Product(name, price, image, cate_id, des) VALUES ("dads","123","","1","wadad");

select * from user;
