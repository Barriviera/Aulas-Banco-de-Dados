CREATE TABLE Empresa (
  id int PRIMARY KEY,
  Nome text
);

INSERT INTO Empresa (id, Nome) VALUES ('1','Pedro');

INSERT INTO Empresa (id, Nome) VALUES ('1','Maria');

SELECT * FROM Empresa; 
--Ha dois cadastros com o mesmo ID, violando a Restrição Primary key