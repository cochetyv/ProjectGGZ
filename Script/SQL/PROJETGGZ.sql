SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
USE `mydb` ;


-- -----------------------------------------------------
-- Table `mydb`.`t_formation`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`t_formation` (
  `idFormation` INT NOT NULL AUTO_INCREMENT ,
  `forTitle` VARCHAR(45) NOT NULL ,
  `forDescription` TEXT NOT NULL ,
  `forDate` DATE NOT NULL ,
  `forLenght` VARCHAR(10) NOT NULL ,
  `forPrice` DOUBLE NOT NULL ,
  PRIMARY KEY (`idFormation`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`t_teacher`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`t_teacher` (
  `idTeacher` INT NOT NULL AUTO_INCREMENT ,
  `teaLastName` VARCHAR(45) NOT NULL ,
  `teaFirstName` VARCHAR(45) NOT NULL ,
  `teaAddress` VARCHAR(60) NOT NULL ,
  `teaEmail` VARCHAR(60) NOT NULL ,
  `teaPhoneNumber` VARCHAR(13) NOT NULL ,
  `teaQualification` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`idTeacher`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`t_mustTeach`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`t_mustTeach` (
  `fkFormation` INT NOT NULL ,
  `fkTeacher` INT NOT NULL ,
  PRIMARY KEY (`fkFormation`, `fkTeacher`) ,
  INDEX `fk_t_mustTeach_t_teacher1` (`fkTeacher` ASC) ,
  CONSTRAINT `fk_t_mustTeach_t_formation1`
    FOREIGN KEY (`fkFormation` )
    REFERENCES `mydb`.`t_formation` (`idFormation` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_t_mustTeach_t_teacher1`
    FOREIGN KEY (`fkTeacher` )
    REFERENCES `mydb`.`t_teacher` (`idTeacher` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`t_student`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`t_student` (
  `idStudent` INT NOT NULL AUTO_INCREMENT ,
  `stuLastName` VARCHAR(45) NOT NULL ,
  `stuFirstName` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`idStudent`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`t_register`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`t_register` (
  `idRegister` INT NOT NULL ,
  `regDate` DATE NOT NULL ,
  `fkFormation` INT NOT NULL ,
  `fkStudent` INT NOT NULL ,
  PRIMARY KEY (`idRegister`, `fkFormation`, `fkStudent`) ,
  INDEX `fk_t_register_t_formation1` (`fkFormation` ASC) ,
  INDEX `fk_t_register_t_student1` (`fkStudent` ASC) ,
  CONSTRAINT `fk_t_register_t_formation1`
    FOREIGN KEY (`fkFormation` )
    REFERENCES `mydb`.`t_formation` (`idFormation` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_t_register_t_student1`
    FOREIGN KEY (`fkStudent` )
    REFERENCES `mydb`.`t_student` (`idStudent` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`t_satisfaction`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`t_satisfaction` (
  `idSatisfaction` INT NOT NULL AUTO_INCREMENT ,
  `satNote` VARCHAR(45) NOT NULL ,
  `satComment` VARCHAR(45) NOT NULL ,
  `fkFormation` INT NOT NULL ,
  `fkStudent` INT NOT NULL ,
  PRIMARY KEY (`idSatisfaction`, `fkFormation`, `fkStudent`) ,
  INDEX `fk_t_satisfaction_t_formation1` (`fkFormation` ASC) ,
  INDEX `fk_t_satisfaction_t_student1` (`fkStudent` ASC) ,
  CONSTRAINT `fk_t_satisfaction_t_formation1`
    FOREIGN KEY (`fkFormation` )
    REFERENCES `mydb`.`t_formation` (`idFormation` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_t_satisfaction_t_student1`
    FOREIGN KEY (`fkStudent` )
    REFERENCES `mydb`.`t_student` (`idStudent` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`t_sequence`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`t_sequence` (
  `idSequence` INT NOT NULL AUTO_INCREMENT ,
  `seqNumber` VARCHAR(45) NOT NULL ,
  `seqDate` VARCHAR(45) NOT NULL ,
  `fkStudent` INT NOT NULL ,
  `fkTeacher` INT NOT NULL ,
  PRIMARY KEY (`idSequence`, `fkStudent`, `fkTeacher`) ,
  INDEX `fk_t_sequence_t_student1` (`fkStudent` ASC) ,
  INDEX `fk_t_sequence_t_teacher1` (`fkTeacher` ASC) ,
  CONSTRAINT `fk_t_sequence_t_student1`
    FOREIGN KEY (`fkStudent` )
    REFERENCES `mydb`.`t_student` (`idStudent` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_t_sequence_t_teacher1`
    FOREIGN KEY (`fkTeacher` )
    REFERENCES `mydb`.`t_teacher` (`idTeacher` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
