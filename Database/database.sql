-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema portfolio
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema portfolio
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `portfolio` ;
USE `portfolio` ;

-- -----------------------------------------------------
-- Table `portfolio`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`user` (
  `iduser` INT NOT NULL AUTO_INCREMENT,
  `correo` VARCHAR(50) NULL,
  `password` VARCHAR(45) NULL,
  PRIMARY KEY (`iduser`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio`.`person`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`person` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `apellido` VARCHAR(45) NULL,
  `telefono` VARCHAR(45) NULL,
  `correo` VARCHAR(45) NULL,
  `sobreMi` VARCHAR(200) NULL,
  `user_iduser` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_person_user1_idx` (`user_iduser` ASC) VISIBLE,
  CONSTRAINT `fk_person_user1`
    FOREIGN KEY (`user_iduser`)
    REFERENCES `portfolio`.`user` (`iduser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio`.`job_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`job_type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio`.`work_experience`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`work_experience` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Empresa` VARCHAR(45) NULL,
  `esTrabajoActual` TINYINT NULL,
  `fechaInicio` DATE NOT NULL,
  `fechaFin` DATE NULL,
  `descripcion` VARCHAR(200) NULL,
  `person_id` INT NOT NULL,
  `job_type_id` INT NOT NULL,
  PRIMARY KEY (`id`, `person_id`, `job_type_id`),
  INDEX `fk_work_experience_person_idx` (`person_id` ASC) VISIBLE,
  INDEX `fk_work_experience_job_type1_idx` (`job_type_id` ASC) VISIBLE,
  CONSTRAINT `fk_work_experience_person`
    FOREIGN KEY (`person_id`)
    REFERENCES `portfolio`.`person` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_work_experience_job_type1`
    FOREIGN KEY (`job_type_id`)
    REFERENCES `portfolio`.`job_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio`.`education`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`education` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `institucion` VARCHAR(100) NULL,
  `titulo` VARCHAR(100) NULL,
  `nivel` VARCHAR(25) NULL,
  `anio_egreso` DATE NOT NULL,
  `person_id` INT NOT NULL,
  PRIMARY KEY (`id`, `person_id`),
  INDEX `fk_education_person1_idx` (`person_id` ASC) VISIBLE,
  CONSTRAINT `fk_education_person1`
    FOREIGN KEY (`person_id`)
    REFERENCES `portfolio`.`person` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio`.`skill`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`skill` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `habilidad` VARCHAR(45) NULL,
  `porcentaje` INT NULL,
  `person_id` INT NOT NULL,
  PRIMARY KEY (`id`, `person_id`),
  INDEX `fk_skill_person1_idx` (`person_id` ASC) VISIBLE,
  CONSTRAINT `fk_skill_person1`
    FOREIGN KEY (`person_id`)
    REFERENCES `portfolio`.`person` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio`.`proyect`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`proyect` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NULL,
  `descripcion` VARCHAR(200) NULL,
  `proyectcol` INT NULL,
  `urlProyecto` VARCHAR(100) NULL,
  `person_id` INT NOT NULL,
  PRIMARY KEY (`id`, `person_id`),
  INDEX `fk_proyect_person1_idx` (`person_id` ASC) VISIBLE,
  CONSTRAINT `fk_proyect_person1`
    FOREIGN KEY (`person_id`)
    REFERENCES `portfolio`.`person` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
