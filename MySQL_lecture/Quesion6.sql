# 1) Create a view consisting of supplier numbers and part numbers for suppliers and parts that are not "colocated."

create or replace view SPL(snum, pnum) 
as
select s.snum, p.pnum
from Supplier s, Part p
where s.city != p.city;

+------+------+
| snum | pnum |
+------+------+
| S1   | P2   |
| S1   | P3   |
| S1   | P5   |
| S2   | P1   |
| S2   | P3   |
| S2   | P4   |
| S2   | P6   |
| S3   | P1   |
| S3   | P3   |
| S3   | P4   |
| S3   | P6   |
| S4   | P2   |
| S4   | P3   |
| S4   | P5   |
| S5   | P1   |
| S5   | P2   |
| S5   | P3   |
| S5   | P4   |
| S5   | P5   |
| S5   | P6   |
| S8   | P1   |
| S8   | P2   |
| S8   | P3   |
| S8   | P4   |
| S8   | P5   |
| S8   | P6   |
+------+------+


# 2) Create a view consisting of supplier records for suppliers that are located in London.

create or replace view SUP as
select *
from Supplier
where city = 'London';

+------+-------+--------+--------+
| snum | sname | status | city   |
+------+-------+--------+--------+
| S1   | Smith |     20 | London |
| S4   | Clark |     20 | London |
+------+-------+--------+--------+

# 3) Create a view from the suppliers-parts-projects database consisting of all projects (project number and city fields only) that are supplied by supplier S1 and use part P1.

create or replace view PJT(jnum, city)
as
select spj.jnum, j.city
from SPJ spj, Project j
where spj.snum = 'S1'
and spj.pnum = 'P1'
and spj.jnum = j.jnum;

+------+--------+
| jnum | city   |
+------+--------+
| J1   | Paris  |
| J4   | Athens |
+------+--------+

# 4) create view HEAVYWEIGHTS and show the result for each of the following SQL statement.

create view HEAVYWEIGHTS(pnum, wt, col)
as select pnum, weight, color
from Part
where weight > 14;

+------+----+-------+
| pnum | wt | col   |
+------+----+-------+
| P2   | 17 | Green |
| P3   | 17 | Blue  |
| P6   | 19 | Red   |
+------+----+-------+

## a)
select *
from HEAVYWEIGHTS
where col = 'Green';

+------+----+-------+
| pnum | wt | col   |
+------+----+-------+
| P2   | 17 | Green |
+------+----+-------+

## b)
update HEAVYWEIGHTS
set col = 'White'
where wt = 18;

+------+----+-------+
| pnum | wt | col   |
+------+----+-------+
| P2   | 17 | Green |
| P3   | 17 | Blue  |
| P6   | 19 | Red   |
+------+----+-------+
# wt가 18인 데이터가 없어서 적용되지 않음

## c)
delete
from HEAVYWEIGHTS
where wt < 10;

+------+----+-------+
| pnum | wt | col   |
+------+----+-------+
| P2   | 17 | Green |
| P3   | 17 | Blue  |
| P6   | 19 | Red   |
+------+----+-------+
# wt가 10 미만인 데이터도 없기 때문에 적용되지 않음
