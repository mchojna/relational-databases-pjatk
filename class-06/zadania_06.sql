-- Temat 6 - SQL – proste zapytania

-- 1. Wybierz numery departamentów, nazwiska pracowników oraz numery pracownicze ich szefów z tabeli EMP.
SELECT DEPTNO, ENAME, MGR
FROM EMP;

-- 2. Wybierz wszystkie kolumny z tabeli EMP.
SELECT *
FROM EMP;

-- 3. Wylicz roczną pensję podstawową dla każdego pracownika.
SELECT EMPNO, 12 * SAL
FROM EMP;

-- 4. Wylicz roczną pensję podstawową dla każdego pracownika gdyby każdemu dać podwyżkę o 250.
SELECT EMPNO, (SAL + 250) * 12
FROM EMP;

-- 5. Wybrane wyrażenie SAL*12 zaetykietuj nagłówkiem ROCZNA.
SELECT EMPNO, SAL * 12 ROCZNA
FROM EMP;

-- 6. Wybrane wyrażenie SAL*12 zaetykietuj nagłówkiem R PENSJA.
SELECT EMPNO, SAL * 12 "R PENSJA"
FROM EMP;

-- 7. Połącz EMPNO i nazwisko, opatrz je nagłówkiem EMPLOYEE.
SELECT EMPNO || ' ' || ENAME EMPLOYEE
FROM EMP;

-- 8. Utwórz zapytanie zwracające wynik w postaci np. „Kowalski pracuje w dziale 20”.
SELECT ENAME || ' PRACUJE W DZIALE ' || DEPTNO
FROM EMP;

-- 9. Wylicz roczną pensję całkowitą dla każdego pracownika (z uwzględnieniem prowizji).
SELECT EMPNO, SAL * 12 + NVL(COMM, 0)
FROM EMP;

-- 10. Wyświetl wszystkie numery departamentów występujące w tabeli EMP.
SELECT DEPTNO
FROM EMP;

-- 11. Wyświetl wszystkie różne numery departamentów występujące w tabeli EMP.
SELECT DISTINCT DEPTNO
FROM EMP;

-- 12. Wybierz wszystkie wzajemnie różne kombinacje wartości DEPTNO i JOB.
SELECT DISTINCT DEPTNO, JOB
FROM EMP;

-- 13. Posortuj wszystkie dane tabeli EMP według ENAME.
SELECT *
FROM EMP
ORDER BY ENAME;

-- 14. Posortuj malejąco wszystkie dane tabeli EMP według daty ich zatrudnienia począwszy od ostatnio zatrudnionych.
SELECT *
FROM EMP
ORDER BY HIREDATE DESC;

-- 15. Posortuj dane tabeli EMP według wzrastających wartości kolumn DEPTNO oraz malejących wartości kolumny SAL (bez wypisywania kolumny SAL).
SELECT *
FROM EMP
ORDER BY 8 ASC, 6 DESC;

-- 16. Wybierz nazwiska, numery, stanowiska pracy i numery departamentów wszystkich pracowników zatrudnionych na stanowisku CLERK.
SELECT ENAME, EMPNO, JOB, DEPTNO
FROM EMP
WHERE JOB = 'CLERK';

-- 17. Wybierz  wszystkie nazwy i numery departamentów większe od nr 20.
SELECT DEPTNO, DNAME
FROM DEPT
WHERE DEPTNO > 20;

-- 18. Wybierz pracowników, których prowizja przekracza miesięczną pensję.
SELECT *
FROM EMP
WHERE SAL < NVL(COMM, 0);

-- 19. Wybierz dane tych pracowników, których zarobki mieszczą się pomiędzy 1000 a 2000.
SELECT *
FROM EMP
WHERE SAL BETWEEN 1000 AND 2000;

-- 20. Wybierz dane pracowników, których bezpośrednimi szefami  są 7902,7566 lub 7788.
SELECT *
FROM EMP
WHERE MGR IN (7902, 7566, 7788);

-- 21. Wybierz dane tych pracowników, których nazwiska zaczynają się na S.
SELECT *
FROM EMP
WHERE ENAME LIKE 'S%';

-- 22. Wybierz dane tych pracowników, których nazwiska są czteroliterowe.
SELECT *
FROM EMP
WHERE ENAME LIKE '____';

-- 23. Wybierz dane tych pracowników, którzy nie posiadają szefa.
SELECT *
FROM EMP
WHERE MGR IS NULL;

-- 24. Wybierz dane tych pracowników, których zarobki są poza przedziałem <1000,2000>.
SELECT *
FROM EMP
WHERE SAL NOT BETWEEN 1000 AND 2000;

-- 25. Wybierz dane tych pracowników, których nazwiska nie zaczynają się na M.
SELECT *
FROM EMP
WHERE ENAME NOT LIKE 'M%';

-- 26. Wybierz dane tych pracowników, którzy mają szefa.
SELECT *
FROM EMP
WHERE MGR IS NOT NULL;

-- 27. Wybierz dane tych pracowników zatrudnionych na stanowisku CLERK których zarobki SAL mieszczą się w przedziale <1000.2000).
SELECT *
FROM EMP
WHERE JOB = 'CLERK' AND SAL >= 1000 AND SAL < 2000;

-- 28. Wybierz dane pracowników zatrudnionych na stanowisku CLERK albo takich, których zarobki SAL mieszczą się w przedziale <1000.2000).
SELECT *
FROM EMP
WHERE JOB = 'CLERK' OR (SAL >= 1000 AND SAL < 2000);

-- 29. Wybierz wszystkich pracowników zatrudnionych na stanowisku MANAGER z pensją powyżej 1500 oraz wszystkich pracowników na stanowisku  SALESMAN, niezależnie od pensji.
SELECT *
FROM EMP
WHERE (JOB = 'MANAGER' AND SAL > 1500) OR JOB = 'SALESMAN';

-- 30. Wybierz wszystkich pracowników zatrudnionych na stanowisku MANAGER lub na stanowisku SALESMAN lecz zarabiających powyżej 1500.
SELECT *
FROM EMP
WHERE JOB = 'MANAGER' OR (JOB = 'SALESMAN' AND SAL > 1500);

-- 31. Wybierz wszystkich pracowników zatrudnionych na stanowisku MANAGER ze wszystkich departamentów wraz ze wszystkimi pracownikami zatrudnionymi na stanowisku CLERK w departamencie 10.
SELECT *
FROM EMP
WHERE JOB = 'MANAGER' OR (JOB = 'CLERK' AND DEPTNO = 10);

-- 32. Wybierz wszystkie dane z tabeli SALGRADE.
SELECT *
FROM SALGRADE;

-- 33. Wybierz wszystkie dane z tabeli DEPT.
SELECT *
FROM DEPT;

-- 34. Wybierz numery i nazwy departamentów sortując według numerów departamentów.
SELECT DEPTNO, DNAME
FROM DEPT
ORDER BY DEPTNO ASC;

-- 35. Wybierz wszystkie wzajemnie różne stanowiska pracy.
SELECT DISTINCT JOB
FROM EMP;

-- 36. Wybierz dane pracowników zatrudnionych w departamentach 10 i 20 we kolejności alfabetycznej ich nazwisk.
SELECT *
FROM EMP
WHERE DEPTNO IN (10, 20)
ORDER BY ENAME ASC;

-- 37. Wybierz nazwiska pracowników, w których nazwisku występuje ciąg „TH” lub „LL”.
SELECT *
FROM EMP
WHERE ENAME LIKE '%TH%' OR ENAME LIKE '%LL%';

-- 38. Wybierz ENAME, DEPTNO i HIREDATE  tych pracowników, którzy zostali zatrudnieni w 1980 r.
SELECT ENAME, DEPTNO, HIREDATE
FROM EMP
WHERE EXTRACT(YEAR FROM HIREDATE) = 1980;

-- 39. Wybierz nazwiska, roczną pensję oraz prowizję tych wszystkich sprzedawców, których miesięczna pensja przekracza prowizję. Wyniki posortuj według malejących zarobków, potem nazwisk.
SELECT ENAME, SAL * 12 + NVL(COMM, 0)
FROM EMP
WHERE SAL > NVL(COMM, 0)
ORDER BY SAL DESC, ENAME ASC;
