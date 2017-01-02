-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema sgc
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema sgc
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sgc` DEFAULT CHARACTER SET utf8 ;
USE `sgc` ;

-- -----------------------------------------------------
-- Table `sgc`.`SGC_PAIS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sgc`.`SGC_PAIS` (
  `PAI_ID` INT NOT NULL AUTO_INCREMENT,
  `PAI_NOMBRE` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`PAI_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sgc`.`SGC_REGION`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sgc`.`SGC_REGION` (
  `REG_ID` INT NOT NULL AUTO_INCREMENT,
  `REG_NOMBRE` VARCHAR(45) NOT NULL,
  `SGC_PAIS_PAI_ID` INT NOT NULL,
  PRIMARY KEY (`REG_ID`),
  INDEX `fk_SGC_REGION_SGC_PAIS_idx` (`SGC_PAIS_PAI_ID` ASC),
  CONSTRAINT `fk_SGC_REGION_SGC_PAIS`
    FOREIGN KEY (`SGC_PAIS_PAI_ID`)
    REFERENCES `sgc`.`SGC_PAIS` (`PAI_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sgc`.`SGC_CIUDAD`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sgc`.`SGC_CIUDAD` (
  `CIU_ID` INT NOT NULL AUTO_INCREMENT,
  `CIU_NOMBRE` VARCHAR(45) NOT NULL,
  `SGC_REGION_REG_ID` INT NOT NULL,
  PRIMARY KEY (`CIU_ID`),
  INDEX `fk_SGC_CIUDAD_SGC_REGION1_idx` (`SGC_REGION_REG_ID` ASC),
  CONSTRAINT `fk_SGC_CIUDAD_SGC_REGION1`
    FOREIGN KEY (`SGC_REGION_REG_ID`)
    REFERENCES `sgc`.`SGC_REGION` (`REG_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sgc`.`SGC_PLAYA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sgc`.`SGC_PLAYA` (
  `PLA_ID` INT NOT NULL AUTO_INCREMENT,
  `PLA_NOMBRE` VARCHAR(45) NOT NULL,
  `PLA_ORIENTACION` VARCHAR(45) NOT NULL,
  `PLA_DESCRIPCION_GENERAL` VARCHAR(500) NOT NULL,
  `PLA_DESCRIPCIPCION_TECNICA` VARCHAR(500) NOT NULL,
  `PLA_FOTO_SUPERIOR` VARCHAR(500) NULL,
  `PLA_FOTO_PRINCIPAL` VARCHAR(500) NULL,
  `SGC_CIUDAD_CIU_ID` INT NOT NULL,
  PRIMARY KEY (`PLA_ID`),
  INDEX `fk_SGC_PLAYA_SGC_CIUDAD1_idx` (`SGC_CIUDAD_CIU_ID` ASC),
  CONSTRAINT `fk_SGC_PLAYA_SGC_CIUDAD1`
    FOREIGN KEY (`SGC_CIUDAD_CIU_ID`)
    REFERENCES `sgc`.`SGC_CIUDAD` (`CIU_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sgc`.`SGC_FOTO_PLAYA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sgc`.`SGC_FOTO_PLAYA` (
  `FOT_ID` INT NOT NULL AUTO_INCREMENT,
  `FOT_FECHA_HORA` DATETIME NOT NULL,
  `FOT_DESCRIPCION` VARCHAR(200) NOT NULL,
  `FOT_AUTOR` VARCHAR(45) NOT NULL,
  `SGC_PLAYA_PLA_ID` INT NOT NULL,
  PRIMARY KEY (`FOT_ID`),
  INDEX `fk_SGC_FOTO_PLAYA_SGC_PLAYA1_idx` (`SGC_PLAYA_PLA_ID` ASC),
  CONSTRAINT `fk_SGC_FOTO_PLAYA_SGC_PLAYA1`
    FOREIGN KEY (`SGC_PLAYA_PLA_ID`)
    REFERENCES `sgc`.`SGC_PLAYA` (`PLA_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sgc`.`SGC_OLEAJE_PLAYA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sgc`.`SGC_OLEAJE_PLAYA` (
  `OLE_ID` INT NOT NULL AUTO_INCREMENT,
  `OLE_FECHA_HORA` DATETIME NOT NULL,
  `OLE_PERIODO` INT NOT NULL,
  `OLE_DIRECCION` VARCHAR(45) NOT NULL,
  `SGC_PLAYA_PLA_ID` INT NOT NULL,
  PRIMARY KEY (`OLE_ID`),
  INDEX `fk_SGC_OLEAJE_PLAYA_SGC_PLAYA1_idx` (`SGC_PLAYA_PLA_ID` ASC),
  CONSTRAINT `fk_SGC_OLEAJE_PLAYA_SGC_PLAYA1`
    FOREIGN KEY (`SGC_PLAYA_PLA_ID`)
    REFERENCES `sgc`.`SGC_PLAYA` (`PLA_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sgc`.`SGC_TIEMPO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sgc`.`SGC_TIEMPO` (
  `TIE_ID` INT NOT NULL AUTO_INCREMENT,
  `TIE_DESCRIPCION` VARCHAR(45) NULL,
  PRIMARY KEY (`TIE_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sgc`.`SGC_PRONOSTICO_TIEMPO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sgc`.`SGC_PRONOSTICO_TIEMPO` (
  `PROT_ID` INT NOT NULL AUTO_INCREMENT,
  `PROT_FECHA` VARCHAR(45) NULL,
  `SGC_TIEMPO_TIE_ID` INT NOT NULL,
  `SGC_CIUDAD_CIU_ID` INT NOT NULL,
  PRIMARY KEY (`PROT_ID`),
  INDEX `fk_SGC_PRONOSTICO_TIEMPO_SGC_TIEMPO1_idx` (`SGC_TIEMPO_TIE_ID` ASC),
  INDEX `fk_SGC_PRONOSTICO_TIEMPO_SGC_CIUDAD1_idx` (`SGC_CIUDAD_CIU_ID` ASC),
  CONSTRAINT `fk_SGC_PRONOSTICO_TIEMPO_SGC_TIEMPO1`
    FOREIGN KEY (`SGC_TIEMPO_TIE_ID`)
    REFERENCES `sgc`.`SGC_TIEMPO` (`TIE_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_SGC_PRONOSTICO_TIEMPO_SGC_CIUDAD1`
    FOREIGN KEY (`SGC_CIUDAD_CIU_ID`)
    REFERENCES `sgc`.`SGC_CIUDAD` (`CIU_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sgc`.`SGC_PERFIL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sgc`.`SGC_PERFIL` (
  `PERF_NUMERO` INT NOT NULL,
  `PERF_FOTO_REFERENCIA` VARCHAR(45) NULL,
  `PERF_DESCRIPCION_MEDICION` VARCHAR(200) NULL,
  `SGC_PLAYA_PLA_ID` INT NOT NULL,
  PRIMARY KEY (`PERF_NUMERO`),
  INDEX `fk_SGC_PERFIL_SGC_PLAYA1_idx` (`SGC_PLAYA_PLA_ID` ASC),
  CONSTRAINT `fk_SGC_PERFIL_SGC_PLAYA1`
    FOREIGN KEY (`SGC_PLAYA_PLA_ID`)
    REFERENCES `sgc`.`SGC_PLAYA` (`PLA_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sgc`.`SGC_USUARIO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sgc`.`SGC_USUARIO` (
  `USR_CORREO` INT NOT NULL,
  `USR_MAIL` VARCHAR(50) NOT NULL,
  `USR_NOMBRE_APELLIDO` VARCHAR(100) NULL,
  `USR_TIPO` VARCHAR(45) NULL,
  `USR_PASS` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`USR_CORREO`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sgc`.`SGC_CAMPANHA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sgc`.`SGC_CAMPANHA` (
  `CAMP_ID` INT NOT NULL AUTO_INCREMENT,
  `CAMP_FECHA_HORA` DATETIME NOT NULL,
  `CAMP_TAMANHO_MEDICION` DECIMAL(2,2) NOT NULL,
  `CAMP_ESTADO` VARCHAR(45) NOT NULL,
  `SGC_USUARIO_ENCARGADO` INT NOT NULL,
  PRIMARY KEY (`CAMP_ID`),
  INDEX `fk_SGC_CAMPANHA_SGC_USUARIO1_idx` (`SGC_USUARIO_ENCARGADO` ASC),
  CONSTRAINT `fk_SGC_CAMPANHA_SGC_USUARIO1`
    FOREIGN KEY (`SGC_USUARIO_ENCARGADO`)
    REFERENCES `sgc`.`SGC_USUARIO` (`USR_CORREO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sgc`.`SGC_BITACORA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sgc`.`SGC_BITACORA` (
  `BIT_ID` INT NOT NULL AUTO_INCREMENT,
  `BIT_FECHA_HORA` DATETIME NULL,
  `SGC_CAMPANHA_CAMP_ID` INT NOT NULL,
  `SGC_PERFIL_PERF_NUMERO` INT NOT NULL,
  PRIMARY KEY (`BIT_ID`),
  INDEX `fk_SGC_BITACORA_SGC_CAMPANHA1_idx` (`SGC_CAMPANHA_CAMP_ID` ASC),
  INDEX `fk_SGC_BITACORA_SGC_PERFIL1_idx` (`SGC_PERFIL_PERF_NUMERO` ASC),
  CONSTRAINT `fk_SGC_BITACORA_SGC_CAMPANHA1`
    FOREIGN KEY (`SGC_CAMPANHA_CAMP_ID`)
    REFERENCES `sgc`.`SGC_CAMPANHA` (`CAMP_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_SGC_BITACORA_SGC_PERFIL1`
    FOREIGN KEY (`SGC_PERFIL_PERF_NUMERO`)
    REFERENCES `sgc`.`SGC_PERFIL` (`PERF_NUMERO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sgc`.`SGC_MEDICION`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sgc`.`SGC_MEDICION` (
  `MED_ID` INT NOT NULL AUTO_INCREMENT,
  `MED_ESTACION` INT NOT NULL,
  `MED_ESTACION_MEDICION` VARCHAR(45) NOT NULL,
  `MED_DISTANCIA_VERTICAL` DECIMAL(2,2) NOT NULL,
  `MED_DISTANCIA_HORIZONTAL` DECIMAL(2,2) NOT NULL,
  `MED_COMENTARIO` VARCHAR(500) NULL,
  `SGC_BITACORA_BIT_ID` INT NOT NULL,
  PRIMARY KEY (`MED_ID`),
  INDEX `fk_SGC_MEDICION_SGC_BITACORA1_idx` (`SGC_BITACORA_BIT_ID` ASC),
  CONSTRAINT `fk_SGC_MEDICION_SGC_BITACORA1`
    FOREIGN KEY (`SGC_BITACORA_BIT_ID`)
    REFERENCES `sgc`.`SGC_BITACORA` (`BIT_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sgc`.`SGC_INTEGRANTES_BITACORA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sgc`.`SGC_INTEGRANTES_BITACORA` (
  `INBI_ID` INT NOT NULL AUTO_INCREMENT,
  `USR_CORREO_INTEGRANTE` INT NOT NULL,
  `BIT_ID` INT NOT NULL,
  PRIMARY KEY (`INBI_ID`),
  INDEX `fk_SGC_INTEGRANTES_BITACORA_SGC_USUARIO1_idx` (`USR_CORREO_INTEGRANTE` ASC),
  INDEX `fk_SGC_INTEGRANTES_BITACORA_SGC_BITACORA1_idx` (`BIT_ID` ASC),
  CONSTRAINT `fk_SGC_INTEGRANTES_BITACORA_SGC_USUARIO1`
    FOREIGN KEY (`USR_CORREO_INTEGRANTE`)
    REFERENCES `sgc`.`SGC_USUARIO` (`USR_CORREO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_SGC_INTEGRANTES_BITACORA_SGC_BITACORA1`
    FOREIGN KEY (`BIT_ID`)
    REFERENCES `sgc`.`SGC_BITACORA` (`BIT_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sgc`.`SGC_MAREA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sgc`.`SGC_MAREA` (
  `ID_MAREA` INT NOT NULL AUTO_INCREMENT,
  `MARE_FECHA_HORA` DATETIME NOT NULL,
  `MARE_TIPO` VARCHAR(45) NOT NULL,
  `MARE_ALTURA` DECIMAL(2,2) NOT NULL,
  `SGC_CIUDAD_CIU_ID` INT NOT NULL,
  PRIMARY KEY (`ID_MAREA`),
  INDEX `fk_SGC_MAREA_SGC_CIUDAD1_idx` (`SGC_CIUDAD_CIU_ID` ASC),
  CONSTRAINT `fk_SGC_MAREA_SGC_CIUDAD1`
    FOREIGN KEY (`SGC_CIUDAD_CIU_ID`)
    REFERENCES `sgc`.`SGC_CIUDAD` (`CIU_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
