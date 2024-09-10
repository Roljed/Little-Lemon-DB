-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Little-Lemon-DB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Little-Lemon-DB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Little-Lemon-DB` DEFAULT CHARACTER SET utf8 ;
USE `Little-Lemon-DB` ;

-- -----------------------------------------------------
-- Table `Little-Lemon-DB`.`Starters`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Little-Lemon-DB`.`Starters` (
  `StarterID` INT NOT NULL,
  `StarterName` VARCHAR(45) NOT NULL,
  `Price` DECIMAL NOT NULL,
  PRIMARY KEY (`StarterID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Little-Lemon-DB`.`CoursesID`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Little-Lemon-DB`.`CoursesID` (
  `CourseID` INT NOT NULL,
  `CourseName` VARCHAR(45) NOT NULL,
  `Price` DECIMAL NOT NULL,
  PRIMARY KEY (`CourseID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Little-Lemon-DB`.`Drinks`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Little-Lemon-DB`.`Drinks` (
  `DrinkID` INT NOT NULL,
  `DrinkName` VARCHAR(45) NOT NULL,
  `Price` DECIMAL NOT NULL,
  PRIMARY KEY (`DrinkID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Little-Lemon-DB`.`Desserts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Little-Lemon-DB`.`Desserts` (
  `DessertID` INT NOT NULL,
  `DessertName` VARCHAR(45) NOT NULL,
  `Price` DECIMAL NOT NULL,
  PRIMARY KEY (`DessertID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Little-Lemon-DB`.`Menus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Little-Lemon-DB`.`Menus` (
  `MenuID` INT NOT NULL,
  `Cuisine` VARCHAR(45) NOT NULL,
  `StartersID` INT NOT NULL,
  `CoursesID` INT NOT NULL,
  `DrinksID` INT NOT NULL,
  `DessertsID` INT NOT NULL,
  PRIMARY KEY (`MenuID`),
  INDEX `StartersID_idx` (`StartersID` ASC) VISIBLE,
  INDEX `CourseID_idx` (`CoursesID` ASC) VISIBLE,
  INDEX `DrinksID_idx` (`DrinksID` ASC) VISIBLE,
  INDEX `DessertsID_idx` (`DessertsID` ASC) VISIBLE,
  CONSTRAINT `StartersID`
    FOREIGN KEY (`StartersID`)
    REFERENCES `Little-Lemon-DB`.`Starters` (`StarterID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `CourseID`
    FOREIGN KEY (`CoursesID`)
    REFERENCES `Little-Lemon-DB`.`CoursesID` (`CourseID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `DrinksID`
    FOREIGN KEY (`DrinksID`)
    REFERENCES `Little-Lemon-DB`.`Drinks` (`DrinkID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `DessertsID`
    FOREIGN KEY (`DessertsID`)
    REFERENCES `Little-Lemon-DB`.`Desserts` (`DessertID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Little-Lemon-DB`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Little-Lemon-DB`.`Customers` (
  `CustomerID` INT NOT NULL,
  `FisrtName` VARCHAR(255) NOT NULL,
  `LastName` VARCHAR(255) NOT NULL,
  `Phone` INT NOT NULL,
  `Email` VARCHAR(100) NOT NULL,
  `Street` VARCHAR(255) NOT NULL,
  `City` VARCHAR(45) NOT NULL,
  `Country` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Little-Lemon-DB`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Little-Lemon-DB`.`Orders` (
  `OrderID` INT NOT NULL,
  `TableNumber` INT NOT NULL,
  `MenuID` INT NOT NULL,
  `OrderDate` DATE NOT NULL,
  `BillAmount` DECIMAL NOT NULL,
  `CustomerID` INT NOT NULL,
  `Quantity` INT NOT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `MenuID_idx` (`MenuID` ASC) VISIBLE,
  INDEX `CustomerID_idx` (`CustomerID` ASC) VISIBLE,
  CONSTRAINT `MenuID`
    FOREIGN KEY (`MenuID`)
    REFERENCES `Little-Lemon-DB`.`Menus` (`MenuID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `CustomerID`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `Little-Lemon-DB`.`Customers` (`CustomerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Little-Lemon-DB`.`Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Little-Lemon-DB`.`Staff` (
  `EmployeeID` INT NOT NULL,
  `FirstName` VARCHAR(255) NOT NULL,
  `LastName` VARCHAR(255) NOT NULL,
  `Role` VARCHAR(45) NOT NULL,
  `Salary` INT NOT NULL,
  PRIMARY KEY (`EmployeeID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Little-Lemon-DB`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Little-Lemon-DB`.`Bookings` (
  `BookingID` INT NOT NULL,
  `TableNumber` INT NOT NULL,
  `CustomerID` INT NOT NULL,
  `Date` DATE NOT NULL,
  `EmployeeID` INT NOT NULL,
  PRIMARY KEY (`BookingID`),
  INDEX `CustomerIDFK_idx` (`CustomerID` ASC) VISIBLE,
  INDEX `EmployeeID_idx` (`EmployeeID` ASC) VISIBLE,
  CONSTRAINT `CustomerIDFK`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `Little-Lemon-DB`.`Customers` (`CustomerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `EmployeeIDFK`
    FOREIGN KEY (`EmployeeID`)
    REFERENCES `Little-Lemon-DB`.`Staff` (`EmployeeID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Little-Lemon-DB`.`OrderStatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Little-Lemon-DB`.`OrderStatus` (
  `OrderStatusID` INT NOT NULL,
  `OrderID` INT NOT NULL,
  `CustomerID` INT NOT NULL,
  `EmployeeID` INT NOT NULL,
  `Status` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`OrderStatusID`),
  INDEX `OrderIDFK_idx` (`OrderID` ASC) VISIBLE,
  INDEX `CustomerIDKF-Status_idx` (`CustomerID` ASC) VISIBLE,
  INDEX `EmployeeIDFK_idx` (`EmployeeID` ASC) VISIBLE,
  CONSTRAINT `OrderIDFK`
    FOREIGN KEY (`OrderID`)
    REFERENCES `Little-Lemon-DB`.`Orders` (`OrderID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `CustomerIDKF-Status`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `Little-Lemon-DB`.`Customers` (`CustomerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `EmployeeIDFK-Status`
    FOREIGN KEY (`EmployeeID`)
    REFERENCES `Little-Lemon-DB`.`Staff` (`EmployeeID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
