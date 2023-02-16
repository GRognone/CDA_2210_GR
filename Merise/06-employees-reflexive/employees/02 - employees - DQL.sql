-- use employees

/* 1. S�lectionner le nom, pr�nom et salaire de tous les employ�s 
	tri�s par date d�embauche de la plus ancienne � la plus r�cente.*/

SELECT emp_lastname, emp_firstname, emp_salary, emp_hiredate FROM employees 
ORDER BY emp_hiredate ASC;


/* 2. S�lectionner le nom, salaire, date d�embauche de tous les employ�s 
	tri�s par identifiant de manager (croissant) 
	puis par nom (ordre alphab�tique). */

SELECT emp_lastname, emp_salary, emp_hiredate, emp_manager_id FROM employees 
ORDER BY emp_manager_id ASC, emp_lastname ASC;


/* 3. S�lectionner le nom, pr�nom, salaire, date d�embauche, 
	nom et pr�nom du manager de tous les employ�s. 
	Trier la liste par nom de manager (ordre croissant) 
	puis par date d�embauche de la plus r�cente � la plus ancienne. */

SELECT 
E0.emp_lastname,
E0.emp_firstname,
E0.emp_salary,
E0.emp_hiredate,
E0.emp_manager_id,
E1.emp_id AS 'Manager id',
E1.emp_lastname AS 'Manager Last name',
E1.emp_firstname AS 'Manager First name'
FROM employees AS E0
LEFT JOIN employees AS E1 ON E0.emp_manager_id = E1.emp_id
ORDER BY E1.emp_lastname ASC,E0.emp_hiredate DESC;


/* 4. S�lectionner les employ�s sans manager.*/

SELECT * FROM employees WHERE emp_manager_id IS NULL;


/* 5. S�lectionner le pr�nom et nom de tous les managers avec, pour chacun, 
	le nombre de leur subordonn�s. 
	Les managers avec le moins de subordonn�s apparaissent en 1er */

SELECT 
MAN1.emp_lastname,
MAN1.emp_firstname,
count(EMP1.emp_id) as 'manager_count'
from employees as MAN1
join employees as EMP1 on MAN1.emp_id = EMP1.emp_manager_id
group by
MAN1.emp_lastname,
MAN1.emp_firstname
order by
manager_count asc;

/* This instruction verify if there's exactly 5 employees managed by ID 5
select count (*) from employees where employees.emp_manager_id = 5;
*/

-- Version avec utilisation d'une sous requette.
SELECT 
MAN1.emp_lastname,
MAN1.emp_firstname,
count(EMP1.emp_id) as 'manager_count',
(SELECT count (*) from employees EMP2 where EMP2.emp_manager_id = EMP1.emp_manager_id) as 'toto'
from employees as MAN1
join employees as EMP1 on MAN1.emp_id = EMP1.emp_manager_id
group by
MAN1.emp_lastname,
MAN1.emp_firstname,
EMP1.emp_manager_id
order by
manager_count asc;



/* 6. S�lectionner le nom de tous les managers avec, pour chacun, 
	la moyenne des salaires de leur subordonn�s. 
	Trier le r�sultat selon la valeur de la moyenne par ordre d�croissant. */

SELECT 
MAN1.emp_lastname,
avg(EMP1.emp_salary) as 'salary_average',
(SELECT avg (EMP2.emp_salary) from employees EMP2 where EMP2.emp_manager_id = MAN1.emp_id) as 'tata'
from employees as MAN1
join employees as EMP1 on MAN1.emp_id = EMP1.emp_manager_id
group by
MAN1.emp_lastname,
MAN1.emp_id
order by
salary_average desc;

