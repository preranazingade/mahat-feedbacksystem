-- MySQL Script generated by MySQL Workbench
-- 12/21/16 16:02:10
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema feeadbacksystem
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema feeadbacksystem
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `feeadbacksystem` DEFAULT CHARACTER SET utf8 ;
USE `feeadbacksystem` ;

-- -----------------------------------------------------
-- Table `feeadbacksystem`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `feeadbacksystem`.`user` (
  `iduser` INT(11) NOT NULL AUTO_INCREMENT,
  `user_name` VARCHAR(45) NOT NULL,
  `fname` VARCHAR(45) NOT NULL,
  `lname` VARCHAR(45) NULL DEFAULT NULL,
  `phone_no` INT(20) NOT NULL,
  `email_id` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `created_by` VARCHAR(45) NOT NULL,
  `created_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` VARCHAR(45) NOT NULL,
  `updated_date` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`iduser`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `feeadbacksystem`.`feedback_on`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `feeadbacksystem`.`feedback_on` (
  `id` INT(11) NOT NULL,
  `topic_facilitator_name` VARCHAR(45) NOT NULL,
  `ratings` INT(11) NULL DEFAULT NULL,
  `comments` LONGTEXT NULL DEFAULT NULL,
  `user_id` INT(11) NULL DEFAULT NULL,
  `created_by` VARCHAR(45) NULL DEFAULT NULL,
  `created_date` TIMESTAMP NULL DEFAULT NULL,
  `updated_by` VARCHAR(45) NULL DEFAULT NULL,
  `updated_date` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_user_id` (`user_id` ASC),
  CONSTRAINT `fk_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `feeadbacksystem`.`user` (`iduser`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `feeadbacksystem`.`permissions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `feeadbacksystem`.`permissions` (
  `id` INT(11) NOT NULL,
  `code` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(45) NOT NULL,
  `created_by` VARCHAR(45) NULL DEFAULT NULL,
  `created_date` TIMESTAMP NULL DEFAULT NULL,
  `updated_by` VARCHAR(45) NULL DEFAULT NULL,
  `updated_date` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `feeadbacksystem`.`role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `feeadbacksystem`.`role` (
  `idrole` INT(11) NOT NULL,
  `code` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(45) NULL DEFAULT NULL,
  `created_by` VARCHAR(45) NULL DEFAULT NULL,
  `created_date` TIMESTAMP NULL DEFAULT NULL,
  `updated_by` VARCHAR(45) NULL DEFAULT NULL,
  `updated_date` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`idrole`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `feeadbacksystem`.`role_permission`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `feeadbacksystem`.`role_permission` (
  `id` INT(11) NOT NULL,
  `role_id` INT(11) NULL DEFAULT NULL,
  `permission_id` INT(11) NULL DEFAULT NULL,
  `created_by` VARCHAR(45) NULL DEFAULT NULL,
  `created_Date` TIMESTAMP NULL DEFAULT NULL,
  `updated_by` VARCHAR(45) NULL DEFAULT NULL,
  `updated_date` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_role_id_rolepermission_idx` (`role_id` ASC),
  INDEX `fk_permission_id_rolepermission_idx` (`permission_id` ASC),
  CONSTRAINT `fk_permission_id_rolepermission`
    FOREIGN KEY (`permission_id`)
    REFERENCES `feeadbacksystem`.`permissions` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_role_id_rolepermission`
    FOREIGN KEY (`role_id`)
    REFERENCES `feeadbacksystem`.`role` (`idrole`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `feeadbacksystem`.`user_role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `feeadbacksystem`.`user_role` (
  `id` INT(11) NOT NULL,
  `user_id` INT(11) NULL DEFAULT NULL,
  `role_id` INT(11) NULL DEFAULT NULL,
  `created_by` VARCHAR(45) NULL DEFAULT NULL,
  `created_date` TIMESTAMP NULL DEFAULT NULL,
  `updated_by` VARCHAR(45) NULL DEFAULT NULL,
  `updated_date` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_user_id_userrole_idx` (`user_id` ASC),
  INDEX `fk_role_id_userrole_idx` (`role_id` ASC),
  CONSTRAINT `fk_role_id_userrole`
    FOREIGN KEY (`role_id`)
    REFERENCES `feeadbacksystem`.`role` (`idrole`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_id_userrole`
    FOREIGN KEY (`user_id`)
    REFERENCES `feeadbacksystem`.`user` (`iduser`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;