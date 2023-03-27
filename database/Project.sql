create table Project(
    jnum CHAR(2) PRIMARY KEY,
    jname VARCHAR(10) NOT NULL,
    city VARCHAR(20) NOT NULL
);

insert into Project values('J1', 'Sorter', 'Paris');
insert into Project values('J2', 'Punch', 'Rome');
insert into Project values('J3', 'Reader', 'Athens');
insert into Project values('J4', 'Console', 'Athens');
insert into Project values('J5', 'Collator', 'London');
insert into Project values('J6', 'Terminal', 'Oslo');
insert into Project values('J7', 'Tape', 'London');

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