
USE ---;
SET SQL_SAFE_UPDATES = 0;

INSERT INTO PontoDePassagem
(id_Passagem, IndicePassagem, Latitude, Longitude, id_Percurso)
VALUES
(1,1,'34.53', '40.32', 1),
(2,2,'-32.43' ,'-10.34', 1),
(3, 3, '10.32', '30.43', 1);

SET SQL_SAFE_UPDATES = 1;