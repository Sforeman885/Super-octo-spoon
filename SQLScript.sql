-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema amazonia
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema amazonia
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `amazonia` DEFAULT CHARACTER SET latin1 ;
USE `amazonia` ;

-- -----------------------------------------------------
-- Table `amazonia`.`Customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `amazonia`.`Customer` ;

CREATE TABLE IF NOT EXISTS `amazonia`.`Customer` (
  `CustomerId` INT(11) NOT NULL AUTO_INCREMENT,
  `Firstname` VARCHAR(15) NULL DEFAULT NULL,
  `Surname` VARCHAR(15) NULL DEFAULT NULL,
  `Email` VARCHAR(35) NULL DEFAULT NULL,
  `CardNo` BIGINT(20) NULL DEFAULT NULL,
  `Address` VARCHAR(35) NULL DEFAULT NULL,
  PRIMARY KEY (`CustomerId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `amazonia`.`Product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `amazonia`.`Product` ;

CREATE TABLE IF NOT EXISTS `amazonia`.`Product` (
  `ProductID` INT(11) NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(30) NULL DEFAULT NULL,
  `Description` TEXT NULL DEFAULT NULL,
  `Price` DECIMAL(5,2) NULL DEFAULT NULL,
  PRIMARY KEY (`ProductID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `amazonia`.`Staff`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `amazonia`.`Staff` ;

CREATE TABLE IF NOT EXISTS `amazonia`.`Staff` (
  `StaffId` INT(11) NOT NULL AUTO_INCREMENT,
  `Firstname` VARCHAR(15) NULL DEFAULT NULL,
  `Surname` VARCHAR(15) NULL DEFAULT NULL,
  PRIMARY KEY (`StaffId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `amazonia`.`Orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `amazonia`.`Orders` ;

CREATE TABLE IF NOT EXISTS `amazonia`.`Orders` (
  `OrderID` INT(11) NOT NULL AUTO_INCREMENT,
  `Quantity` INT(11) NULL DEFAULT NULL,
  `CustomerID` INT(11) NULL DEFAULT NULL,
  `ProductID` INT(11) NULL DEFAULT NULL,
  `StaffID` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `CustomerID` (`CustomerID` ASC),
  INDEX `ProductID` (`ProductID` ASC),
  INDEX `StaffID` (`StaffID` ASC),
  CONSTRAINT `Orders_ibfk_1`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `amazonia`.`Customer` (`CustomerId`),
  CONSTRAINT `Orders_ibfk_2`
    FOREIGN KEY (`ProductID`)
    REFERENCES `amazonia`.`Product` (`ProductID`),
  CONSTRAINT `Orders_ibfk_3`
    FOREIGN KEY (`StaffID`)
    REFERENCES `amazonia`.`Staff` (`StaffId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `amazonia`.`Supplier`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `amazonia`.`Supplier` ;

CREATE TABLE IF NOT EXISTS `amazonia`.`Supplier` (
  `SupplierID` INT(11) NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(25) NULL DEFAULT NULL,
  `Country` VARCHAR(25) NULL DEFAULT NULL,
  PRIMARY KEY (`SupplierID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `amazonia`.`Product_Supplier`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `amazonia`.`Product_Supplier` ;

CREATE TABLE IF NOT EXISTS `amazonia`.`Product_Supplier` (
  `ProductID` INT(11) NULL DEFAULT NULL,
  `SupplierID` INT(11) NULL DEFAULT NULL,
  INDEX `ProductID` (`ProductID` ASC),
  INDEX `SupplierID` (`SupplierID` ASC),
  CONSTRAINT `Product_Supplier_ibfk_1`
    FOREIGN KEY (`ProductID`)
    REFERENCES `amazonia`.`Product` (`ProductID`),
  CONSTRAINT `Product_Supplier_ibfk_2`
    FOREIGN KEY (`SupplierID`)
    REFERENCES `amazonia`.`Supplier` (`SupplierID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

