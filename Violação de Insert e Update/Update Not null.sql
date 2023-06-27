CREATE TABLE Empresa (
  id int NOT NULL,
  Nome TEXT
);
INSERT INTO Empresa (id,Nome) VALUES (1,'Pedro');

update Empresa set id = null;

SELECT * FROM Empresa;
-- valor adicionado no update é nulo logo Viola a restrição.