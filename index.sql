-- Baza danych - zaliczenie - Grzegorz Nowak - 11079
-- czêœæ A


-- CREATE 
CREATE DATABASE projekt_11079;
GO;

USE projekt_11079;
GO;

CREATE TABLE Marki (

id INT NOT NULL IDENTITY PRIMARY KEY,
nazwa VARCHAR(20) NOT NULL
);

CREATE TABLE Modele (

id INT NOT NULL IDENTITY PRIMARY KEY,
marka INT NOT NULL,
nazwa VARCHAR(20) NOT NULL,
pojemnosc VARCHAR(3) NOT NULL,
km VARCHAR(3) NOT NULL,
rokProd VARCHAR(4) NOT NULL,

FOREIGN KEY(marka) REFERENCES Marki(id)
);


CREATE TABLE Cennik (

id INT NOT NULL IDENTITY PRIMARY KEY,
model INT NOT NULL,
cena DECIMAL(13,2) NOT NULL,
dataOd DATE NOT NULL ,
dataDo DATE NOT NULL,  

FOREIGN KEY(model) REFERENCES Modele(id)
);

CREATE TABLE Pracownik (

id INT NOT NULL IDENTITY PRIMARY KEY,
imie VARCHAR(20) NOT NULL,
nazwisko VARCHAR(30) NOT NULL,
pesel VARCHAR(11) NOT NULL UNIQUE,
pensja INT NOT NULL
);

CREATE TABLE Klient (

id INT NOT NULL IDENTITY PRIMARY KEY,
imie VARCHAR(20) NOT NULL,
nazwisko VARCHAR(30) NOT NULL,
pesel VARCHAR(11) NOT NULL UNIQUE,
nrDowodu VARCHAR(9) NOT NULL UNIQUE
);

CREATE TABLE Zamowienia (

id INT NOT NULL IDENTITY PRIMARY KEY,
idK INT NOT NULL,
idP INT NOT NULL,
idM INT NOT NULL,
cena DECIMAL(13,2) NOT NULL, 
dataZ DATE NOT NULL,
dataO DATE NOT NULL,
czyZreal BIT NOT NULL DEFAULT 0,
czyOplac BIT NOT NULL DEFAULT 0,

FOREIGN KEY(idK) REFERENCES Klient(id),
FOREIGN KEY(idP) REFERENCES Pracownik(id),
FOREIGN KEY(idM) REFERENCES Modele(id)
);
GO;

-- INSERT 

INSERT INTO Marki(nazwa) VALUES('Skoda');
INSERT INTO Marki(nazwa) VALUES('Opel');
INSERT INTO Marki(nazwa) VALUES('Volkswagen');
INSERT INTO Marki(nazwa) VALUES('Honda');
INSERT INTO Marki(nazwa) VALUES('Hyundai');
GO;
 
INSERT INTO Modele(marka, nazwa, pojemnosc, km, rokProd) VALUES(1, 'Fabia', '1.4', '75', '2002'); --  1
INSERT INTO Modele(marka, nazwa, pojemnosc, km, rokProd) VALUES(1, 'Fabia', '1.2', '64', '2000');--   2
INSERT INTO Modele(marka, nazwa, pojemnosc, km, rokProd) VALUES(2, 'Vectra B', '1.8', '125', '1999'); -- 3
INSERT INTO Modele(marka, nazwa, pojemnosc, km, rokProd) VALUES(2, 'Zafira', '2.2', '147', '2003'); -- 4
INSERT INTO Modele(marka, nazwa, pojemnosc, km, rokProd) VALUES(2, 'Corsa', '1.2', '75', '2002'); -- 5
INSERT INTO Modele(marka, nazwa, pojemnosc, km, rokProd) VALUES(3, 'Golf IV', '1.6', '102', '1999'); -- 6
INSERT INTO Modele(marka, nazwa, pojemnosc, km, rokProd) VALUES(3, 'Golf IV', '1.6', '102', '2000'); -- 7
INSERT INTO Modele(marka, nazwa, pojemnosc, km, rokProd) VALUES(3, 'Passat B5', '1.9', '110', '2002'); -- 8
INSERT INTO Modele(marka, nazwa, pojemnosc, km, rokProd) VALUES(4, 'Jazz', '1.4', '78', '2004'); -- 9
INSERT INTO Modele(marka, nazwa, pojemnosc, km, rokProd) VALUES(5, 'i10', '1.1', '66', '2005'); -- 10
GO;

INSERT INTO cennik (model, cena, dataOd, dataDo) VALUES('6', '4600', '2017-06-12', '2018-04-10');
INSERT INTO cennik (model, cena, dataOd, dataDo) VALUES('6', '4700', '2018-04-10', '2018-05-23');
INSERT INTO cennik (model, cena, dataOd, dataDo) VALUES('1', '6800', '2017-06-12', '2018-04-10');
INSERT INTO cennik (model, cena, dataOd, dataDo) VALUES('1', '7300', '2018-04-10', '2018-05-23');
INSERT INTO cennik (model, cena, dataOd, dataDo) VALUES('2', '5900', '2017-06-12', '2018-05-23');
INSERT INTO cennik (model, cena, dataOd, dataDo) VALUES('3', '5600', '2017-06-12', '2018-04-10');
INSERT INTO cennik (model, cena, dataOd, dataDo) VALUES('3', '5200', '2018-04-10', '2018-05-23');
INSERT INTO cennik (model, cena, dataOd, dataDo) VALUES('4', '14200', '2017-06-12', '2017-10-05');
INSERT INTO cennik (model, cena, dataOd, dataDo) VALUES('4', '16000', '2017-10-05', '2018-03-01');
INSERT INTO cennik (model, cena, dataOd, dataDo) VALUES('4', '15400', '2018-03-01', '2018-05-23');
INSERT INTO cennik (model, cena, dataOd, dataDo) VALUES('5', '8600', '2017-06-12', '2018-04-10');
INSERT INTO cennik (model, cena, dataOd, dataDo) VALUES('5', '8000', '2018-04-10', '2018-05-23');
INSERT INTO cennik (model, cena, dataOd, dataDo) VALUES('7', '4300', '2017-06-12', '2018-05-23');
INSERT INTO cennik (model, cena, dataOd, dataDo) VALUES('8', '9200', '2017-06-12', '2017-07-15');
INSERT INTO cennik (model, cena, dataOd, dataDo) VALUES('8', '10000', '2017-07-15', '2017-11-23');
INSERT INTO cennik (model, cena, dataOd, dataDo) VALUES('8', '11400', '2017-11-23', '2018-05-23');
INSERT INTO cennik (model, cena, dataOd, dataDo) VALUES('9', '4900', '2017-06-12', '2018-05-23');
INSERT INTO cennik (model, cena, dataOd, dataDo) VALUES('10', '14900', '2017-11-23', '2018-01-14');
INSERT INTO cennik (model, cena, dataOd, dataDo) VALUES('10', '13600', '2018-01-14', '2018-05-23');
GO; 

INSERT INTO Pracownik(imie, nazwisko, pesel, pensja) VALUES('Grzegorz', 'Nowak', '97121900000', 4300);
INSERT INTO Pracownik(imie, nazwisko, pesel, pensja) VALUES('Adrian', 'Kowalski', '89101312345', 3900);
INSERT INTO Pracownik(imie, nazwisko, pesel, pensja) VALUES('Krzysztof', 'Bugajski', '93020454321', 2700);
INSERT INTO Pracownik(imie, nazwisko, pesel, pensja) VALUES('Frank', 'Underwood', '95082267890', 4200);
GO;

INSERT INTO Klient(imie, nazwisko, pesel, nrDowodu) VALUES('Adam', 'Chrabin', '81042104021', 'TET991133'); -- 1
INSERT INTO Klient(imie, nazwisko, pesel, nrDowodu) VALUES('Jakub', 'Knap', '90081598765', 'XDD538172'); -- 2
INSERT INTO Klient(imie, nazwisko, pesel, nrDowodu) VALUES('Jakub', 'Grabowski', '91070772081', 'QUE206932'); -- 3
INSERT INTO Klient(imie, nazwisko, pesel, nrDowodu) VALUES('Mateusz', 'Bluza', '92050612345', 'GUZ123456'); -- 4
INSERT INTO Klient(imie, nazwisko, pesel, nrDowodu) VALUES('Piotr', 'Szmidt', '8212243657', 'TTM209711'); -- 5
INSERT INTO Klient(imie, nazwisko, pesel, nrDowodu) VALUES('Adam', 'Ostrowski', '80051574382', 'ZPS437791'); -- 6
INSERT INTO Klient(imie, nazwisko, pesel, nrDowodu) VALUES('Filip', 'Szczeœniak', '90072974382', 'UOD515923'); -- 7
INSERT INTO Klient(imie, nazwisko, pesel, nrDowodu) VALUES('Adam', 'Zieliñski', '82052155169', 'LON400721'); -- 8
INSERT INTO Klient(imie, nazwisko, pesel, nrDowodu) VALUES('Arkadiusz', 'Sitarz', '85031475093', 'RAS567992'); -- 9 
INSERT INTO Klient(imie, nazwisko, pesel, nrDowodu) VALUES('Jaros³aw', 'Steciuk', '88053087123', 'AST734512'); -- 10
INSERT INTO Klient(imie, nazwisko, pesel, nrDowodu) VALUES('Rados³aw', 'Œredziñski', '88092078321', 'RAD308090'); -- 11
GO;

INSERT INTO Zamowienia(idK, idP, idM, cena, dataZ, dataO, czyZreal, czyOplac) VALUES(2, 1, 9, 4900, '2017-06-14', '2017-06-21', 1, 1);
INSERT INTO Zamowienia(idK, idP, idM, cena, dataZ, dataO, czyZreal, czyOplac) VALUES(1, 1, 3, 5500, '2017-06-16', '2017-06-23', 1, 1);
INSERT INTO Zamowienia(idK, idP, idM, cena, dataZ, dataO, czyZreal, czyOplac) VALUES(1, 1, 3, 5200, '2017-06-16', '2017-06-23', 1, 1);
INSERT INTO Zamowienia(idK, idP, idM, cena, dataZ, dataO, czyZreal, czyOplac) VALUES(3, 2, 5, 8600, '2017-06-20', '2017-06-27', 1, 1);
INSERT INTO Zamowienia(idK, idP, idM, cena, dataZ, dataO, czyZreal, czyOplac) VALUES(4, 3, 1, 6600, '2017-07-13', '2017-07-22', 1, 1);
INSERT INTO Zamowienia(idK, idP, idM, cena, dataZ, dataO, czyZreal, czyOplac) VALUES(8, 1, 3, 5400, '2017-07-21', '2017-07-29', 1, 1);
INSERT INTO Zamowienia(idK, idP, idM, cena, dataZ, dataO, czyZreal, czyOplac) VALUES(6, 2, 10, 14800, '2017-08-08', '2017-08-15', 1, 1);
INSERT INTO Zamowienia(idK, idP, idM, cena, dataZ, dataO, czyZreal, czyOplac) VALUES(3, 3, 9, 4800, '2017-09-04', '2017-09-10', 1, 1);
INSERT INTO Zamowienia(idK, idP, idM, cena, dataZ, dataO, czyZreal, czyOplac) VALUES(5, 1, 4, 13800, '2017-09-23', '2017-09-30', 1, 1);
INSERT INTO Zamowienia(idK, idP, idM, cena, dataZ, dataO, czyZreal, czyOplac) VALUES(1, 3, 6, 4200, '2017-10-05', '2017-10-10', 1, 1);
INSERT INTO Zamowienia(idK, idP, idM, cena, dataZ, dataO, czyZreal, czyOplac) VALUES(7, 1, 2, 5900, '2017-11-13', '2017-11-16', 1, 1);
INSERT INTO Zamowienia(idK, idP, idM, cena, dataZ, dataO, czyZreal, czyOplac) VALUES(8, 4, 8, 11400, '2017-12-11', '2017-12-23', 1, 1);
INSERT INTO Zamowienia(idK, idP, idM, cena, dataZ, dataO, czyZreal, czyOplac) VALUES(4, 2, 9, 4900, '2017-12-11', '2017-12-21', 1, 1);
INSERT INTO Zamowienia(idK, idP, idM, cena, dataZ, dataO, czyZreal, czyOplac) VALUES(9, 3, 10, 14700, '2018-01-13', '2018-01-20', 1, 1);
INSERT INTO Zamowienia(idK, idP, idM, cena, dataZ, dataO, czyZreal, czyOplac) VALUES(2, 1, 7, 4100, '2018-01-23', '2018-02-02', 1, 1);
INSERT INTO Zamowienia(idK, idP, idM, cena, dataZ, dataO, czyZreal, czyOplac) VALUES(10, 4, 2, 5800, '2018-02-14', '2018-02-19', 1, 1);
INSERT INTO Zamowienia(idK, idP, idM, cena, dataZ, dataO, czyZreal, czyOplac) VALUES(5, 4, 3, 5500, '2018-03-02', '2018-03-10', 1, 1);
INSERT INTO Zamowienia(idK, idP, idM, cena, dataZ, dataO, czyZreal, czyOplac) VALUES(1, 3, 5, 8300, '2018-03-03', '2018-03-10', 1, 1);
INSERT INTO Zamowienia(idK, idP, idM, cena, dataZ, dataO, czyZreal, czyOplac) VALUES(10, 2, 1, 6700, '2018-03-06', '2018-03-19', 0, 0);
INSERT INTO Zamowienia(idK, idP, idM, cena, dataZ, dataO, czyZreal, czyOplac) VALUES(10, 1, 1, 6700, '2018-03-07', '2018-03-19', 1, 1);
INSERT INTO Zamowienia(idK, idP, idM, cena, dataZ, dataO, czyZreal, czyOplac) VALUES(3, 1, 8, 11400, '2018-04-12', '2018-04-14', 1, 1);
INSERT INTO Zamowienia(idK, idP, idM, cena, dataZ, dataO, czyZreal, czyOplac) VALUES(11, 4, 9, 4800, '2018-04-20', '2018-04-26', 0, 0);
INSERT INTO Zamowienia(idK, idP, idM, cena, dataZ, dataO, czyZreal, czyOplac) VALUES(4, 3, 8, 11000, '2018-05-16', '2018-05-23', 0, 1);
GO;
