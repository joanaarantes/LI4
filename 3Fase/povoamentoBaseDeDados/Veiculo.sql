
USE ---;
SET SQL_SAFE_UPDATES = 0;

INSERT INTO Veiculo
(id_Veiculo, TipoVeiculo, Bateria)
VALUES
(1,'Rover 1', '50'),
(2,'LRV0', '100'),
(3,'Apollo 15 Lunar Tover', '98'),
(4,'Lunokhod 1', '70');

SET SQL_SAFE_UPDATES = 1;