CREATE TABLE Empresa (
  id int PRIMARY KEY,
  Nome text
);

INSERT INTO Empresa (id, Nome) VALUES ('1','Pedro');

INSERT INTO Empresa (id, Nome) VALUES ('2','Maria');

update Empresa set id = 1 WHERE id = 2;

SELECT * FROM Empresa; 
--Ha dois cadastros com o mesmo ID, violando a Restrição Primary key