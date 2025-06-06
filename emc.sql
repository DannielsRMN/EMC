-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema emc
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema emc
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `emc` DEFAULT CHARACTER SET utf8 ;
USE `emc` ;

-- -----------------------------------------------------
-- Table `emc`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `emc`.`cliente` (
  `idcliente` INT NOT NULL AUTO_INCREMENT,
  `dni` VARCHAR(8) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`idcliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `emc`.`suscrito`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `emc`.`suscrito` (
  `idsuscrito` INT NOT NULL AUTO_INCREMENT,
  `fecha` VARCHAR(45) NOT NULL,
  `cliente_idcliente` INT NOT NULL,
  PRIMARY KEY (`idsuscrito`),
  INDEX `fk_suscrito_cliente1_idx` (`cliente_idcliente` ASC) VISIBLE,
  CONSTRAINT `fk_suscrito_cliente1`
    FOREIGN KEY (`cliente_idcliente`)
    REFERENCES `emc`.`cliente` (`idcliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `emc`.`Publicacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `emc`.`Publicacion` (
  `idPublicacion` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(150) NOT NULL,
  `tema` VARCHAR(150) NOT NULL,
  `descripcion` INT NOT NULL,
  `suscrito_idsuscrito` INT NOT NULL,
  PRIMARY KEY (`idPublicacion`),
  INDEX `fk_Publicacion_suscrito1_idx` (`suscrito_idsuscrito` ASC) VISIBLE,
  CONSTRAINT `fk_Publicacion_suscrito1`
    FOREIGN KEY (`suscrito_idsuscrito`)
    REFERENCES `emc`.`suscrito` (`idsuscrito`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `emc`.`numero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `emc`.`numero` (
  `idnumero` INT NOT NULL AUTO_INCREMENT,
  `fecha` VARCHAR(45) NOT NULL,
  `resumen` VARCHAR(45) NOT NULL,
  `Publicacion_idPublicacion` INT NOT NULL,
  PRIMARY KEY (`idnumero`, `Publicacion_idPublicacion`),
  INDEX `fk_numero_Publicacion_idx` (`Publicacion_idPublicacion` ASC) VISIBLE,
  CONSTRAINT `fk_numero_Publicacion`
    FOREIGN KEY (`Publicacion_idPublicacion`)
    REFERENCES `emc`.`Publicacion` (`idPublicacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


