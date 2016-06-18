USE ---;
SET SQL_SAFE_UPDATES = 0;

INSERT INTO Registo
(id_Registo, IndiceRegisto, NomeRegisto, Conteudo, id_Caderno)
VALUES
(1,1,'Nova Rocha encontrada','Encontrei uma nova rocha no dia 21 de Janeiro de 2017 aqui na lua.',1),
(2,2,'Novo mineral descoberto em zona improvável','Este mineral 200x identificado, encontrado em uma zona improvavel, é raro.',1);

SET SQL_SAFE_UPDATES = 1;