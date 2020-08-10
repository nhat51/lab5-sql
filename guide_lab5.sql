USE AdventureWorks
--L?y ra d? li?u c?a b?ng Contact có ContactID>= 00 và ContactID<=200
SELECT *
FROM Person.Contact
WHERE ContactID >= 100 AND ContactID <= 200
--L?y ra d? li?u c?a b?ng Contact có ContactID trong kho?ng [100, 200]
SELECT * FROM Person.Contact
WHERE ContactID BETWEEN 100 AND 200
--L?y ra nh?ng Contact có LastName k?t thúc b?i ký t? e
SELECT * FROM Person.Contact
WHERE LastName LIKE '%e'
--L?y ra nh?ng Contact có LastName b?t ??u b?i ký t? R ho?c A k?t thúc b?i ký t? e
SELECT * FROM Person.Contact
WHERE LastName LIKE '[RA]%e'
--L?y ra nh?ng Contact có LastName có 4 ký t? b?t ??u b?i ký t? R ho?c A k?t thúc b?i ký t? e
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
--GROUP BY v?i HAVING: m?nh ?? HAVING s? l?c k?t qu? trong lúc ???c g?p nhóm
SELECT Title, COUNT(*) [Title Number]
FROM Person.Contact
GROUP BY ALL Title
HAVING Title LIKE 'Mr%'