
# total coloane si randuri

/* primul rand
al doilea rand 
*/

SELECT * 
FROM comenzi.Orders
LIMIT 10;

/*'yyyy-mm-dd'
'2025-08-19' */

# cate comenzi am  pe fiecare tara
SELECT b.Country, 
		COUNT(distinct a.OrderId) as Unique_Orders,
		COUNT(a.OrderId) All_Orders
FROM comenzi.Orders a
	INNER JOIN comenzi.Customers b
		ON a.CustomerId=b.CustomerId
GROUP BY b.Country
ORDER BY Unique_Orders DESC
LIMIT 3;

# pentru cati clienti avem comenzi in orders
SELECT distinct CustomerId
FROM Orders;

# cate tari am in customers
SELECT COUNT(DISTINCT Country)
FROM Customers;

# cati clienti, cate produse unice
# si cate comenzi s-au plasat in fiecare tara
SELECT a.OrderId, a.OrderDate, b.CustomerId, b.Email, c.ProductName
FROM Orders a
INNER JOIN Customers b ON a.CustomerId = b.CustomerId
INNER JOIN Products c ON a.ProductId = c.ProductId;

SELECT b.Country,
COUNT(DISTINCT b.CustomerId) clients,
COUNT(DISTINCT c.ProductId) produse,
COUNT(DISTINCT a.OrderId) comenzi
FROM Orders a 
INNER JOIN Customers b ON a.CustomerId = b.CustomerId
INNER JOIN Products c ON a.ProductId = c.ProductId
GROUP BY	b.Country;



SELECT * 
FROM pets;

# identificati speciile de animale afisandu-le o singura data
SELECT DISTINCT species
FROM pets;

# Selectaţi coloanele name si owner, însă afişaţi-le cu aliasurile pet_name şi owner_name
SELECT NAME pet_name, OWNER owner_name
FROM pets;

#  Afisati toate coloanele, ordonate după species crescător şi birth descrescător 
SELECT * FROM pets
ORDER BY species, birth DESC;

# Afisati toate coloanele animalului nascut cel mai demult, fie ca mai e sau nu in viata.
SELECT * 
FROM pets
WHERE birth IS NOT null
ORDER BY birth
LIMIT 1;

# Afişaţi numele ownerilor, în ordine alfabetică 
SELECT distinct OWNER  
FROM pets
ORDER BY OWNER;


#'07________' AND phone NOT LIKE %[a-z]/%



# Afişaţi toate coloanele din Orders pentru curierul DHL, plasate in perioada 2019-12-31 - 2021-03-31
SELECT *
FROM Orders
WHERE COURIER = 'DHL'
AND OrderDate BETWEEN '2019-12-31' AND '2021-03-31';


/* Selectaţi coloanele FirstName, Email, DateOfBirth din tabelul Customers pentru clienții din USA si 
Spain născuți începând cu 1990-01-01. */

SELECT FirstName, Email, DateOfBirth
FROM Customers
WHERE Country IN ('USA', 'Spain')
AND DateOfBirth>='1990-01-01';


/* Identificaţi produsele din Orders pentru care s-au plasat cel puțin 100 bucăți (Quantity), livrate de 
curierii UPS sau TNT şi pret intre 40 şi 80. */

SELECT *
FROM Orders
WHERE Quantity >= 100
AND Courier IN ('UPS', 'TNT')
AND UnitPrice BETWEEN 40 AND 80;

/* Customers - Afisati toti clientii din Mexic si Brazil cu domeniul de email yahoo.com
sau clientii din UK cu domeniul gmail.com sau data nasterii inainte de 1990-01-01*/

SELECT *
FROM Customers 
WHERE Country IN ('Mexico', 'Brazil')
AND email Like '%yahoo.com'
OR Country = 'UK'
AND email Like '%gmail.com'
OR DateOfBirth <= '1990-01-01';


SELECT *
FROM Customers 
WHERE Country IN ('Mexico', 'Brazil') AND email Like '%yahoo.com'
OR Country = 'UK' AND (email Like '%gmail.com'
OR DateOfBirth <= '1990-01-01');


SELECT a.CustomerId, a.Email, b.CustomerId, b.OrderId
FROM Customers a
INNER JOIN Orders b ON a.CustomerId = b.CustomerId
ORDER BY a.CustomerId;


SELECT a.CustomerId, a.Email, b.CustomerId, b.OrderId
FROM Customers a
LEFT JOIN Orders b ON a.CustomerId = b.CustomerId
WHERE b.CustomerId IS NULL 
ORDER BY a.CustomerId;



# Exercitiu MySQL Essentials
#1 Afișați numele artistului cu cele mai multe melodii
SELECT *
FROM Music;


SELECT Artist,
COUNT(Title)
FROM Music
GROUP by ARTIST
ORDER BY Count(Title) DESC
LIMIT 1;


#2 Identificați numărul de melodii din tabel la nivelul fiecărui an. Ordonare după an
SELECT `YEAR`, COUNT(TITLE)
FROM Music
GROUP BY YEAR
ORDER BY YEAR;


#3 Afișați câmpurile ARTIST şi TITLE pentru melodiile care conțin cuvântul SONG în titlu
SELECT ARTIST, TITLE
FROM Music
WHERE TITLE LIKE '%SONG%';


#4 Care este ultimul an pentru care Elvis Presley apare cu o melodie în tabel?
SELECT `YEAR`, TITLE
FROM Music
WHERE Artist = 'Elvis Presley'
ORDER BY TITLE DESC
LIMIT 1;




