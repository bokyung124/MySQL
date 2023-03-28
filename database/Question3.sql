# 1) Get part numbers for parts supplied to any projects in London. (Use EXISTS in your solution.)

select pnum
from SPJ
where exists (select Project.city
              from Project
              where Project.city = 'London'
              and Project.jnum = SPJ.jnum)
group by pnum;

+------+
| pnum |
+------+
| P3   |
| P5   |
| P6   |
+------+

# 2) Get project numbers for projects not supplied with any red part by any London suppliers.

## 1)
select jnum
from SPJ
where not exists(select pnum
                 from Part 
                 where color = 'Red'
                 and Part.pnum = SPJ.pnum)
UNION DISTINCT
select jnum
from SPJ
where not exists (select snum
                  from Supplier
                  where city = 'London'
                  and Supplier.snum = SPJ.snum);

## 2)
select DISTINCT jnum
from SPJ
where exists(select P.pnum, S.snum
             from Part P, Supplier S
             where P.color != 'Red'
             and S.city != 'London'
             and P.pnum = SPJ.pnum
             and S.snum = SPJ.snum);

+------+
| jnum |
+------+
| J1   |
| J2   |
| J3   |
| J4   |
| J5   |
| J6   |
| J7   |
+------+

# 3) Get project numbers for projects supplied with at least all parts available from supplier S1.

select jnum, pnum, snum
from SPJ
where exists(select snum
             from Supplier
             where snum = 'S1'
             and SPJ.snum = Supplier.snum);

+------+------+------+
| jnum | pnum | snum |
+------+------+------+
| J1   | P1   | S1   |
| J4   | P1   | S1   |
+------+------+------+

# 4) Construct an ordered list of all cities in which at least one supplier, part, or project is located.

select city
from Supplier
UNION
select city
from Part
UNION
select city
from Project
order by city;

+--------+
| city   |
+--------+
| Athens |
| London |
| Oslo   |
| Paris  |
| Rome   |
+--------+