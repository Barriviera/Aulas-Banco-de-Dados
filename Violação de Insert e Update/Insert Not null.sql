CREATE TABLE Empresa (
  id int NOT NULL,
  Nome TEXT
);
INSERT INTO Empresa (Nome) VALUES ('Pedro');


SELECT * FROM Empresa;
-- valor adicionado no insert é nulo logo Viola a restrição.