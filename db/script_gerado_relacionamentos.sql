CREATE SCHEMA IF NOT EXISTS `tstdb` DEFAULT CHARACTER SET utf8mb4 ;
USE `tstdb` ;

-- -----------------------------------------------------
-- Table `tstdb`.`epi`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tstdb`.`epi` (
  `idepi` INT(11) NOT NULL AUTO_INCREMENT,
  `nomeepi` VARCHAR(50) NOT NULL,
  `descricao` TEXT NULL DEFAULT NULL,
  `datavalidade` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`idepi`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `tstdb`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tstdb`.`usuario` (
  `idusuario` INT(11) NOT NULL AUTO_INCREMENT,
  `nomeusuario` VARCHAR(30) NOT NULL,
  `senha` VARCHAR(200) NOT NULL,
  `nomecompleto` VARCHAR(100) NOT NULL,
  `cpf` VARCHAR(20) NOT NULL,
  `sexo` VARCHAR(15) NOT NULL,
  `idade` INT(11) NOT NULL,
  `email` VARCHAR(100) NULL DEFAULT NULL,
  `telefone` VARCHAR(30) NOT NULL,
  `datacriacao` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idusuario`),
  UNIQUE INDEX `nomeusuario` (`nomeusuario` ASC),
  UNIQUE INDEX `cpf` (`cpf` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `tstdb`.`retirada_devolucao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tstdb`.`retirada_devolucao` (
  `idretirada_devolucao` INT(11) NOT NULL AUTO_INCREMENT,
  `idepi` INT(11) NULL DEFAULT NULL,
  `idusuario` INT(11) NULL DEFAULT NULL,
  `dataretirada` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `devolvido` VARCHAR(10) NOT NULL DEFAULT 'Não',
  `datadevolucao` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`idretirada_devolucao`),
  INDEX `pk_epi_fk_retdev_idx` (`idepi` ASC),
  INDEX `pk_usuario_fk_retdev_idx` (`idusuario` ASC),
  CONSTRAINT `pk_epi_fk_retdev`
    FOREIGN KEY (`idepi`)
    REFERENCES `tstdb`.`epi` (`idepi`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `pk_usuario_fk_retdev`
    FOREIGN KEY (`idusuario`)
    REFERENCES `tstdb`.`usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

