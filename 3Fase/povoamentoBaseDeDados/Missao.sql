
USE ---;
SET SQL_SAFE_UPDATES = 0;

INSERT INTO Missao
(id_Missao, DataInicio, DataFim, TipoMissao, NomeMissao, id_Astronauta, id_Historico, id_Percurso, id_Astro)
VALUES
(1,'2017-01-20', '2017-01-30', Tipo, 'Busca de Rochas', 1,1,1,1),
(2,'2017-02-21', '2017-01-23', Tipo, 'Analise de Minerais', 1,1,2,1);

SET SQL_SAFE_UPDATES = 1;