USE ---;
SET SQL_SAFE_UPDATES = 0;

INSERT INTO AreaTriangulo
(id_AreaTriangulo, LatitudeA, LongitudeA, LatitudeB, LongitudeB, LatitudeC, LongitudeC, id_Historico)
VALUES
(1,'34.53', '40.32' , '-32.43' ,'-10.34' , '10.32', '30.43', 1),
(2,'84.53', '87.32' , '-80.43' ,'-80.34' , '80.32', '70.43', 1),
(3,'71.53', '45.32' , '-34.43' ,'-10.34' , '17.32', '60.43', 1),
(4,'92.53', '13.32' , '-33.43' ,'-10.34' , '19.32', '50.43', 1);

SET SQL_SAFE_UPDATES = 1;