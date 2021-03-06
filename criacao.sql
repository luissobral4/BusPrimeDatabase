ALTER TABLE Bilhete DROP FOREIGN KEY empresa;
ALTER TABLE Utilizador_Paragem DROP FOREIGN KEY `-paragensFavoritas`;
ALTER TABLE Utilizador_Paragem DROP FOREIGN KEY `-paragensFavoritas2`;
ALTER TABLE Utilizador_Percurso DROP FOREIGN KEY percursosFavoritos;
ALTER TABLE Utilizador_Percurso DROP FOREIGN KEY percursosFavoritos2;
ALTER TABLE Autocarro DROP FOREIGN KEY empresa2;
ALTER TABLE Paragem DROP FOREIGN KEY coordenadas;
ALTER TABLE ParagemHora DROP FOREIGN KEY paragem;
ALTER TABLE Bilhete DROP FOREIGN KEY `-utilizador`;
ALTER TABLE Percurso DROP FOREIGN KEY FKPercurso282449;
ALTER TABLE Bilhete DROP FOREIGN KEY FKBilhete511300;
ALTER TABLE Viagem DROP FOREIGN KEY FKViagem6249;
ALTER TABLE ParagemHora DROP FOREIGN KEY FKParagemHor210610;
ALTER TABLE Percurso DROP FOREIGN KEY FKPercurso409881;
DROP TABLE IF EXISTS Utilizador;
DROP TABLE IF EXISTS Bilhete;
DROP TABLE IF EXISTS Empresa;
DROP TABLE IF EXISTS Percurso;
DROP TABLE IF EXISTS Autocarro;
DROP TABLE IF EXISTS ParagemHora;
DROP TABLE IF EXISTS Paragem;
DROP TABLE IF EXISTS Coordenadas;
DROP TABLE IF EXISTS PerguntaFrequente;
DROP TABLE IF EXISTS Viagem;
DROP TABLE IF EXISTS Utilizador_Paragem;
DROP TABLE IF EXISTS Utilizador_Percurso;
CREATE TABLE Utilizador (ID int(10) NOT NULL AUTO_INCREMENT, Admin tinyint(1) NOT NULL, Username varchar(255), Password varchar(255), Email varchar(255), Saldo double NOT NULL, PRIMARY KEY (ID));
CREATE TABLE Bilhete (ID int(10) NOT NULL AUTO_INCREMENT, ViagemID int(10) NOT NULL, UtilizadorID int(10) NOT NULL, EmpresaID int(10) NOT NULL, Preco double NOT NULL, Partida varchar(255), Chegada varchar(255), PRIMARY KEY (ID));
CREATE TABLE Empresa (ID int(10) NOT NULL AUTO_INCREMENT, Nome varchar(255), PRIMARY KEY (ID));
CREATE TABLE Percurso (ID int(10) NOT NULL AUTO_INCREMENT, ParagemID2 int(10) NOT NULL, ParagemID int(10) NOT NULL, PRIMARY KEY (ID));
CREATE TABLE Autocarro (ID int(10) NOT NULL AUTO_INCREMENT, EmpresaID int(10) NOT NULL, Numero int(10) NOT NULL, PRIMARY KEY (ID));
CREATE TABLE ParagemHora (ID int(10) NOT NULL AUTO_INCREMENT, ViagemID int(10) NOT NULL, ParagemID int(10) NOT NULL, Hora varchar(255), PRIMARY KEY (ID));
CREATE TABLE Paragem (ID int(10) NOT NULL AUTO_INCREMENT, CoordenadasID int(10) NOT NULL, Nome varchar(255), PRIMARY KEY (ID));
CREATE TABLE Coordenadas (ID int(10) NOT NULL AUTO_INCREMENT, CoordX double NOT NULL, CoordY double NOT NULL, PRIMARY KEY (ID));
CREATE TABLE PerguntaFrequente (ID int(10) NOT NULL AUTO_INCREMENT, Pergunta varchar(255), Resposta varchar(255), PRIMARY KEY (ID));
CREATE TABLE Viagem (ID int(10) NOT NULL AUTO_INCREMENT, AutocarroID int(10) NOT NULL, Nbilhetes int(10) NOT NULL, Preco double NOT NULL, Intercidades tinyint(1) NOT NULL, PRIMARY KEY (ID));
CREATE TABLE Utilizador_Paragem (UtilizadorID int(10) NOT NULL, ParagemID int(10) NOT NULL, PRIMARY KEY (UtilizadorID, ParagemID));
CREATE TABLE Utilizador_Percurso (UtilizadorID int(10) NOT NULL, PercursoID int(10) NOT NULL, PRIMARY KEY (UtilizadorID, PercursoID));
ALTER TABLE Bilhete ADD CONSTRAINT empresa FOREIGN KEY (EmpresaID) REFERENCES Empresa (ID);
ALTER TABLE Utilizador_Paragem ADD CONSTRAINT `-paragensFavoritas` FOREIGN KEY (UtilizadorID) REFERENCES Utilizador (ID);
ALTER TABLE Utilizador_Paragem ADD CONSTRAINT `-paragensFavoritas2` FOREIGN KEY (ParagemID) REFERENCES Paragem (ID);
ALTER TABLE Utilizador_Percurso ADD CONSTRAINT percursosFavoritos FOREIGN KEY (UtilizadorID) REFERENCES Utilizador (ID);
ALTER TABLE Utilizador_Percurso ADD CONSTRAINT percursosFavoritos2 FOREIGN KEY (PercursoID) REFERENCES Percurso (ID);
ALTER TABLE Autocarro ADD CONSTRAINT empresa2 FOREIGN KEY (EmpresaID) REFERENCES Empresa (ID);
ALTER TABLE Paragem ADD CONSTRAINT coordenadas FOREIGN KEY (CoordenadasID) REFERENCES Coordenadas (ID);
ALTER TABLE ParagemHora ADD CONSTRAINT paragem FOREIGN KEY (ParagemID) REFERENCES Paragem (ID);
ALTER TABLE Bilhete ADD CONSTRAINT `-utilizador` FOREIGN KEY (UtilizadorID) REFERENCES Utilizador (ID);
ALTER TABLE Percurso ADD CONSTRAINT FKPercurso282449 FOREIGN KEY (ParagemID) REFERENCES Paragem (ID);
ALTER TABLE Bilhete ADD CONSTRAINT FKBilhete511300 FOREIGN KEY (ViagemID) REFERENCES Viagem (ID);
ALTER TABLE Viagem ADD CONSTRAINT FKViagem6249 FOREIGN KEY (AutocarroID) REFERENCES Autocarro (ID);
ALTER TABLE ParagemHora ADD CONSTRAINT FKParagemHor210610 FOREIGN KEY (ViagemID) REFERENCES Viagem (ID);
ALTER TABLE Percurso ADD CONSTRAINT FKPercurso409881 FOREIGN KEY (ParagemID2) REFERENCES Paragem (ID);
