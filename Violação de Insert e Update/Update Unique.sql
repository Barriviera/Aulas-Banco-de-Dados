CREATE TABLE Empresa (
  id int NOT NULL,
  Nome TEXT,
  UNIQUE (id)
);

INSERT INTO Empresa (id) VALUES (1);

INSERT INTO Empresa (id) VALUES (2);

update Empresa set id = 1 WHERE id = 2;

SELECT * FROM Empresa;