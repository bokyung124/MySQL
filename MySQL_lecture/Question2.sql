# 1) For each part being supplied to a project, get the part number, the project number, and the corresponding total quantity.
/* GROUP BY 쿼리 에러 - sql 표준 문법은 group by 사용시 select 의 칼럼중 집계함수에 쓰이는 것을 제외한 모든 칼럼을 기입해야 한다.
  이를 무시하기 위해 sql_mode 에서 ONLY_FULL_GROUP_BY 설정을 뺀다.
  set session sql_mode = 'NO_ENGINE_SUBSTITUTION,STRICT_TRANS_TABLES'; */

select pnum, jnum, SUM(QTY)
from SPJ
group by pnum, jnum
order by pnum;

+------+------+----------+
| pnum | jnum | SUM(QTY) |
+------+------+----------+
| P1   | J1   |      200 |
| P1   | J4   |      800 |
| P2   | J2   |      200 |
| P2   | J4   |      100 |
| P3   | J1   |      600 |
| P3   | J2   |      200 |
| P3   | J3   |      200 |
| P3   | J4   |      700 |
| P3   | J5   |      600 |
| P3   | J6   |      400 |
| P3   | J7   |      800 |
| P4   | J2   |      500 |
| P4   | J4   |      800 |
| P5   | J2   |      100 |
| P5   | J4   |      400 |
| P5   | J5   |      500 |
| P5   | J7   |      100 |
| P6   | J2   |      200 |
| P6   | J3   |      300 |
| P6   | J4   |      500 |
| P6   | J7   |      300 |
+------+------+----------+

# 2) Get part numbers of parts supplied to some project in an average quantity of more than 320.

select pnum, AVG(QTY)
from SPJ
group by pnum
having AVG(QTY) > 320;

+------+----------+
| pnum | AVG(QTY) |
+------+----------+
| P1   | 333.3333 |
| P3   | 388.8889 |
| P4   | 650.0000 |
| P6   | 325.0000 |
+------+----------+

# 3) Get project numbers and cities where the city has an "o" as the second letter of its name.

select jnum, city
from Project
where city like '_o%';

+------+--------+
| jnum | city   |
+------+--------+
| J2   | Rome   |
| J5   | London |
| J7   | London |
+------+--------+

# 4) Get project numbers for projects whose city is first in the alphabetic list of such cities.

select jnum, city
from Project
order by city
limit 1;

+------+--------+
| jnum | city   |
+------+--------+
| J3   | Athens |
+------+--------+

# 5) Get project numbers for projects supplied with part P1 in an average quantity greater than the greatest quantity in which any part is supplied to project J1.

select jnum, pnum, AVG(QTY)
from SPJ
where pnum = 'P1'
group by jnum
having AVG(QTY) > (select MAX(QTY)
                   from SPJ
                   where jnum = 'J1');

+------+------+----------+
| jnum | pnum | AVG(QTY) |
+------+------+----------+
| J4   | P1   | 400.0000 |
+------+------+----------+