SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

-- -----------------------------------------------------
-- Table `mydb`.`Users`
-- -----------------------------------------------------

INSERT INTO `std10179db`.`Users`
VALUES (1,'aaa','abc1','aaa@test.com','Publishers',1);

INSERT INTO `std10179db`.`Users`
VALUES (2,'bbb','bcd2','abb@test2.com','Publishers',2);

INSERT INTO `std10179db`.`Users`
VALUES (3,'ccc','cde3','sfd@test1.com','Note_Dist',1);

INSERT INTO `std10179db`.`Users`
VALUES (4,'ddd','de3c','dfg@testM.com','Note_Dist',2);

INSERT INTO `std10179db`.`Users`
VALUES (5,'eee','sfas','sfdas@di.uoa.gr','Students',1);

INSERT INTO `std10179db`.`Users`
VALUES (6,'fff','asfd','asff_rr@di.uoa.gr','Students',2);

INSERT INTO `std10179db`.`Users`
VALUES (7,'manol','safsdg3333','manol@di.uoa.gr','Professors',1);

-- -----------------------------------------------------
-- Table `mydb`.`Department`
-- -----------------------------------------------------

INSERT INTO `std10179db`.`Department`
VALUES (1,1,1,'Tmhma Plhroforikhs kai Thlepikoinwniwn');

-- -----------------------------------------------------
-- Table `mydb`.`Students`
-- -----------------------------------------------------
INSERT INTO `std10179db`.`Students`
VALUES (1,111,'Nikos','Bletsis',6977777700,6,1);

INSERT INTO `std10179db`.`Students`
VALUES (2,112,'George','Test',6989777700,4,1);

-- -----------------------------------------------------
-- Table `mydb`.`Professors`
-- -----------------------------------------------------
INSERT INTO `std10179db`.`Professors`
VALUES (1,'Manolis','Gianopoulos',1,'EAM');

-- -----------------------------------------------------
-- Table `mydb`.`Note_Dist`
-- -----------------------------------------------------
INSERT INTO `std10179db`.`Note_Dist` 
VALUES (1,'EK_OIK','Vasilis','Mixalopoulos');

INSERT INTO `std10179db`.`Note_Dist` 
VALUES (2,'FOIT','Nikos','Bletsis');

-- -----------------------------------------------------
-- Table `mydb`.`Publishers`
-- -----------------------------------------------------
INSERT INTO `std10179db`.`Publishers`
VALUES (1,'Ekdoseis Panepisthmiou',2108881888,1);

INSERT INTO `std10179db`.`Publishers`
VALUES (2,'Ekdoseis TEST',2107772777,NULL);

-- -----------------------------------------------------
-- Table `mydb`.`Books`
-- -----------------------------------------------------
INSERT INTO `std10179db`.`Books` 
VALUES (1,1,11112,'EAM 1','Someone','EAM','2014-1-1');

INSERT INTO `std10179db`.`Books` 
VALUES (2,2,11223,'EAM 2','Else','EAM','2008-1-1');

INSERT INTO `std10179db`.`Books` 
VALUES (3,1,72225,'AI','GoodMan','Artificial_Intelligence','2012-2-1');

-- -----------------------------------------------------
-- Table `mydb`.`Notes`
-- -----------------------------------------------------
INSERT INTO `std10179db`.`Notes` 
VALUES (1,'Algebra','Aalysh 1','Kapoios','2000-1-1',2);

-- -----------------------------------------------------
-- Table `mydb`.`Asked`
-- -----------------------------------------------------
INSERT INTO `std10179db`.`Asked` 
VALUES (1,'2014-12-1',2);

-- -----------------------------------------------------
-- Table `mydb`.`Books_to_Take`
-- -----------------------------------------------------
INSERT INTO `std10179db`.`Books_to_Take` 
VALUES (1,1,1);

INSERT INTO `std10179db`.`Books_to_Take` 
VALUES (2,3,1);