# 1) Write a suitable set of CREATE TABLE statements for the sample database suppliers-parts-projects.

create table Supplier(
	snum	varchar(20) NOT NULL UNIQUE,
    sname	varchar(20), 
    status	int	NULL,
    city	varchar(20),
    PRIMARY KEY (snum)
);

create table Part(
	pnum 	varchar(20) NOT NULL UNIQUE,
    pname 	varchar(20),
    color	varchar(20),
    weight 	int ,
    city 	varchar(20),
    PRIMARY KEY (pnum)
);

create table Project(
	jnum 	varchar(20) NOT NULL UNIQUE,
    jname 	varchar(20),
    city	varchar(20),
    PRIMARY KEY (jnum)
);

create table SPJ(
	snum 	varchar(20) NOT NULL ,
    pnum	varchar(20) NOT NULL ,
    jnum 	varchar(20) NOT NULL ,
    qty		varchar(20) NULL,
    PRIMARY KEY (snum, pnum, jnum),
    FOREIGN KEY (snum) REFERENCES Supplier(snum),
    FOREIGN KEY (pnum) REFERENCES Part(pnum),
    FOREIGN KEY (jnum) REFERENCES Project(jnum)
);

# 2) Write a set of CREATE INDEX statements for the sample database suppliers-parts-projects to enforce the required primary key constraints.

create unique index idx_sup ON Supplier(snum);
create unique index idx_part ON Part(pnum);
create unique index idx_pjt ON Project(jnum);
create unique index idx_spj ON SPJ(snum, pnum, jnum);

# show index from [table];
## Supplier
+----------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table    | Non_unique | Key_name | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+----------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Supplier |          0 | PRIMARY  |            1 | snum        | A         |           4 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| Supplier |          0 | idx_sup  |            1 | snum        | A         |           5 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
+----------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+

## Part
+-------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table | Non_unique | Key_name | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+-------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Part  |          0 | PRIMARY  |            1 | pnum        | A         |           6 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| Part  |          0 | idx_part |            1 | pnum        | A         |           6 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
+-------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+

## Project
+---------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table   | Non_unique | Key_name | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+---------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Project |          0 | PRIMARY  |            1 | jnum        | A         |           6 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| Project |          0 | idx_pjt  |            1 | jnum        | A         |           6 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
+---------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+

## SPJ
+-------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table | Non_unique | Key_name | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+-------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| SPJ   |          0 | PRIMARY  |            1 | snum        | A         |           5 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| SPJ   |          0 | PRIMARY  |            2 | pnum        | A         |          11 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| SPJ   |          0 | PRIMARY  |            3 | jnum        | A         |          21 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| SPJ   |          0 | idx_spj  |            1 | snum        | A         |           5 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| SPJ   |          0 | idx_spj  |            2 | pnum        | A         |          12 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| SPJ   |          0 | idx_spj  |            3 | jnum        | A         |          21 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| SPJ   |          1 | pnum     |            1 | pnum        | A         |           6 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| SPJ   |          1 | jnum     |            1 | jnum        | A         |           7 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
+-------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+

# 3) Create the sample database with sample data values.
## insert into [table] values();
## table 파일들 참고

## Supplier
+------+-------+--------+--------+
| snum | sname | status | city   |
+------+-------+--------+--------+
| S1   | Smith |     20 | London |
| S2   | Jones |     10 | Paris  |
| S3   | Blake |     30 | Paris  |
| S4   | Clark |     20 | London |
| S5   | Adams |     30 | Athens |
+------+-------+--------+--------+

## Part
+------+-------+-------+--------+--------+
| pnum | pname | color | weight | city   |
+------+-------+-------+--------+--------+
| P1   | Nut   | Red   |     12 | London |
| P2   | Bolt  | Green |     17 | Paris  |
| P3   | Screw | Blue  |     17 | Rome   |
| P4   | Screw | Red   |     14 | London |
| P5   | Cam   | Blue  |     12 | Paris  |
| P6   | Cog   | Red   |     19 | London |
+------+-------+-------+--------+--------+

## Project
+------+----------+--------+
| jnum | jname    | city   |
+------+----------+--------+
| J1   | Sorter   | Paris  |
| J2   | Punch    | Rome   |
| J3   | Reader   | Athens |
| J4   | Console  | Athens |
| J5   | Collator | London |
| J6   | Terminal | Oslo   |
| J7   | Tape     | London |
+------+----------+--------+

## SPJ
+------+------+------+------+
| snum | pnum | jnum | QTY  |
+------+------+------+------+
| S1   | P1   | J1   |  200 |
| S1   | P1   | J4   |  700 |
| S2   | P3   | J1   |  400 |
| S2   | P3   | J2   |  200 |
| S2   | P3   | J3   |  200 |
| S2   | P3   | J4   |  500 |
| S2   | P3   | J5   |  600 |
| S2   | P3   | J6   |  400 |
| S2   | P3   | J7   |  800 |
| S2   | P5   | J2   |  100 |
| S3   | P3   | J1   |  200 |
| S3   | P4   | J2   |  500 |
| S4   | P6   | J3   |  300 |
| S4   | P6   | J7   |  300 |
| S5   | P1   | J4   |  100 |
| S5   | P2   | J2   |  200 |
| S5   | P2   | J4   |  100 |
| S5   | P3   | J4   |  200 |
| S5   | P4   | J4   |  800 |
| S5   | P5   | J4   |  400 |
| S5   | P5   | J5   |  500 |
| S5   | P5   | J7   |  100 |
| S5   | P6   | J2   |  200 |
| S5   | P6   | J4   |  500 |
+------+------+------+------+