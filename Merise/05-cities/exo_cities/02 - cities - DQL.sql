-- use cities;

-- 1. S�lectionner le nom de toutes les villes

SELECT city_name 
FROM cities;


-- 2. S�lectionner l�identifiant et le nom de toutes les villes tri�es par nom de ville et par ordre alphab�tique.

SELECT city_id, city_name 
FROM cities 
ORDER BY city_name ASC;


-- 3. S�lectionner toutes les villes avec le nom du pays associ� � chaque ville. Trier la liste par code pays et par ordre alphab�tique inverse.

SELECT
city_id as Ville,
city_name as 'Nom de la ville',
country_name as 'Nom du pays',
countries.country_code as 'Code du pays'
FROM cities JOIN countries ON countries.country_code = cities.country_code 
ORDER BY countries.country_code DESC;

-- 4. S�lectionner le code ISO et le nom de tous les pays avec le nombre de villes par pays. Les pays avec le moins de villes apparaissent en 1er
SELECTcountries.country_code,country_name,COUNT (cities.city_id) AS 'Cities number'FROM countries JOIN cities ON countries.country_code = cities.country_codeGROUP BY countries.country_code, country_name;SELECTCOUNT (*)FROM cities WHERE country_code = 'FR'; SELECT CO1.country_code,country_name,CI1.city_name,COUNT (CI1.city_id) as 'CitiesNumber'FROM countries as CO1JOIN cities as CI1 ON CO1.country_code = CI1.country_code JOIN cities as CI2 ON CO1.country_code = CI2.country_codeGROUP BY CO1.country_code, country_name, CI1.city_nameORDER BY 'CitiesNumber' DESC;