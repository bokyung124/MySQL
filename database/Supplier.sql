create table Supplier(
    snum CHAR(2) PRIMARY KEY,
    sname VARCHAR(10) NOT NULL,
    status INT NULL,
    city VARCHAR(20) NOT NULL
);

insert into Supplier values('S1', 'Smith', 20, 'London');
insert into Supplier values('S2', 'Jones', 10, 'Paris');
insert into Supplier values('S3', 'Blake', 30, 'Paris');
insert into Supplier values('S4', 'Clark', 20, 'London');
insert into Supplier values('S5', 'Adams', 30, 'Athens');