# 1) Get supplier numbers for suppliers who supply project J1, in supplier number order.

select snum
from SPJ
where jnum = 'J1'
order by snum;

+------+
| snum |
+------+
| S1   |
| S2   |
| S3   |
+------+

# 2) Get all shipments where the quantity is in the range 300 to 750 inclusive.

select *
from SPJ
where QTY between 300 and 750;

+------+------+------+------+
| snum | pnum | jnum | QTY  |
+------+------+------+------+
| S1   | P1   | J4   |  700 |
| S2   | P3   | J1   |  400 |
| S2   | P3   | J4   |  500 |
| S2   | P3   | J5   |  600 |
| S2   | P3   | J6   |  400 |
| S3   | P4   | J2   |  500 |
| S4   | P6   | J3   |  300 |
| S4   | P6   | J7   |  300 |
| S5   | P5   | J4   |  400 |
| S5   | P5   | J5   |  500 |
| S5   | P6   | J4   |  500 |
+------+------+------+------+

# 3) Get part numbers for parts supplied by a supplier in London to a project in London.

select pnum
from SPJ
where exists (select Supplier.snum, Project.jnum
              from Supplier, Project
              where Supplier.city = 'London'
              and Project.city = 'London'
              and SPJ.snum = Supplier.snum
              and SPJ.jnum = Project.jnum);

+------+
| pnum |
+------+
| P6   |
+------+

# 4) Get all pairs of city names such that a supplier in the first city supplies a project in the second city.

select DISTINCT Supplier.city SCity, Project.city PCity
from Supplier, Project;

+--------+--------+
| SCity  | PCity  |
+--------+--------+
| Athens | Paris  |
| London | Paris  |
| Paris  | Paris  |
| Athens | Rome   |
| London | Rome   |
| Paris  | Rome   |
| Athens | Athens |
| London | Athens |
| Paris  | Athens |
| Athens | London |
| London | London |
| Paris  | London |
| Athens | Oslo   |
| London | Oslo   |
| Paris  | Oslo   |
+--------+--------+