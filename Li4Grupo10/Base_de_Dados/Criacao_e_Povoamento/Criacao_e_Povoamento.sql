
-- -----------------------------------------------------
-- Esquema ExploradorEspacial
-- -----------------------------------------------------

CREATE DATABASE ExploradorEspacial
GO

USE ExploradorEspacial
GO

-- -----------------------------------------------------
-- Tabela `ExploradorEspacial`.`Astronauta`
-- -----------------------------------------------------

CREATE TABLE Astronauta (
 id_Astronauta INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
 NomeAstronauta VARCHAR(45) NOT NULL,
 PasswordAstronauta VARCHAR(100) NOT NULL,
 CargoAstronauta VARCHAR(45) NOT NULL)
GO
 
-- -----------------------------------------------------
-- Tabela `ExploradorEspacial`.`Funcionario`
-- -----------------------------------------------------
CREATE TABLE Funcionario (
  id_Funcionario INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  NomeFuncionario VARCHAR(45) NOT NULL,
  PasswordFuncionario VARCHAR(100) NOT NULL,
  CargoFuncionario VARCHAR(45) NOT NULL)
GO
 
-- -----------------------------------------------------
-- Tabela `ExploradorEspacial`.`Catalogo`
-- -----------------------------------------------------
CREATE TABLE Catalogo (
  id_Catalogo INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  NomeCatalogo VARCHAR(45) NOT NULL,
  DescricaoCatalogo VARCHAR(100) NOT NULL)
GO

-- -----------------------------------------------------
-- Tabela `ExploradorEspacial`.`Astronauta_acede_Catalogo`
-- -----------------------------------------------------
CREATE TABLE Astronauta_acede_Catalogo (
  Astronauta_id_Astronauta INT NOT NULL,
  Catalogo_id_Catalogo INT NOT NULL,
  CONSTRAINT fk_Astronauta_acede_Catalogo_Astronauta1
	FOREIGN KEY (Astronauta_id_Astronauta)
	REFERENCES Astronauta (id_Astronauta),
  CONSTRAINT fk_Astronauta_acede_Catalogo_Catalogo1
	FOREIGN KEY (Catalogo_id_Catalogo)
	REFERENCES Catalogo (id_Catalogo))
GO

-- -----------------------------------------------------
-- Tabela `ExploradorEspacial`.`Mineral`
-- -----------------------------------------------------
CREATE TABLE Mineral (
  id_Mineral INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  NomeMineral VARCHAR(45) NOT NULL,
  Foto VARCHAR(45) NOT NULL,
  Catalogo_id_Catalogo INT NOT NULL,  
  CONSTRAINT fk_Mineral_Catalogo1
    FOREIGN KEY (Catalogo_id_Catalogo)
    REFERENCES Catalogo (id_Catalogo))
GO

-- -----------------------------------------------------
-- Tabela `ExploradorEspacial`.`Astronauta_membro_Missao`
-- -----------------------------------------------------
CREATE TABLE Astronauta_membro_Missao (
  Astronauta_id_Astronauta INT NOT NULL,
  Missao_id_Missao INT NOT NULL,
  CONSTRAINT fk_Astronauta_membro_Missao_Astronauta1
    FOREIGN KEY (Astronauta_id_Astronauta)
    REFERENCES Astronauta (id_Astronauta),
  CONSTRAINT fk_Astronauta_membro_Missao_Missao1
    FOREIGN KEY (Missao_id_Missao)
    REFERENCES Missao (id_Missao))
GO
 
-- -----------------------------------------------------
-- Tabela `ExploradorEspacial`.`Historico`
-- -----------------------------------------------------
CREATE TABLE Historico (
  id_Historico INT PRIMARY KEY NOT NULL AUTO_INCREMENT))
GO

-- -----------------------------------------------------
-- Tabela `ExploradorEspacial`.`Area_Triangulo`
-- -----------------------------------------------------
CREATE TABLE Area_Triangulo (
  id_AreaTriangulo INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  LatitudeA VARCHAR(45) NOT NULL,
  LongitudeA VARCHAR(45) NOT NULL,
  LatitudeB VARCHAR(45) NOT NULL,
  LongitudeB VARCHAR(45) NOT NULL,
  LatitudeC VARCHAR(45) NOT NULL,
  LongitudeC VARCHAR(45) NOT NULL,
  Historico_id_Historico INT NOT NULL,
  CONSTRAINT fk_AreaTriangulo_Historico1
    FOREIGN KEY (Historico_id_Historico)
    REFERENCES Historico (id_Historico))
GO

-- -----------------------------------------------------
-- Tabela `ExploradorEspacial`.`Veiculo`
-- -----------------------------------------------------
CREATE TABLE Veiculo (
  id_Veiculo INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  TipoVeiculo VARCHAR(45) NOT NULL,
  Bateria VARCHAR(45) NOT NULL)
GO

-- -----------------------------------------------------
-- Tabela `ExploradorEspacial`.`Missao_tem_Veiculo`
-- -----------------------------------------------------
CREATE TABLE Missao_tem_Veiculo (
  Missao_id_Missao INT NOT NULL,
  Veiculo_id_Veiculo INT NOT NULL,
  CONSTRAINT fk_Missao_tem_Veiculo_Missao1
    FOREIGN KEY (Missao_id_Missao)
    REFERENCES Missao (id_Missao),
  CONSTRAINT fk_Missao_tem_Veiculo_Veiculo1
    FOREIGN KEY (Veiculo_id_Veiculo)
    REFERENCES Veiculo (id_Veiculo))
GO

-- -----------------------------------------------------
-- Tabela `ExploradorEspacial`.`Astro`
-- -----------------------------------------------------
CREATE TABLE Astro (
  id_Astro INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  NomeAstro VARCHAR(45) NOT NULL)
GO
 
-- -----------------------------------------------------
-- Tabela `ExploradorEspacial`.`Atividade`
-- -----------------------------------------------------
CREATE TABLE Atividade (
  id_Atividade INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  DescricaoAtividade VARCHAR(100) NOT NULL,
  Missao_id_Missao INT NOT NULL,
  CONSTRAINT fk_Atividade_Missao1
    FOREIGN KEY (Missao_id_Missao)
    REFERENCES Missao (id_Missao))
GO

-- -----------------------------------------------------
-- Tabela `ExploradorEspacial`.`Percurso`
-- -----------------------------------------------------  
CREATE TABLE Percurso (
  id_Percurso INT PRIMARY KEY NOT NULL AUTO_INCREMENT)
GO

-- -----------------------------------------------------
-- Tabela `ExploradorEspacial`.`Caderno_de_Notas`
-- -----------------------------------------------------  
CREATE TABLE Caderno_de_Notas (
  id_Caderno INT PRIMARY KEY NOT NULL AUTO_INCREMENT)
GO

-- -----------------------------------------------------
-- Tabela `ExploradorEspacial`.`Registo`
-- -----------------------------------------------------  
CREATE TABLE Registo (
  id_Registo INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  IndiceRegisto INT NOT NULL,
  TipoRegisto VARCHAR(45),
  NomeRegisto VARCHAR(45),
  Conteudo VARCHAR(100),
  Caderno_de_Notas_id_Caderno INT NOT NULL,
  CONSTRAINT fk_Registo_Caderno1
    FOREIGN KEY (Caderno_de_Notas_id_Caderno)
    REFERENCES Caderno_de_Notas (id_Caderno))
GO

-- -----------------------------------------------------
-- Tabela `ExploradorEspacial`.`Ponto_de_Passagem`
-- -----------------------------------------------------  
CREATE TABLE Ponto_de_Passagem (
  id_Passagem INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  IndicePassagem INT NOT NULL,
  Latitude VARCHAR(45),
  Longitude VARCHAR(45),
  Percurso_id_Percurso INT NOT NULL,
  CONSTRAINT fk_Ponto_de_Passagem_Percurso1
    FOREIGN KEY (Percurso_id_Percurso)
    REFERENCES Percurso (id_Percurso))
GO

-- -----------------------------------------------------
-- Tabela `ExploradorEspacial`.`Caderno_composto_por_Passagem`
-- -----------------------------------------------------  
CREATE TABLE Caderno_composto_por_Passagem (
  Ponto_de_Passagem_id_Passagem INT NOT NULL,
  Caderno_de_Notas_id_Caderno INT NOT NULL,
  CONSTRAINT fk_Caderno_composto_por_Passagem_Passagem1
    FOREIGN KEY (Ponto_de_Passagem_id_Passagem)
    REFERENCES Ponto_de_Passagem (id_Passagem),
  CONSTRAINT fk_Caderno_composto_por_Passagem_Caderno1
    FOREIGN KEY (Caderno_de_Notas_id_Caderno)
    REFERENCES Caderno_de_Notas (id_Caderno))
GO

-- -----------------------------------------------------
-- Tabela `ExploradorEspacial`.`Registo_efetuado_em_Passagem`
-- -----------------------------------------------------  
CREATE TABLE Registo_efetuado_em_Passagem (
  Registo_id_Registo` INT NOT NULL,
  Ponto_de_Passagem_id_Passagem INT NOT NULL,
  CONSTRAINT fk_Registo_efetuado_em_Passagem_Registo1
    FOREIGN KEY (Registo_id_Registo)
    REFERENCES Registo (id_Registo),
  CONSTRAINT fk_Registo_efetuado_em_Passagem_Passagem1
    FOREIGN KEY (Ponto_de_Passagem_id_Passagem)
    REFERENCES Ponto_de_Passagem (id_Passagem))
GO

-- -----------------------------------------------------
-- Tabela `ExploradorEspacial`.`Missao`
-- -----------------------------------------------------
CREATE TABLE Missao (
  id_Missao INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  DataInicio DATE NOT NULL,
  DataFim DATE NOT NULL,
  TipoMissao VARCHAR(45) NOT NULL,
  NomeMissao VARCHAR(45) NOT NULL,
  Astronauta_id_Astronauta INT NOT NULL,
  Caderno_de_Notas_id_Caderno INT NOT NULL,
  Historico_id_Historico INT NOT NULL,
  Percurso_id_Percurso INT NOT NULL,
  Astro_id_Astro INT NOT NULL,
  CONSTRAINT fk_Missao_Astronauta1
    FOREIGN KEY (Astronauta_id_Astronauta)
    REFERENCES Astronauta (id_Astronauta),
  CONSTRAINT fk_Missao_Caderno1
    FOREIGN KEY (Caderno_de_Notas_id_Caderno)
    REFERENCES Caderno_de_Notas (id_Caderno),
  CONSTRAINT fk_Missao_Historico1
    FOREIGN KEY (Historico_id_Historico)
    REFERENCES Historico (id_Historico),
  CONSTRAINT fk_Missao_Percurso1
    FOREIGN KEY (Percurso_id_Percurso)
    REFERENCES Percurso (id_Percurso),
  CONSTRAINT fk_Missao_Astro1
    FOREIGN KEY (Astro_id_Astro)
    REFERENCES Astro (id_Astro))
GO

-- -----------------------------------------------------
-- Povoamento da tabela `ExploradorEspacial`.`Astronauta`
-- -----------------------------------------------------

begin
insert into Astronauta values
	(1,'Maria Helena','mariahelena52','Gestor de Missao')
insert into Astronauta values
	(2,'Pedro Cunha','pcunha92','Especialista de Rochas')
insert into Astronauta values
	(3,'Pedro Alves','pedroaalves','Medico')
insert into Astronauta values
	(4,'Joana Arantes','joarantes91','Cartografo')
insert into Astronauta values
	(5,'Daniel Malhadas','dmalhadas5''Geologo')
insert into Astronauta values
	(6,'Jessica Pereira','jessyper','Gestor de Missao')
insert into Astronauta values
	(7,'Rita Rua','ruar','Geologo')
insert into Astronauta values
	(8,'Susana Mendes','sukinha1904','Cartografo')
insert into Astronauta values
	(9,'Maria Pereira','mary_14','Especialista de Rochas')
insert into Astronauta values
	(10,'Marcos Pereira','marcos1234','Medico')
insert into Astronauta values
	(11,'Alexandre Silva','alex1234','Gestor de Missao')
end

-- -----------------------------------------------------
-- Povoamento da tabela `ExploradorEspacial`.`Funcionario`
-- -----------------------------------------------------

begin
insert into Funcionario values
	(1,'Silvia Rocha','silviarock','Gestor')
insert into Funcionario values
	(2,'Rui Barbosa','barbosa712','Chefe')
insert into Funcionario values
	(3,'Ana Oliveira','ananana','Gestor')
insert into Funcionario values
	(4,'Mafalda Caldas','mafy15.91','Chefe')
insert into Funcionario values
	(5,'Arnaldo Arantes','arnaldo.fr''Gestor')
end

-- -----------------------------------------------------
-- Povoamento da tabela `ExploradorEspacial`.`Catalogo`
-- -----------------------------------------------------

begin
insert into Catalogo values
	(1,'Rochas e Minerais','Catalogo de rochas e minerais.')
insert into Catalogo values
    (2,'Solo','Catalogo sobre amostras do solo do astro.')
end

-- -----------------------------------------------------
-- Povoamento da tabela `ExploradorEspacial`.`Mineral`
-- -----------------------------------------------------

begin
insert into Mineral values
	(1,'Basalto','basalto_01',1)
insert into Mineral values
	(2,'Anortosito','anortosito_01',1)
insert into Mineral values
	(3,'Basalto','basalto_02',2)
insert into Mineral values
	(4,'Basalto','basalto_03',1)
insert into Mineral values
	(5,'Anortosito','anortosito_11',1)
insert into Mineral values
	(6,'Regolito','regolito_01',1)
insert into Mineral values
	(7,'Anortosito','anortosito_02',2)
end

-- -----------------------------------------------------
-- Povoamento da tabela `ExploradorEspacial`.`Historico`
-- -----------------------------------------------------

begin
insert into Historico values
	(1)
insert into Historico values
    (2)
end

-- -----------------------------------------------------
-- Povoamento da tabela `ExploradorEspacial`.`Area_Triangulo`
-- -----------------------------------------------------

begin
insert into Area_Triangulo values
	(1,'34.53','40.32','-32.43','-10.34','10.32','30.43',1)
insert into Area_Triangulo values
	(2,'84.53','87.32','-80.43','-80.34','80.32','70.43',1)
insert into Area_Triangulo values
	(3,'71.53','45.32','-34.43','-10.34','17.32','60.43',1)
insert into Area_Triangulo values
	(4,'92.53','13.32','-33.43','-10.34','19.32','50.43',1)
end

-- -----------------------------------------------------
-- Povoamento da tabela `ExploradorEspacial`.`Veiculo`
-- -----------------------------------------------------
    
begin
insert into Veiculo values
	(1,'Rover 1','50')
insert into Veiculo values
	(2,'LRV0','100')
insert into Veiculo values
	(3,'Apollo 15 Lunar Tover','98')
insert into Veiculo values
	(4,'Lunokhod 1','70')
end

-- -----------------------------------------------------
-- Povoamento da tabela `ExploradorEspacial`.`Astro`
-- -----------------------------------------------------

begin
insert into Astro values
	(1,'Lua')
insert into Astro values
	(2,'Marte')
end

-- -----------------------------------------------------
-- Povoamento da tabela `ExploradorEspacial`.`Atividade`
-- -----------------------------------------------------

begin
insert into Atividade values
	(1,'Cartografar percurco Axc1',1)
insert into Atividade values
	(2,'Recolha de rochas e mineirais 1',2)
insert into Atividade values
	(3,'Exploracao e mapeamento percurso Acx2',3)
insert into Atividade values
	(4,'Recolha de mineirais tipo C2',4)
end

-- -----------------------------------------------------
-- Povoamento da tabela `ExploradorEspacial`.`Percurso`
-- -----------------------------------------------------  
    
begin
insert into Percurso values
	(1)
insert into Percurso values
	(2)
end

-- -----------------------------------------------------
-- Povoamento da tabela `ExploradorEspacial`.`Caderno_de_Notas`
-- -----------------------------------------------------     

begin
insert into Caderno_de_Notas values
	(1)
insert into Caderno_de_Notas values
	(2)
end

-- -----------------------------------------------------
-- Povoamento da tabela `ExploradorEspacial`.`Registo`
-- -----------------------------------------------------

begin
insert into Registo values
	(1,1,'Adicionar','Nova rocha encontrada','Encontrei uma nova rocha no dia 21 de Janeiro de 2017 aqui na Lua.',1)
insert into Registo values
	(2,2,'Adicionar','Novo mineral descoberto em zona improvavel','Este mineral 200x identificado, encontrado numa zona improvavel e raro.',1)
end

-- -----------------------------------------------------
-- Povoamento da tabela `ExploradorEspacial`.`Ponto_de_Passagem`
-- ----------------------------------------------------- 

begin
insert into Ponto_de_Passagem values
	(1,1,'34.53','40.32', 1)
insert into Ponto_de_Passagem values
	(2,2,'-32.43','-10.34', 1)
insert into Ponto_de_Passagem values
	(3,3,'10.32','30.43', 1)
end

-- -----------------------------------------------------
-- Povoamento da tabela `ExploradorEspacial`.`Missao`
-- -----------------------------------------------------

begin
insert into Missao values
	(1,'2017-01-20','2017-01-30','Exploracao','Busca de rochas',1,1,1,1,1)
insert into Missao values
	(2,'2017-02-21','2017-01-23','Analise','Analise de minerais',1,2,1,2,1)
end

