-- Baza danych - zaliczenie - Grzegorz Nowak - 11079
-- czêœæ B

USE projekt_11079;
GO;

CREATE SCHEMA Raporty;
GO;

-- Widok 1
CREATE VIEW Raporty.Widok1
AS
	SELECT 
		mid.nazwa,
		COUNT(*) AS 'Ilosc zamowien',
		SUM(cena) AS 'Suma'
	FROM Zamowienia AS z
	INNER JOIN Modele AS mid ON mid.id = z.idM
	GROUP BY mid.nazwa;

GO;

SELECT *
FROM Raporty.Widok1;
GO;

-- Widok 2


CREATE VIEW Raporty.Widok2
AS
	SELECT z.idM, ((c.cena-z.cena)/c.cena)*100 AS 'rabat'
	FROM Cennik AS c
	INNER JOIN Zamowienia AS z ON z.idM = c.model
	WHERE (z.dataO BETWEEN c.dataOd AND c.dataDo);

GO;



SELECT *
FROM Raporty.Widok2
ORDER BY idM;
GO;

-- Widok 3

CREATE VIEW Raporty.Widok3
AS
	SELECT *
	FROM Modele m
	WHERE 
		NOT EXISTS (SELECT * FROM Zamowienia z 
		WHERE m.id = z.idM);

GO;

SELECT * 
FROM Raporty.Widok3;
GO;

-- Widok 4

CREATE VIEW Raporty.Widok4
AS
	SELECT 
		p.id,
		COUNT(*) AS 'Ilosc zamowien',
		SUM(cena) AS 'Suma'
	FROM Pracownik AS p
	INNER JOIN Zamowienia AS z ON z.idP = p.id
	GROUP BY p.id;

GO;

SELECT *
FROM Raporty.Widok4
ORDER BY id;
GO;