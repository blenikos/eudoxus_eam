SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `std10179db` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
USE `std10179db` ;

-- -----------------------------------------------------
-- Table `mydb`.`Users`
-- -----------------------------------------------------
DROP TABLE `std10179db`.`Users` ;

CREATE  TABLE `std10179db`.`Users` (
  `ID` INT NOT NULL ,
  `Username` VARCHAR(45) NOT NULL ,
  `Password` VARCHAR(45) NOT NULL ,
  `email` VARCHAR(45) NOT NULL ,
  `User_Class` VARCHAR(45) NOT NULL ,
  `Table_ID` INT NOT NULL ,
  PRIMARY KEY (`ID`) ,
  UNIQUE INDEX `Username_UNIQUE` (`Username` ASC) ,
  UNIQUE INDEX `Password_UNIQUE` (`Password` ASC) ,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Secretaries`
-- -----------------------------------------------------
DROP TABLE `std10179db`.`Secretaries` ;

CREATE  TABLE `std10179db`.`Secretaries` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `Telephone` VARCHAR(45) NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `idSecretaries_UNIQUE` (`id` ASC) ,
  CONSTRAINT `fk_Secretaries_Users1`
    FOREIGN KEY (`id` )
    REFERENCES `mydb`.`Users` (`Table_ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`University`
-- -----------------------------------------------------
DROP TABLE `std10179db`.`University` ;

CREATE  TABLE `std10179db`.`University` (
  `id` INT NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Department`
-- -----------------------------------------------------
DROP TABLE `std10179db`.`Department` ;

CREATE  TABLE `std10179db`.`Department` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `Secretary` INT UNSIGNED NOT NULL ,
  `University_id` INT NOT NULL ,
  `Name` VARCHAR(150) NULL ,
  PRIMARY KEY (`id`, `Secretary`) ,
  INDEX `fk_Department_Secretaries1` (`Secretary` ASC) ,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) ,
  INDEX `fk_Department_University1` (`University_id` ASC) ,
  CONSTRAINT `fk_Department_Secretaries1`
    FOREIGN KEY (`Secretary` )
    REFERENCES `mydb`.`Secretaries` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Department_University1`
    FOREIGN KEY (`University_id` )
    REFERENCES `mydb`.`University` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Students`
-- -----------------------------------------------------
DROP TABLE `std10179db`.`Students` ;

CREATE  TABLE `std10179db`.`Students` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `Univ_ID` VARCHAR(45) NULL ,
  `Name` VARCHAR(45) NULL ,
  `Surname` VARCHAR(45) NULL ,
  `Telephone` VARCHAR(45) NULL ,
  `Semester` INT NULL ,
  `Department_id` INT UNSIGNED NULL ,
  PRIMARY KEY (`id`, `Department_id`) ,
  UNIQUE INDEX `idStudents_UNIQUE` (`id` ASC) ,
  INDEX `fk_Students_Department1` (`Department_id` ASC) ,
  CONSTRAINT `fk_Students_Department1`
    FOREIGN KEY (`Department_id` )
    REFERENCES `mydb`.`Department` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Students_Users1`
    FOREIGN KEY (`id` )
    REFERENCES `mydb`.`Users` (`Table_ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Professors`
-- -----------------------------------------------------
DROP TABLE `std10179db`.`Professors` ;

CREATE  TABLE `std10179db`.`Professors` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `Name` VARCHAR(45) NULL ,
  `Surname` VARCHAR(45) NULL ,
  `Department` INT UNSIGNED NULL ,
  `Studied_Field` VARCHAR(45) NULL ,
  PRIMARY KEY (`id`, `Department`) ,
  UNIQUE INDEX `idProfessors_UNIQUE` (`id` ASC) ,
  INDEX `fk_Professors_Department1` (`Department` ASC) ,
  CONSTRAINT `fk_Professors_Department1`
    FOREIGN KEY (`Department` )
    REFERENCES `mydb`.`Department` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Professors_Users1`
    FOREIGN KEY (`id` )
    REFERENCES `mydb`.`Users` (`Table_ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Note_Dist`
-- -----------------------------------------------------
DROP TABLE `std10179db`.`Note_Dist` ;

CREATE  TABLE `std10179db`.`Note_Dist` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `Title` VARCHAR(45) NULL ,
  `Name` VARCHAR(45) NULL ,
  `Surname` VARCHAR(45) NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `idNote_Dist_UNIQUE` (`id` ASC) ,
  CONSTRAINT `fk_Note_Dist_Users1`
    FOREIGN KEY (`id` )
    REFERENCES `mydb`.`Users` (`Table_ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Publishers`
-- -----------------------------------------------------
DROP TABLE `std10179db`.`Publishers` ;

CREATE  TABLE IF NOT EXISTS `std10179db`.`Publishers` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `Name` VARCHAR(45) NULL ,
  `Telephone` VARCHAR(45) NULL ,
  `id_ND` INT UNSIGNED NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `idPublishers_UNIQUE` (`id` ASC) ,
  INDEX `fk_Publishers_Note_Dist1` (`id_ND` ASC) ,
  CONSTRAINT `fk_Publishers_Note_Dist1`
    FOREIGN KEY (`id_ND` )
    REFERENCES `mydb`.`Note_Dist` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Publishers_Users1`
    FOREIGN KEY (`id` )
    REFERENCES `mydb`.`Users` (`Table_ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Books`
-- -----------------------------------------------------
DROP TABLE `std10179db`.`Books` ;

CREATE  TABLE `std10179db`.`Books` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `Publisher` INT UNSIGNED NOT NULL ,
  `ISBN` VARCHAR(45) NOT NULL ,
  `Title` VARCHAR(45) NULL ,
  `Author` VARCHAR(45) NULL ,
  `Field_of_Study` VARCHAR(45) NULL ,
  `Publish_Date` DATE NULL ,
  PRIMARY KEY (`id`, `Publisher`) ,
  UNIQUE INDEX `idBooks_UNIQUE` (`id` ASC) ,
  UNIQUE INDEX `ISBN_UNIQUE` (`ISBN` ASC) ,
  INDEX `fk_Books_Publishers1` (`Publisher` ASC) ,
  CONSTRAINT `fk_Books_Publishers1`
    FOREIGN KEY (`Publisher` )
    REFERENCES `mydb`.`Publishers` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Notes`
-- -----------------------------------------------------
DROP TABLE `std10179db`.`Notes` ;

CREATE  TABLE `std10179db`.`Notes` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `Studied_Field` VARCHAR(45) NULL ,
  `Subject` VARCHAR(45) NULL ,
  `Professor` VARCHAR(45) NULL ,
  `Creation_Date` DATE NULL ,
  `Creator` INT UNSIGNED NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `idNotes_UNIQUE` (`id` ASC) ,
  INDEX `fk_Notes_Note_Dist` (`Creator` ASC) ,
  CONSTRAINT `fk_Notes_Note_Dist`
    FOREIGN KEY (`Creator` )
    REFERENCES `mydb`.`Note_Dist` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Asked`
-- -----------------------------------------------------
DROP TABLE `std10179db`.`Asked` ;

CREATE  TABLE `std10179db`.`Asked` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `Date` DATE NOT NULL ,
  `Student` INT UNSIGNED NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) ,
  UNIQUE INDEX `Date_UNIQUE` (`Date` ASC) ,
  INDEX `fk_Books_to_Take_Students1` (`Student` ASC) ,
  UNIQUE INDEX `Student_UNIQUE` (`Student` ASC) ,
  CONSTRAINT `fk_Books_to_Take_Students1`
    FOREIGN KEY (`Student` )
    REFERENCES `mydb`.`Students` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Books_to_Take`
-- -----------------------------------------------------
DROP TABLE `std10179db`.`Books_to_Take` ;

CREATE  TABLE `std10179db`.`Books_to_Take` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `Book` INT UNSIGNED NOT NULL ,
  `Asked_id` INT UNSIGNED NOT NULL ,
  PRIMARY KEY (`id`, `Book`) ,
  INDEX `fk_Books_to_Take_Books1` (`Book` ASC) ,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) ,
  INDEX `fk_Books_to_Take_Asked1` (`Asked_id` ASC) ,
  CONSTRAINT `fk_Books_to_Take_Books1`
    FOREIGN KEY (`Book` )
    REFERENCES `mydb`.`Books` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Books_to_Take_Asked1`
    FOREIGN KEY (`Asked_id` )
    REFERENCES `mydb`.`Asked` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Coursess`
-- -----------------------------------------------------
DROP TABLE `std10179db`.`Coursess` ;

CREATE  TABLE `std10179db`.`Coursess` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `Department` INT UNSIGNED NOT NULL ,
  `Title` VARCHAR(45) NULL ,
  `Semester` INT NULL ,
  PRIMARY KEY (`id`, `Department`) ,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) ,
  INDEX `fk_Lessons_Department1` (`Department` ASC) ,
  CONSTRAINT `fk_Lessons_Department1`
    FOREIGN KEY (`Department` )
    REFERENCES `mydb`.`Department` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Proposed`
-- -----------------------------------------------------
DROP TABLE `std10179db`.`Proposed` ;

CREATE  TABLE `std10179db`.`Proposed` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `Book` INT UNSIGNED NOT NULL ,
  `Course` INT UNSIGNED NOT NULL ,
  PRIMARY KEY (`id`, `Book`, `Course`) ,
  INDEX `fk_Proposed_Books1` (`Book` ASC) ,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) ,
  INDEX `fk_Proposed_Lessons1` (`Course` ASC) ,
  CONSTRAINT `fk_Proposed_Books1`
    FOREIGN KEY (`Book` )
    REFERENCES `mydb`.`Books` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Proposed_Lessons1`
    FOREIGN KEY (`Course` )
    REFERENCES `mydb`.`Coursess` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Professors_has_Proposed`
-- -----------------------------------------------------
DROP TABLE `std10179db`.`Professors_has_Proposed` ;

CREATE  TABLE `std10179db`.`Professors_has_Proposed` (
  `Professors_id` INT UNSIGNED NOT NULL ,
  `Proposed_id` INT NOT NULL ,
  PRIMARY KEY (`Professors_id`, `Proposed_id`) ,
  INDEX `fk_Professors_has_Proposed_Proposed1` (`Proposed_id` ASC) ,
  INDEX `fk_Professors_has_Proposed_Professors1` (`Professors_id` ASC) ,
  CONSTRAINT `fk_Professors_has_Proposed_Professors1`
    FOREIGN KEY (`Professors_id` )
    REFERENCES `mydb`.`Professors` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Professors_has_Proposed_Proposed1`
    FOREIGN KEY (`Proposed_id` )
    REFERENCES `mydb`.`Proposed` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Approved_Books`
-- -----------------------------------------------------
DROP TABLE `std10179db`.`Approved_Books` ;

CREATE  TABLE `std10179db`.`Approved_Books` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `Book` INT UNSIGNED NOT NULL ,
  `Course` INT UNSIGNED NOT NULL ,
  PRIMARY KEY (`id`, `Book`, `Course`) ,
  INDEX `fk_Approved_Books_Books1` (`Book` ASC) ,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) ,
  INDEX `fk_Approved_Books_Lessons1` (`Course` ASC) ,
  CONSTRAINT `fk_Approved_Books_Books1`
    FOREIGN KEY (`Book` )
    REFERENCES `mydb`.`Books` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Approved_Books_Lessons1`
    FOREIGN KEY (`Course` )
    REFERENCES `mydb`.`Coursess` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Secretaries_has_Approved_Books`
-- -----------------------------------------------------
DROP TABLE `std10179db`.`Secretaries_has_Approved_Books` ;

CREATE  TABLE `std10179db`.`Secretaries_has_Approved_Books` (
  `Secretaries_id` INT UNSIGNED NOT NULL ,
  `Approved_Books_id` INT NOT NULL ,
  PRIMARY KEY (`Secretaries_id`, `Approved_Books_id`) ,
  INDEX `fk_Secretaries_has_Approved_Books_Approved_Books1` (`Approved_Books_id` ASC) ,
  INDEX `fk_Secretaries_has_Approved_Books_Secretaries1` (`Secretaries_id` ASC) ,
  CONSTRAINT `fk_Secretaries_has_Approved_Books_Secretaries1`
    FOREIGN KEY (`Secretaries_id` )
    REFERENCES `mydb`.`Secretaries` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Secretaries_has_Approved_Books_Approved_Books1`
    FOREIGN KEY (`Approved_Books_id` )
    REFERENCES `mydb`.`Approved_Books` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Courses_has_Professors`
-- -----------------------------------------------------
DROP TABLE `std10179db`.`Courses_has_Professors` ;

CREATE  TABLE `std10179db`.`Courses_has_Professors` (
  `Courses_id` INT UNSIGNED NOT NULL ,
  `Professors_id` INT UNSIGNED NOT NULL ,
  PRIMARY KEY (`Courses_id`, `Professors_id`) ,
  INDEX `fk_Lessons_has_Professors_Professors1` (`Professors_id` ASC) ,
  INDEX `fk_Lessons_has_Professors_Lessons1` (`Courses_id` ASC) ,
  CONSTRAINT `fk_Lessons_has_Professors_Lessons1`
    FOREIGN KEY (`Courses_id` )
    REFERENCES `mydb`.`Coursess` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Lessons_has_Professors_Professors1`
    FOREIGN KEY (`Professors_id` )
    REFERENCES `mydb`.`Professors` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
