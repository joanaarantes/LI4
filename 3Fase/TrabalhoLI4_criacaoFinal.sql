-- Universidade do Minho
-- Mestrado Integrado em Engenharia Informática
-- Unidade Curricular de Laboratórios de Informática 4
-- 2015/2016
--
-- Trabalho de Grupo: Explorador Espacial - Assistente de Campo
--
-- Criação da base de dados utilizando a script gerada pelo MySQL Workbench.
--
-- DROP SCHEMA `ExploradorEspacial`;

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Esquema ExploradorEspacial
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ExploradorEspacial` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `ExploradorEspacial`;

-- -----------------------------------------------------
-- Tabela `ExploradorEspacial`.`Astronauta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ExploradorEspacial`.`Astronauta` (
  `id_Astronauta` INT NOT NULL AUTO_INCREMENT,
  `NomeAstronauta` VARCHAR(45) NOT NULL,
  `PasswordAstronauta` VARCHAR(100) NOT NULL,
  `CargoAstronauta` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_Astronauta`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Tabela `ExploradorEspacial`.`Funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ExploradorEspacial`.`Funcionario` (
  `id_Funcionario` INT NOT NULL AUTO_INCREMENT,
  `NomeFuncionario` VARCHAR(45) NOT NULL,
  `PasswordFuncionario` VARCHAR(100) NOT NULL,
  `CargoFuncionario` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_Funcionario`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Tabela `ExploradorEspacial`.`Catalogo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ExploradorEspacial`.`Catalogo` (
  `id_Catalogo` INT NOT NULL AUTO_INCREMENT,
  `NomeCatalogo` VARCHAR(45) NOT NULL,
  `DescricaoCatalogo` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id_Catalogo`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Tabela `ExploradorEspacial`.`Astronauta_acede_Catalogo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ExploradorEspacial`.`Astronauta_acede_Catalogo` (
  `Astronauta_id_Astronauta` INT NOT NULL,
  `Catalogo_id_Catalogo` INT NOT NULL,
  PRIMARY KEY (`Astronauta_id_Astronauta`, `Catalogo_id_Catalogo`),
  INDEX `fk_Astronauta_acede_Catalogo_Astronauta1_idx` (`Astronauta_id_Astronauta` ASC),
  INDEX `fk_Astronauta_acede_Catalogo_Catalogo1_idx` (`Catalogo_id_Catalogo` ASC),
  CONSTRAINT `fk_Astronauta_acede_Catalogo_Astronauta1`
    FOREIGN KEY (`Astronauta_id_Astronauta`)
    REFERENCES `ExploradorEspacial`.`Astronauta` (`id_Astronauta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Astronauta_acede_Catalogo_Catalogo1`
    FOREIGN KEY (`Catalogo_id_Catalogo`)
    REFERENCES `ExploradorEspacial`.`Catalogo` (`id_Catalogo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Tabela `ExploradorEspacial`.`Mineral`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ExploradorEspacial`.`Mineral` (
  `id_Mineral` INT NOT NULL AUTO_INCREMENT,
  `NomeMineral` VARCHAR(45) NOT NULL,
  `Foto` VARCHAR(45) NOT NULL,
  `Catalogo_id_Catalogo` INT NOT NULL,
  PRIMARY KEY (`id_Mineral`),
  CONSTRAINT `fk_Mineral_Catalogo1`
    FOREIGN KEY (`Catalogo_id_Catalogo`)
    REFERENCES `ExploradorEspacial`.`Catalogo` (`id_Catalogo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Tabela `ExploradorEspacial`.`Astronauta_membro_Missao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ExploradorEspacial`.`Astronauta_membro_Missao` (
  `Astronauta_id_Astronauta` INT NOT NULL,
  `Missao_id_Missao` INT NOT NULL,
  PRIMARY KEY (`Astronauta_id_Astronauta`, `Missao_id_Missao`),
  INDEX `fk_Astronauta_membro_Missao_Astronauta1_idx` (`Astronauta_id_Astronauta` ASC),
  INDEX `fk_Astronauta_membro_Missao_Missao1_idx` (`Missao_id_Missao` ASC),
  CONSTRAINT `fk_Astronauta_membro_Missao_Astronauta1`
    FOREIGN KEY (`Astronauta_id_Astronauta`)
    REFERENCES `ExploradorEspacial`.`Astronauta` (`id_Astronauta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Astronauta_membro_Missao_Missao1`
    FOREIGN KEY (`Missao_id_Missao`)
    REFERENCES `ExploradorEspacial`.`Missao` (`id_Missao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Tabela `ExploradorEspacial`.`Historico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ExploradorEspacial`.`Historico` (
  `id_Historico` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_Historico`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Tabela `ExploradorEspacial`.`Area_Triangulo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ExploradorEspacial`.`Area_Triangulo` (
  `id_AreaTriangulo` INT NOT NULL AUTO_INCREMENT,
  `LatitudeA` VARCHAR(45) NOT NULL,
  `LongitudeA` VARCHAR(45) NOT NULL,
  `LatitudeB` VARCHAR(45) NOT NULL,
  `LongitudeB` VARCHAR(45) NOT NULL,
  `LatitudeC` VARCHAR(45) NOT NULL,
  `LongitudeC` VARCHAR(45) NOT NULL,
  `Historico_id_Historico` INT NOT NULL,
  PRIMARY KEY (`id_AreaTriangulo`),
  CONSTRAINT `fk_AreaTriangulo_Historico1`
    FOREIGN KEY (`Historico_id_Historico`)
    REFERENCES `ExploradorEspacial`.`Historico` (`id_Historico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Tabela `ExploradorEspacial`.`Veiculo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ExploradorEspacial`.`Veiculo` (
  `id_Veiculo` INT NOT NULL AUTO_INCREMENT,
  `TipoVeiculo` VARCHAR(45) NOT NULL,
  `Bateria` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_Veiculo`))
ENGINE = InnoDB;
  
-- -----------------------------------------------------
-- Tabela `ExploradorEspacial`.`Missao_tem_Veiculo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ExploradorEspacial`.`Missao_tem_Veiculo` (
  `Missao_id_Missao` INT NOT NULL,
  `Veiculo_id_Veiculo` INT NOT NULL,
  PRIMARY KEY (`Missao_id_Missao`, `Veiculo_id_Veiculo`),
  INDEX `fk_Missao_tem_Veiculo_Missao1_idx` (`Missao_id_Missao` ASC),
  INDEX `fk_Missao_tem_Veiculo_Veiculo1_idx` (`Veiculo_id_Veiculo` ASC),
  CONSTRAINT `fk_Missao_tem_Veiculo_Missao1`
    FOREIGN KEY (`Missao_id_Missao`)
    REFERENCES `ExploradorEspacial`.`Missao` (`id_Missao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Missao_tem_Veiculo_Veiculo1`
    FOREIGN KEY (`Veiculo_id_Veiculo`)
    REFERENCES `ExploradorEspacial`.`Veiculo` (`id_Veiculo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Tabela `ExploradorEspacial`.`Astro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ExploradorEspacial`.`Astro` (
  `id_Astro` INT NOT NULL AUTO_INCREMENT,
  `NomeAstro` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_Astro`))
ENGINE = InnoDB;
  
-- -----------------------------------------------------
-- Tabela `ExploradorEspacial`.`Atividade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ExploradorEspacial`.`Atividade` (
  `id_Atividade` INT NOT NULL AUTO_INCREMENT,
  `DescricaoAtividade` VARCHAR(100) NOT NULL,
  `Missao_id_Missao` INT NOT NULL,
  PRIMARY KEY (`id_Atividade`),
  CONSTRAINT `fk_Atividade_Missao1`
    FOREIGN KEY (`Missao_id_Missao`)
    REFERENCES `ExploradorEspacial`.`Missao` (`id_Missao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Tabela `ExploradorEspacial`.`Percurso`
-- -----------------------------------------------------  
CREATE TABLE IF NOT EXISTS `ExploradorEspacial`.`Percurso` (
  `id_Percurso` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_Percurso`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Tabela `ExploradorEspacial`.`Caderno_de_Notas`
-- -----------------------------------------------------  
CREATE TABLE IF NOT EXISTS `ExploradorEspacial`.`Caderno_de_Notas` (
  `id_Caderno` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_Caderno`))
ENGINE = InnoDB;  

-- -----------------------------------------------------
-- Tabela `ExploradorEspacial`.`Registo`
-- -----------------------------------------------------  
CREATE TABLE IF NOT EXISTS `ExploradorEspacial`.`Registo` (
  `id_Registo` INT NOT NULL AUTO_INCREMENT,
  `IndiceRegisto` INT NOT NULL,
  `TipoRegisto` VARCHAR(45),
  `NomeRegisto` VARCHAR(45),
  `Conteudo` VARCHAR(100),
  `Caderno_de_Notas_id_Caderno` INT NOT NULL,
  PRIMARY KEY (`id_Registo`),
  CONSTRAINT `fk_Registo_Caderno1`
    FOREIGN KEY (`Caderno_de_Notas_id_Caderno`)
    REFERENCES `ExploradorEspacial`.`Caderno_de_Notas` (`id_Caderno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Tabela `ExploradorEspacial`.`Ponto_de_Passagem`
-- -----------------------------------------------------  
CREATE TABLE IF NOT EXISTS `ExploradorEspacial`.`Ponto_de_Passagem` (
  `id_Passagem` INT NOT NULL AUTO_INCREMENT,
  `IndicePassagem` INT NOT NULL,
  `Latitude` VARCHAR(45),
  `Longitude` VARCHAR(45),
  `Percurso_id_Percurso` INT NOT NULL,
  PRIMARY KEY (`id_Passagem`),
  CONSTRAINT `fk_Ponto_de_Passagem_Percurso1`
    FOREIGN KEY (`Percurso_id_Percurso`)
    REFERENCES `ExploradorEspacial`.`Percurso` (`id_Percurso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Tabela `ExploradorEspacial`.`Caderno_composto_por_Passagem`
-- -----------------------------------------------------  
CREATE TABLE IF NOT EXISTS `ExploradorEspacial`.`Caderno_composto_por_Passagem` (
  `Ponto_de_Passagem_id_Passagem` INT NOT NULL,
  `Caderno_de_Notas_id_Caderno` INT NOT NULL,
  PRIMARY KEY (`Ponto_de_Passagem_id_Passagem`, `Caderno_de_Notas_id_Caderno`),
  INDEX `fk_Caderno_composto_por_Passagem_Passagem1_idx` (`Ponto_de_Passagem_id_Passagem` ASC),
  INDEX `fk_Caderno_composto_por_Passagem_Caderno1_idx` (`Caderno_de_Notas_id_Caderno` ASC),
  CONSTRAINT `fk_Caderno_composto_por_Passagem_Passagem1`
    FOREIGN KEY (`Ponto_de_Passagem_id_Passagem`)
    REFERENCES `ExploradorEspacial`.`Ponto_de_Passagem` (`id_Passagem`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Caderno_composto_por_Passagem_Caderno1`
    FOREIGN KEY (`Caderno_de_Notas_id_Caderno`)
    REFERENCES `ExploradorEspacial`.`Caderno_de_Notas` (`id_Caderno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Tabela `ExploradorEspacial`.`Registo_efetuado_em_Passagem`
-- -----------------------------------------------------  
CREATE TABLE IF NOT EXISTS `ExploradorEspacial`.`Registo_efetuado_em_Passagem` (
  `Registo_id_Registo` INT NOT NULL,
  `Ponto_de_Passagem_id_Passagem` INT NOT NULL,
  PRIMARY KEY (`Registo_id_Registo`, `Ponto_de_Passagem_id_Passagem`),
  INDEX `fk_Registo_efetuado_em_Passagem_Registo1_idx` (`Registo_id_Registo` ASC),
  INDEX `fk_Registo_efetuado_em_Passagem_Passagem1_idx` (`Ponto_de_Passagem_id_Passagem` ASC),
  CONSTRAINT `fk_Registo_efetuado_em_Passagem_Registo1`
    FOREIGN KEY (`Registo_id_Registo`)
    REFERENCES `ExploradorEspacial`.`Registo` (`id_Registo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Registo_efetuado_em_Passagem_Passagem1`
    FOREIGN KEY (`Ponto_de_Passagem_id_Passagem`)
    REFERENCES `ExploradorEspacial`.`Ponto_de_Passagem` (`id_Passagem`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Tabela `ExploradorEspacial`.`Missao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ExploradorEspacial`.`Missao` (
  `id_Missao` INT NOT NULL AUTO_INCREMENT,
  `DataInicio` DATE NOT NULL,
  `DataFim` DATE NOT NULL,
  `TipoMissao` VARCHAR(45) NOT NULL,
  `NomeMissao` VARCHAR(45) NOT NULL,
  `Astronauta_id_Astronauta` INT NOT NULL,
  `Caderno_de_Notas_id_Caderno` INT NOT NULL,
  `Historico_id_Historico` INT NOT NULL,
  `Percurso_id_Percurso` INT NOT NULL,
  `Astro_id_Astro` INT NOT NULL,
  PRIMARY KEY (`id_Missao`),
  CONSTRAINT `fk_Missao_Astronauta1`
    FOREIGN KEY (`Astronauta_id_Astronauta`)
    REFERENCES `ExploradorEspacial`.`Astronauta` (`id_Astronauta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Missao_Caderno1`
    FOREIGN KEY (`Caderno_de_Notas_id_Caderno`)
    REFERENCES `ExploradorEspacial`.`Caderno_de_Notas` (`id_Caderno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Missao_Historico1`
    FOREIGN KEY (`Historico_id_Historico`)
    REFERENCES `ExploradorEspacial`.`Historico` (`id_Historico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Missao_Percurso1`
    FOREIGN KEY (`Percurso_id_Percurso`)
    REFERENCES `ExploradorEspacial`.`Percurso` (`id_Percurso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Missao_Astro1`
    FOREIGN KEY (`Astro_id_Astro`)
    REFERENCES `ExploradorEspacial`.`Astro` (`id_Astro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- <fim>
-- Unidade Curricular de Laboratórios de Informática 4, 2016