-- Temat 9: SQL – podzapytania

-- Zadanie 1: Znajdź pracowników z pensją równą minimalnemu zarobkowi w firmie.
SELECT EMPNO, SAL
FROM EMP
WHERE SAL = (SELECT MIN(SAL) FROM EMP);

-- Zadanie 2: Znajdź wszystkich pracowników zatrudnionych na tym samym stanowisku co BLAKE.
SELECT EMPNO, JOB
FROM EMP
WHERE JOB = (SELECT JOB FROM EMP WHERE ENAME = 'BLAKE');

-- Zadanie 3: Znajdź pracowników o pensjach z listy najniższych zarobków osiągalnych w departamentach.
SELECT EMPNO, SAL
FROM EMP
WHERE SAL IN (SELECT MIN(SAL) FROM EMP GROUP BY DEPTNO);

-- Zadanie 4: Znajdź pracowników o najniższych zarobkach w ich departamentach.
SELECT EMPNO, SAL
FROM EMP
WHERE SAL IN (SELECT MIN(SAL) FROM EMP GROUP BY DEPTNO);

-- Zadanie 5: Stosując operator ANY wybierz pracowników zarabiających powyżej najniższego zarobku z departamentu 30.
SELECT E.EMPNO, E.SAL
FROM EMP E
WHERE E.SAL > ANY (SELECT SAL FROM EMP WHERE DEPTNO = 30);

-- Zadanie 6: Znajdź pracowników, których zarobki są wyższe od pensji każdego pracownika z departamentu 30.
SELECT E.EMPNO, E.SAL
FROM EMP E
WHERE E.SAL > ALL (SELECT SAL FROM EMP WHERE DEPTNO = 30);

-- Zadanie 7: Wybierz departamenty, których średnie zarobki przekraczają średni zarobek departamentu 30.
SELECT DEPTNO
FROM EMP
GROUP BY DEPTNO
HAVING AVG(SAL) > (SELECT AVG(SAL) FROM EMP WHERE DEPTNO = 30);

-- Zadanie 8: Znajdź stanowisko, na którym są najwyższe średnie zarobki.
SELECT JOB
FROM EMP
WHERE SAL IN (SELECT MAX(SAL) FROM EMP);

-- Zadanie 9: Znajdź pracowników, których zarobki przekraczają najwyższe pensje z departamentu SALES.
SELECT EMPNO, SAL
FROM EMP
WHERE SAL > (
    SELECT MAX(E.SAL)
    FROM EMP E
    INNER JOIN DEPT D ON D.DEPTNO = E.DEPTNO
    WHERE D.DNAME = 'SALES'
);

-- Zadanie 10: Znajdź pracowników, którzy zarabiają powyżej średniej w ich departamentach.
SELECT E.EMPNO, E.SAL
FROM EMP E
WHERE E.SAL > (SELECT AVG(SAL) FROM EMP WHERE DEPTNO = E.DEPTNO);

-- Zadanie 11: Znajdź pracowników, którzy posiadają podwładnych za pomocą operatora EXISTS.
SELECT E.EMPNO
FROM EMP E
WHERE EXISTS (SELECT 1 FROM EMP WHERE MGR = E.EMPNO);

-- Zadanie 12: Znajdź pracowników, których departament nie występuje w tabeli DEPT.
SELECT E.EMPNO
FROM EMP E
WHERE NOT EXISTS (SELECT 1 FROM DEPT WHERE DEPTNO = E.DEPTNO);

-- Zadanie 13: Wskaż dla każdego departamentu ostatnio zatrudnionych pracowników. Uporządkuj według dat zatrudnienia.
SELECT E.DEPTNO, E.EMPNO, E.HIREDATE
FROM EMP E
WHERE E.HIREDATE = (
    SELECT MAX(HIREDATE)
    FROM EMP
    WHERE DEPTNO = E.DEPTNO
)
ORDER BY E.HIREDATE DESC;

-- Zadanie 14: Podaj ename, sal i deptno dla pracowników, których zarobki przekraczają średnią ich departamentów.
SELECT E.ENAME, E.SAL, E.DEPTNO
FROM EMP E
WHERE E.SAL > (SELECT AVG(SAL) FROM EMP WHERE DEPTNO = E.DEPTNO);

-- Zadanie 15: Stosując podzapytanie znajdź departamenty, w których nikt nie pracuje.
SELECT D.DEPTNO
FROM DEPT D
WHERE NOT EXISTS (SELECT 1 FROM EMP WHERE DEPTNO = D.DEPTNO);

-- Zadanie 16: Napisz zapytanie zwracające procentowy udział liczby pracowników w każdym dziale.
SELECT E.DEPTNO, 100 * ROUND(COUNT(*) / (SELECT COUNT(*) FROM EMP), 4) || '%' "%"
FROM EMP E
GROUP BY E.DEPTNO;
