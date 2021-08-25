SHOW DATABASES;
USE world;
SHOW TABLES;
DESCRIBE city;


SELECT * FROM countrylanguage;
SELECT * FROM country;
SELECT * FROM city;


SELECT COUNT(ID) FROM city WHERE CountryCode = 'USA';
SELECT Population, LifeExpectancy FROM country WHERE Name = ('Argentina');
SELECT name, LifeExpectancy FROM country WHERE LifeExpectancy IS NOT NULL ORDER BY LifeExpectancy DESC LIMIT 1;
SELECT y.name FROM country c JOIN city y ON c.capital = y.ID WHERE Code = ('ESP');
SELECT language FROM countrylanguage l JOIN country c ON l.CountryCode = c.Code WHERE Region = ('Southeast Asia');
SELECT name FROM city WHERE name LIKE 'F%' LIMIT 25;
SELECT COUNT(y.Name) FROM country c JOIN city y ON c.Code = y.CountryCode WHERE CountryCode = ('CHN');
SELECT name FROM country WHERE population IS NOT NULL AND population != 0 ORDER BY population ASC LIMIT 1;
SELECT DISTINCT COUNT(Name) FROM country;
SELECT name FROM country ORDER BY SurfaceArea DESC LIMIT 10;
SELECT Name FROM city WHERE CountryCode = 'JPN' ORDER BY population DESC;
SELECT name, code FROM country WHERE HeadOfState = 'Elisabeth II';
SELECT name, Population/SurfaceArea AS population_ratio FROM country WHERE population IS NOT NULL AND population!= 0 ORDER BY population_ratio DESC LIMIT 10;
SELECT DISTINCT language FROM CountryLanguage ORDER BY language ASC;
SELECT name, gnp FROM country ORDER BY gnp DESC LIMIT 10;

SELECT DISTINCT Language, COUNT(Language) as Frequency
FROM countrylanguage
GROUP BY language
ORDER BY Frequency DESC
LIMIT 10;

SELECT y.name FROM country y JOIN countrylanguage cl ON cl.countrycode = y.code WHERE cl.Percentage>=50 AND cl.language = ('German');
SELECT name, LifeExpectancy FROM country WHERE lifeexpectancy IS NOT NULL AND lifeexpectancy!=0 ORDER BY LifeExpectancy ASC LIMIT 1;
SELECT GovernmentForm, COUNT('GovernmentForm') as value_occurrence FROM country GROUP BY GovernmentForm ORDER BY value_occurrence DESC;
SELECT COUNT(indepyear) FROM country WHERE Indepyear>=0 AND Indepyear IS NOT NULL;