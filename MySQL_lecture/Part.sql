create table Part(
    pnum CHAR(2) PRIMARY KEY,
    pname VARCHAR(10) NOT NULL,
    color VARCHAR(10) NOT NULL,
    weight INT NOT NULL,
    city VARCHAR(20) NOT NULL
);

insert into Part values('P1', 'Nut', 'Red', 12, 'London');
insert into Part values('P2', 'Bolt', 'Green', 17, 'Paris');
insert into Part values('P3', 'Screw', 'Blue', 17, 'Rome');
insert into Part values('P4', 'Screw', 'Red', 14, 'London');
insert into Part values('P5', 'Cam', 'Blue', 12, 'Paris');
insert into Part values('P6', 'Cog', 'Red', 19, 'London');

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