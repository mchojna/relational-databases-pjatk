-- Temat 7: SQL – wybieranie danych z wielu tabel

-- Zadanie 1: Połącz dane z tabel EMP i DEPT przy pomocy warunku złączenia w WHERE.
SELECT *
FROM EMP, DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO;

-- Zadanie 2: Połącz dane z tabel EMP i DEPT przy pomocy INNER JOIN.
SELECT *
FROM EMP
INNER JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO;

-- Zadanie 3: Wybierz nazwiska oraz nazwy departamentów wszystkich pracowników w kolejności alfabetycznej.
SELECT E.ENAME, D.DNAME
FROM EMP E
INNER JOIN DEPT D ON E.DEPTNO = D.DEPTNO
ORDER BY E.ENAME, D.DNAME;

-- Zadanie 4: Wybierz nazwiska wszystkich pracowników wraz z numerami i nazwami departamentów w których są zatrudnieni.
SELECT E.ENAME, D.DEPTNO, D.DNAME
FROM EMP E
INNER JOIN DEPT D ON E.DEPTNO = D.DEPTNO;

-- Zadanie 5: Dla pracowników o miesięcznej pensji powyżej 1500 podaj ich nazwiska, miejsca usytuowania ich departamentów oraz nazwy tych departamentów.
SELECT E.ENAME, D.DNAME, D.LOC
FROM EMP E
INNER JOIN DEPT D ON E.DEPTNO = D.DEPTNO
WHERE E.SAL > 1500;

-- Zadanie 6: Utwórz listę pracowników podając ich nazwisko, zawód, pensję i stopień zaszeregowania.
SELECT E.ENAME, E.JOB, E.SAL, S.GRADE
FROM EMP E
INNER JOIN SALGRADE S ON E.SAL BETWEEN S.LOSAL AND S.HISAL;

-- Zadanie 7: Wybierz informacje o pracownikach, których zarobki odpowiadają klasie zarobkowej 3.
SELECT E.ENAME, E.SAL, E.JOB, S.GRADE
FROM EMP E
INNER JOIN SALGRADE S ON E.SAL BETWEEN S.LOSAL AND S.HISAL
WHERE S.GRADE = 3;

-- Zadanie 8: Wybierz pracowników zatrudnionych w Dallas.
SELECT E.ENAME, D.LOC
FROM EMP E
INNER JOIN DEPT D ON E.DEPTNO = D.DEPTNO
WHERE D.LOC = 'DALLAS';

-- Zadanie 9: Wybierz nazwiska pracowników, nazwy działów i stopnie zaszeregowania.
SELECT E.ENAME, D.DNAME, S.GRADE
FROM EMP E
INNER JOIN DEPT D ON E.DEPTNO = D.DEPTNO
INNER JOIN SALGRADE S ON E.SAL BETWEEN S.LOSAL AND S.HISAL;

-- Zadanie 10: Wypisz dane wszystkich działów oraz ich pracowników tak, aby dane działu pojawiły się, nawet jeśli nie ma w dziale żadnego pracownika.
SELECT D.DEPTNO, D.DNAME, D.LOC, E.ENAME
FROM DEPT D
LEFT JOIN EMP E ON D.DEPTNO = E.DEPTNO;

-- Zadanie 11: Wypisz dane wszystkich działów oraz ich pracowników tak, aby dane pracownika pojawiły się, nawet jeśli pracownik nie jest przypisany do działu.
SELECT D.DEPTNO, D.DNAME, D.LOC, E.ENAME
FROM EMP E
LEFT JOIN DEPT D ON E.DEPTNO = D.DEPTNO;

-- Zadanie 12: Wybierz pracowników (nazwisko, numer działu) z działu 30 i 20. Wypisz dział 20 bez nazwisk.
SELECT E1.ENAME || ' ' || E1.DEPTNO
FROM EMP E1
WHERE E1.DEPTNO = 30
UNION
SELECT E2.ENAME
FROM EMP E2
WHERE E2.DEPTNO = 20;

-- Zadanie 13: Wypisz stanowiska występujące w dziale 10 oraz 30.
SELECT JOB
FROM EMP
WHERE DEPTNO = 10
UNION
SELECT JOB
FROM EMP
WHERE DEPTNO = 30;

-- Zadanie 14: Wypisz stanowiska występujące zarówno w dziale 10 jak i 30.
SELECT JOB
FROM EMP
WHERE DEPTNO = 10
INTERSECT
SELECT JOB
FROM EMP
WHERE DEPTNO = 30;

-- Zadanie 15: Wypisz stanowiska występujące w dziale 10 a nie występujące w dziale 30.
SELECT JOB
FROM EMP
WHERE DEPTNO = 10
MINUS
SELECT JOB
FROM EMP
WHERE DEPTNO = 30;

-- Zadanie 16: Wybierz pracowników, którzy zarabiają mniej od swoich kierowników.
SELECT E.ENAME, E.SAL, M.ENAME, M.SAL
FROM EMP E
INNER JOIN EMP M ON E.MGR = M.EMPNO
WHERE E.SAL < M.SAL;

-- Zadanie 17: Dla każdego pracownika wypisz jego nazwisko oraz nazwisko jego szefa. Posortuj według nazwiska szefa.
SELECT E.ENAME, M.ENAME
FROM EMP E
INNER JOIN EMP M ON E.MGR = M.EMPNO
ORDER BY M.ENAME;
