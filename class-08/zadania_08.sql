-- Temat 8: SQL – funkcje grupujące

-- Zadanie 1: Oblicz średni zarobek w firmie.
SELECT AVG(SAL)
FROM EMP;

-- Zadanie 2: Znajdź minimalne zarobki na stanowisku CLERK.
SELECT MIN(SAL)
FROM EMP
WHERE JOB = 'CLERK';

-- Zadanie 3: Znajdź ilu pracowników zatrudniono w departamencie 20.
SELECT COUNT(DISTINCT EMPNO)
FROM EMP
WHERE DEPTNO = 20;

-- Zadanie 4: Oblicz średnie zarobki na każdym ze stanowisk pracy.
SELECT JOB, AVG(SAL)
FROM EMP
GROUP BY JOB;

-- Zadanie 5: Oblicz średnie zarobki na każdym ze stanowisk pracy z wyjątkiem stanowiska MANAGER.
SELECT JOB, AVG(SAL)
FROM EMP
WHERE JOB <> 'MANAGER'
GROUP BY JOB;

-- Zadanie 6: Oblicz średnie zarobki na każdym ze stanowisk pracy w każdym departamencie.
SELECT DEPTNO, JOB, AVG(SAL)
FROM EMP
GROUP BY DEPTNO, JOB;

-- Zadanie 7: Dla każdego stanowiska oblicz maksymalne zarobki.
SELECT JOB, MAX(SAL)
FROM EMP
GROUP BY JOB;

-- Zadanie 8: Wybierz średnie zarobki tylko tych departamentów, które zatrudniają więcej niż trzech pracowników.
SELECT DEPTNO, AVG(SAL)
FROM EMP
GROUP BY DEPTNO
HAVING COUNT(*) > 3;

-- Zadanie 9: Wybierz tylko te stanowiska, na których średni zarobek wynosi 3000 lub więcej.
SELECT JOB
FROM EMP
GROUP BY JOB
HAVING AVG(SAL) >= 3000;

-- Zadanie 10: Znajdź średnie miesięczne pensje oraz średnie roczne zarobki dla każdego stanowiska, pamiętaj o prowizji.
SELECT JOB, AVG(SAL), AVG(12 * SAL + NVL(COMM, 0))
FROM EMP
GROUP BY JOB;

-- Zadanie 11: Znajdź różnicę miedzy najwyższą i najniższa pensją.
SELECT MAX(SAL) - MIN(SAL)
FROM EMP;

-- Zadanie 12: Znajdź departamenty zatrudniające powyżej trzech pracowników.
SELECT DEPTNO
FROM EMP
GROUP BY DEPTNO
HAVING COUNT(EMPNO) > 3;

-- Zadanie 13: Sprawdź, czy wszystkie numery pracowników są rzeczywiście wzajemnie różne.
SELECT EMPNO, COUNT(EMPNO)
FROM EMP
GROUP BY EMPNO;

-- Zadanie 14: Podaj najniższe pensje wypłacane podwładnym swoich kierowników. Wyeliminuj grupy o minimalnych zarobkach niższych niż 1000. Uporządkuj według pensji.
SELECT MGR, MIN(SAL)
FROM EMP
GROUP BY MGR
HAVING MIN(SAL) >= 1000;

-- Zadanie 15: Wypisz ilu pracowników ma dział mający siedzibę w DALLAS.
SELECT COUNT(*)
FROM EMP E
INNER JOIN DEPT D ON D.DEPTNO = E.DEPTNO
WHERE D.LOC = 'DALLAS';

-- Zadanie 16: Podaj maksymalne zarobki dla każdej klasy zarobkowej.
SELECT S.GRADE, MAX(E.SAL)
FROM EMP E
INNER JOIN SALGRADE S ON E.SAL BETWEEN S.LOSAL AND S.HISAL
GROUP BY S.GRADE;

-- Zadanie 17: Sprawdź, które wartości zarobków powtarzają się.
SELECT SAL, COUNT(SAL)
FROM EMP
GROUP BY SAL
HAVING COUNT(SAL) > 1;

-- Zadanie 18: Podaj średni zarobek pracowników z drugiej klasy zarobkowej.
SELECT AVG(SAL)
FROM EMP E
INNER JOIN SALGRADE S ON E.SAL BETWEEN S.LOSAL AND S.HISAL
WHERE S.GRADE = 2;

-- Zadanie 19: Sprawdź ilu podwładnych ma każdy kierownik.
SELECT M.EMPNO, COUNT(E.EMPNO)
FROM EMP E
INNER JOIN EMP M ON M.EMPNO = E.MGR
GROUP BY M.EMPNO;

-- Zadanie 20: Podaj sumę, którą zarabiają razem wszyscy pracownicy z pierwszej klasy zarobkowej.
SELECT SUM(E.SAL)
FROM EMP E
INNER JOIN SALGRADE S ON E.SAL BETWEEN S.LOSAL AND S.HISAL
WHERE S.GRADE = 1
GROUP BY S.GRADE;
