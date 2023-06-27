CREATE TABLE Empresa (
  id int PRIMARY KEY,
  Nome text ,
  Idade INT check (Idade >= 21) 
);

INSERT INTO Empresa (id, Nome, Idade) VALUES ('1','Pedro','20');

SELECT * FROM Empresa; 

--A idade é menor que 21 anos, logo a Restrição CHECK é violada.