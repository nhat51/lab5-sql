USE AdventureWorks
--L?y ra d? li?u c?a b?ng Contact c� ContactID>= 00 v� ContactID<=200
SELECT *
FROM Person.Contact
WHERE ContactID >= 100 AND ContactID <= 200
--L?y ra d? li?u c?a b?ng Contact c� ContactID trong kho?ng [100, 200]
SELECT * FROM Person.Contact
WHERE ContactID BETWEEN 100 AND 200
--L?y ra nh?ng Contact c� LastName k?t th�c b?i k� t? e
SELECT * FROM Person.Contact
WHERE LastName LIKE '%e'
--L?y ra nh?ng Contact c� LastName b?t ??u b?i k� t? R ho?c A k?t th�c b?i k� t? e
SELECT * FROM Person.Contact
WHERE LastName LIKE '[RA]%e'
--L?y ra nh?ng Contact c� LastName c� 4 k� t? b?t ??u b?i k� t? R ho?c A k?t th�c b?i k� t? e
SELECT * FROM Person.Contact
WHERE LastName LIKE '[RA]__e'
--S? d?ng INNER JOIN
SELECT Person.Contact.*
FROM Person.Contact INNER JOIN HumanResources.Employee ON
Person.Contact.ContactID=HumanResources.Employee.ContactID
SELECT Title, COUNT(*) [Title Number]
FROM Person.Contact
WHERE Title LIKE 'Mr%'
GROUP BY ALL Title
--GROUP BY v?i HAVING: m?nh ?? HAVING s? l?c k?t qu? trong l�c ???c g?p nh�m
SELECT Title, COUNT(*) [Title Number]
FROM Person.Contact
GROUP BY ALL Title
HAVING Title LIKE 'Mr%'