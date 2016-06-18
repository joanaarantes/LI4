USE `ExploradorEspacial`;

-- Permissão para fazer operações de remoção de dados.
SET SQL_SAFE_UPDATES = 0;

-- -----------------------------------------------------
-- Tabela `ExploradorEspacial`.`Astronauta`
-- -----------------------------------------------------

-- DELETE FROM Astronauta;

-- Povoamento da tabela `ExploradorEspacial`.`Astronauta`
INSERT INTO Astronauta
	(id_Astronauta, NomeAstronauta, PasswordAstronauta, CargoAstronauta)
	VALUES
	(1,'Maria Helena','mariahelena52','Gestor de Missao'),
	(2,'Pedro Cunha','pcunha92','Especialista de Rochas'),
	(3,'Pedro Alves','pedroaalves','Medico'),
	(4,'Joana Arantes','joarantes91','Cartografo'),
	(5,'Daniel Malhadas','dmalhadas5''Geologo'),
	(6,'Jessica Pereira','jessyper','Gestor de Missao'),
	(7,'Rita Rua','ruar','Geologo'),
	(8,'Susana Mendes','sukinha1904','Cartografo'),
	(9,'Maria Pereira','mary_14','Especialista de Rochas'),
	(10,'Marcos Pereira','marcos1234','Medico'),
	(11,'Alexandre Silva','alex1234','Gestor de Missao');
    
-- -----------------------------------------------------
-- Tabela `ExploradorEspacial`.`Funcionario`
-- -----------------------------------------------------

-- DELETE FROM Funcionario;

-- Povoamento da tabela `ExploradorEspacial`.`Funcionario`
INSERT INTO Funcionario
	(id_Funcionario, NomeFuncionario, PasswordFuncionario, CargoFuncionario)
	VALUES
	(1,'Silvia Rocha','silviarock','Gestor'),
	(2,'Rui Barbosa','barbosa712','Chefe'),
	(3,'Ana Oliveira','ananana','Gestor'),
	(4,'Mafalda Caldas','mafy15.91','Chefe'),
	(5,'Arnaldo Arantes','arnaldo.fr''Gestor');

-- -----------------------------------------------------
-- Tabela `ExploradorEspacial`.`Catalogo`
-- -----------------------------------------------------

-- DELETE FROM Catalogo;

-- Povoamento da tabela `ExploradorEspacial`.`Catalogo`
INSERT INTO Catalogo
	(id_Catalogo, NomeCatalogo, DescricaoCatalogo)
	VALUES
	(1,'Rochas e Minerais','Catalogo de rochas e minerais.'),
    (2,'Solo','Catalogo sobre amostras do solo do astro.');

-- -----------------------------------------------------
-- Tabela `ExploradorEspacial`.`Mineral`
-- -----------------------------------------------------

-- DELETE FROM Mineral;

-- Povoamento da tabela `ExploradorEspacial`.`Mineral`
INSERT INTO Mineral
	(id_Mineral, NomeMineral, Foto, Catalogo_id_Catalogo)
	VALUES
	(1,'Basalto','basalto_01',1),
	(2,'Anortosito','anortosito_01',1),
	(3,'Basalto','basalto_02',2),
	(4,'Basalto','basalto_03',1),
	(5,'Anortosito','anortosito_11',1),
	(6,'Regolito','regolito_01',1),
	(7,'Anortosito','anortosito_02',2);

-- -----------------------------------------------------
-- Tabela `ExploradorEspacial`.`Historico`
-- -----------------------------------------------------

-- DELETE FROM Historico;

-- Povoamento da tabela `ExploradorEspacial`.`Historico`
INSERT INTO Historico
	(id_Historico)
	VALUES
	(1),
    (2);

-- -----------------------------------------------------
-- Tabela `ExploradorEspacial`.`Area_Triangulo`
-- -----------------------------------------------------

-- DELETE FROM Area_Triangulo;

-- Povoamento da tabela `ExploradorEspacial`.`Area_Triangulo`
INSERT INTO Area_Triangulo
	(id_AreaTriangulo, LatitudeA, LongitudeA, LatitudeB, LongitudeB, LatitudeC, LongitudeC, Historico_id_Historico)
	VALUES
	(1,'34.53','40.32','-32.43','-10.34','10.32','30.43',1),
	(2,'84.53','87.32','-80.43','-80.34','80.32','70.43',1),
	(3,'71.53','45.32','-34.43','-10.34','17.32','60.43',1),
	(4,'92.53','13.32','-33.43','-10.34','19.32','50.43',1);

-- -----------------------------------------------------
-- Tabela `ExploradorEspacial`.`Veiculo`
-- -----------------------------------------------------
    
-- DELETE FROM Veiculo;

-- Povoamento da tabela `ExploradorEspacial`.`Veiculo`
INSERT INTO Veiculo
	(id_Veiculo, TipoVeiculo, Bateria)
	VALUES
	(1,'Rover 1','50'),
	(2,'LRV0','100'),
	(3,'Apollo 15 Lunar Tover','98'),
	(4,'Lunokhod 1','70');

-- -----------------------------------------------------
-- Tabela `ExploradorEspacial`.`Astro`
-- -----------------------------------------------------

-- DELETE FROM Astro;

-- Povoamento da tabela `ExploradorEspacial`.`Astro`
INSERT INTO Astro
	(id_Astro, NomeAstro)
	VALUES
	(1,'Lua'),
	(2,'Marte');

-- -----------------------------------------------------
-- Tabela `ExploradorEspacial`.`Atividade`
-- -----------------------------------------------------

-- DELETE FROM Atividade;

-- Povoamento da tabela `ExploradorEspacial`.`Atividade`
INSERT INTO Atividade
	(id_Atividade, DescricaoAtividade, Missao_id_Missao)
	VALUES
	(1,'Cartografar percurco Axc1',1),
	(2,'Recolha de rochas e mineirais 1',2),
	(3,'Exploracao e mapeamento percurso Acx2',3),
	(4,'Recolha de mineirais tipo C2',4);

-- -----------------------------------------------------
-- Tabela `ExploradorEspacial`.`Percurso`
-- -----------------------------------------------------  
    
-- DELETE FROM Percurso;

-- Povoamento da tabela `ExploradorEspacial`.`Percurso`
INSERT INTO Percurso
	(id_Percurso)
	VALUES
	(1),
	(2);

-- -----------------------------------------------------
-- Tabela `ExploradorEspacial`.`Caderno_de_Notas`
-- -----------------------------------------------------     

-- DELETE FROM Caderno_de_Notas;

-- Povoamento da tabela `ExploradorEspacial`.`Caderno_de_Notas`
INSERT INTO Caderno_de_Notas
	(id_Caderno)
	VALUES
	(1),
	(2);

-- -----------------------------------------------------
-- Tabela `ExploradorEspacial`.`Registo`
-- -----------------------------------------------------

-- DELETE FROM Registo;

-- Povoamento da tabela `ExploradorEspacial`.`Registo`
INSERT INTO Registo
	(id_Registo, IndiceRegisto, TipoRegisto, NomeRegisto, Conteudo, Caderno_de_Notas_id_Caderno)
	VALUES
	(1,1,'Adicionar','Nova rocha encontrada','Encontrei uma nova rocha no dia 21 de Janeiro de 2017 aqui na Lua.',1),
	(2,2,'Adicionar','Novo mineral descoberto em zona improvavel','Este mineral 200x identificado, encontrado numa zona improvavel e raro.',1);

-- -----------------------------------------------------
-- Tabela `ExploradorEspacial`.`Ponto_de_Passagem`
-- ----------------------------------------------------- 

-- DELETE FROM Ponto_de_Passagem;

-- Povoamento da tabela `ExploradorEspacial`.`Ponto_de_Passagem`
INSERT INTO Ponto_de_Passagem
	(id_Passagem, IndicePassagem, Latitude, Longitude, Percurso_id_Percurso)
	VALUES
	(1,1,'34.53','40.32', 1),
	(2,2,'-32.43','-10.34', 1),
	(3,3,'10.32','30.43', 1);

-- -----------------------------------------------------
-- Tabela `ExploradorEspacial`.`Missao`
-- -----------------------------------------------------

-- DELETE FROM Missao;

-- Povoamento da tabela `ExploradorEspacial`.`Missao`
INSERT INTO Missao
	(id_Missao, DataInicio, DataFim, TipoMissao, NomeMissao, Astronauta_id_Astronauta, Caderno_de_Notas_id_Caderno, Historico_id_Historico, Percurso_id_Percurso, Astro_id_Astro)
	VALUES
	(1,'2017-01-20','2017-01-30','Exploracao','Busca de rochas',1,1,1,1,1),
	(2,'2017-02-21','2017-01-23','Analise','Analise de minerais',1,2,1,2,1);

-- Inibição das operações de remoção de dados.
SET SQL_SAFE_UPDATES = 1;