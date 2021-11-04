-- MySQL Script generated by MySQL Workbench
-- Wed Nov  3 22:20:34 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema turnero_castracion56
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema turnero_castracion56
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `turnero_castracion56` DEFAULT CHARACTER SET utf8 ;
USE `turnero_castracion56` ;

-- -----------------------------------------------------
-- Table `turnero_castracion56`.`barrios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `turnero_castracion56`.`barrios` (
  `idbarrios` INT NOT NULL AUTO_INCREMENT,
  `barrio` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idbarrios`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `turnero_castracion56`.`mascotas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `turnero_castracion56`.`mascotas` (
  `idmascotas` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `fecha_nacimiento` DATE NOT NULL,
  `raza` VARCHAR(45) NOT NULL,
  `peso` INT NOT NULL,
  `tamaño` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idmascotas`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `turnero_castracion56`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `turnero_castracion56`.`clientes` (
  `idclientes` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `apellido` VARCHAR(45) NULL DEFAULT NULL,
  `direccion` CHAR(25) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `idbarrios` INT NULL DEFAULT NULL,
  `num_doc` INT NULL DEFAULT NULL,
  `telefono` INT NULL DEFAULT NULL,
  `e-mail` CHAR(45) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `idmascotas` INT NULL DEFAULT NULL,
  PRIMARY KEY (`idclientes`),
  INDEX `idmascotas_idx` (`idmascotas` ASC) VISIBLE,
  INDEX `idbarrios_idx` (`idbarrios` ASC) INVISIBLE,
  CONSTRAINT `idbarrios`
    FOREIGN KEY (`idbarrios`)
    REFERENCES `turnero_castracion56`.`barrios` (`idbarrios`),
  CONSTRAINT `idmascotas`
    FOREIGN KEY (`idmascotas`)
    REFERENCES `turnero_castracion56`.`mascotas` (`idmascotas`))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `turnero_castracion56`.`facturas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `turnero_castracion56`.`facturas` (
  `idnumero` INT NOT NULL AUTO_INCREMENT,
  `tipo_factura` INT NOT NULL,
  `fecha_factura` DATE NOT NULL,
  `precio_venta` FLOAT NOT NULL,
  PRIMARY KEY (`idnumero`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `turnero_castracion56`.`veterinarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `turnero_castracion56`.`veterinarios` (
  `idveterinarios` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `telefono` INT NOT NULL,
  `direccion` VARCHAR(30) CHARACTER SET 'utf8' NOT NULL,
  `matricula` VARCHAR(20) CHARACTER SET 'utf8' NOT NULL,
  PRIMARY KEY (`idveterinarios`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `turnero_castracion56`.`tratamientos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `turnero_castracion56`.`tratamientos` (
  `idtratamientos` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(45) NOT NULL,
  `idveterinarios` INT NOT NULL,
  PRIMARY KEY (`idtratamientos`),
  INDEX `idveterinarios_idx` (`idveterinarios` ASC) VISIBLE,
  CONSTRAINT `idveterinarios`
    FOREIGN KEY (`idveterinarios`)
    REFERENCES `turnero_castracion56`.`veterinarios` (`idveterinarios`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `turnero_castracion56`.`detalle_de_facturas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `turnero_castracion56`.`detalle_de_facturas` (
  `iddetalle_de_facturas` INT NOT NULL AUTO_INCREMENT,
  `idclientes` INT NOT NULL,
  `idveterinarios` INT NOT NULL,
  `idtratamientos` INT NOT NULL,
  `idnumero` INT NOT NULL,
  PRIMARY KEY (`iddetalle_de_facturas`),
  INDEX `idnumero_idx` (`idnumero` ASC) VISIBLE,
  INDEX `idclientes_idx` (`idclientes` ASC) VISIBLE,
  INDEX `idveterinarios_idx` (`idveterinarios` ASC) VISIBLE,
  INDEX `idtratamientos_idx` (`idtratamientos` ASC) VISIBLE,
  CONSTRAINT `idclientess`
    FOREIGN KEY (`idclientes`)
    REFERENCES `turnero_castracion56`.`clientes` (`idclientes`),
  CONSTRAINT `idnumeros`
    FOREIGN KEY (`idnumero`)
    REFERENCES `turnero_castracion56`.`facturas` (`idnumero`),
  CONSTRAINT `idtratamientoss`
    FOREIGN KEY (`idtratamientos`)
    REFERENCES `turnero_castracion56`.`tratamientos` (`idtratamientos`),
  CONSTRAINT `idveterinarioss`
    FOREIGN KEY (`idveterinarios`)
    REFERENCES `turnero_castracion56`.`veterinarios` (`idveterinarios`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `turnero_castracion56`.`mascotasxveterinarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `turnero_castracion56`.`mascotasxveterinarios` (
  `idmascotasxveterinarios` INT UNSIGNED NOT NULL,
  `idmascotas` INT NOT NULL,
  `idveterinarios` INT NOT NULL,
  `diagnosticos` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idmascotasxveterinarios`),
  INDEX `idmascotas_idx` (`idmascotas` ASC) VISIBLE,
  INDEX `idveterinarios_idx` (`idveterinarios` ASC) VISIBLE,
  CONSTRAINT `idmascota`
    FOREIGN KEY (`idmascotas`)
    REFERENCES `turnero_castracion56`.`mascotas` (`idmascotas`),
  CONSTRAINT `idveterinario`
    FOREIGN KEY (`idveterinarios`)
    REFERENCES `turnero_castracion56`.`veterinarios` (`idveterinarios`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `turnero_castracion56`.`semanas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `turnero_castracion56`.`semanas` (
  `idsemanas` INT NOT NULL AUTO_INCREMENT,
  `dia` DATE NOT NULL,
  PRIMARY KEY (`idsemanas`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `turnero_castracion56`.`turnos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `turnero_castracion56`.`turnos` (
  `idturnos` INT NOT NULL AUTO_INCREMENT,
  `horaturno` VARCHAR(45) NOT NULL,
  `idsemanas` INT NOT NULL,
  PRIMARY KEY (`idturnos`),
  INDEX `idsemanas_idx` (`idsemanas` ASC) VISIBLE,
  CONSTRAINT `idsemanas`
    FOREIGN KEY (`idsemanas`)
    REFERENCES `turnero_castracion56`.`semanas` (`idsemanas`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `turnero_castracion56`.`turnoxclientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `turnero_castracion56`.`turnoxclientes` (
  `idturnosxclientes` INT NOT NULL AUTO_INCREMENT,
  `idclientes` INT NOT NULL,
  `idtratamientos` INT NOT NULL,
  `idturnos` INT NULL DEFAULT NULL,
  PRIMARY KEY (`idturnosxclientes`),
  INDEX `idtratamientos_idx` (`idtratamientos` ASC) VISIBLE,
  INDEX `idclientes_idx` (`idclientes` ASC) VISIBLE,
  INDEX `idturnos_idx` (`idturnos` ASC) VISIBLE,
  CONSTRAINT `idcliente`
    FOREIGN KEY (`idclientes`)
    REFERENCES `turnero_castracion56`.`clientes` (`idclientes`),
  CONSTRAINT `idtratamiento`
    FOREIGN KEY (`idtratamientos`)
    REFERENCES `turnero_castracion56`.`tratamientos` (`idtratamientos`),
  CONSTRAINT `idturnoss`
    FOREIGN KEY (`idturnos`)
    REFERENCES `turnero_castracion56`.`turnos` (`idturnos`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `turnero_castracion56`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `turnero_castracion56`.`usuarios` (
  `idusuario` INT NOT NULL AUTO_INCREMENT,
  `login` VARCHAR(45) NULL DEFAULT NULL,
  `clave` INT NULL DEFAULT NULL,
  `idclientes` INT NULL DEFAULT NULL,
  PRIMARY KEY (`idusuario`),
  INDEX `idclientes_idx` (`idclientes` ASC) VISIBLE,
  CONSTRAINT `idclientes`
    FOREIGN KEY (`idclientes`)
    REFERENCES `turnero_castracion56`.`clientes` (`idclientes`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
