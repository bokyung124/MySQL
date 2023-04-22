# 1) Delete all projects for which there are no shipments.

delete from SPJ
    -> where snum IS NULL
    -> or pnum IS NULL
    -> or jnum IS NULL
    -> or QTY IS NULL;

# Query OK, 0 rows affected (0.00 sec)
# 거래내역이 없는 행이 없어 삭제되지 않음

# 2) Insert a new supplier (S8) into table “Supplier”. The name and city are Smith and New York, respectively; the status is not yet known.

insert into Supplier values('S8', 'Smith', NULL, 'New York');

+------+-------+--------+----------+
| snum | sname | status | city     |
+------+-------+--------+----------+
| S1   | Smith |     20 | London   |
| S2   | Jones |     10 | Paris    |
| S3   | Blake |     30 | Paris    |
| S4   | Clark |     20 | London   |
| S5   | Adams |     30 | Athens   |
| S8   | Smith |   NULL | New York |
+------+-------+--------+----------+

# 3) Construct a table containing a list of part numbers for parts that are supplied either by aLondon supplier or to a London project.

create table PLondon(pnum VARCHAR(10) PRIMARY KEY);

insert ignore into PLondon(pnum)
select pnum
from SPJ
where exists(select snum
             from Supplier
             where Supplier.city = 'London'
             and SPJ.snum = Supplier.snum)
or exists(select jnum
          from Project
          where Project.city = 'London'
          and SPJ.jnum = Project.jnum);

+------+
| pnum |
+------+
| P1   |
| P3   |
| P5   |
| P6   |
+------+

# 4) Construct a table containing a list of project numbers for projects that are either located in London or are supplied by a London supplier.

create table JLondon(jnum VARCHAR(10) PRIMARY KEY);

insert ignore into JLondon(jnum)
select jnum
from SPJ
where exists(select jnum
             from Project
             where Project.city = 'London'
             and SPJ.jnum = Project.jnum)
or exists(select snum
          from Supplier
          where Supplier.city = 'London'
          and SPJ.snum = Supplier.snum);

+------+
| jnum |
+------+
| J1   |
| J3   |
| J4   |
| J5   |
| J7   |
+------+