create table SPJ(
    snum CHAR(2) NOT NULL,
    pnum CHAR(2) NOT NULL,
    jnum CHAR(2) NOT NULL,
    QTY INT NULL,
    PRIMARY KEY(snum, pnum, jnum),
    FOREIGN KEY(snum) REFERENCES Supplier(snum),
    FOREIGN KEY(pnum) REFERENCES Part(pnum),
    FOREIGN KEY(jnum) REFERENCES Project(jnum)
);

insert into SPJ values('S1', 'P1', 'J1', 200);
insert into SPJ values('S1', 'P1', 'J4', 700);
insert into SPJ values('S2', 'P3', 'J1', 400);
insert into SPJ values('S2', 'P3', 'J2', 200);
insert into SPJ values('S2', 'P3', 'J3', 200);
insert into SPJ values('S2', 'P3', 'J4', 500);
insert into SPJ values('S2', 'P3', 'J5', 600);
insert into SPJ values('S2', 'P3', 'J6', 400);
insert into SPJ values('S2', 'P3', 'J7', 800);
insert into SPJ values('S2', 'P5', 'J2', 100);
insert into SPJ values('S3', 'P3', 'J1', 200);
insert into SPJ values('S3', 'P4', 'J2', 500);
insert into SPJ values('S4', 'P6', 'J3', 300);
insert into SPJ values('S4', 'P6', 'J7', 300);
insert into SPJ values('S5', 'P2', 'J2', 200);
insert into SPJ values('S5', 'P2', 'J4', 100);
insert into SPJ values('S5', 'P5', 'J5', 500);
insert into SPJ values('S5', 'P5', 'J7', 100);
insert into SPJ values('S5', 'P6', 'J2', 200);
insert into SPJ values('S5', 'P1', 'J4', 100);
insert into SPJ values('S5', 'P3', 'J4', 200);
insert into SPJ values('S5', 'P4', 'J4', 800);
insert into SPJ values('S5', 'P5', 'J4', 400);
insert into SPJ values('S5', 'P6', 'J4', 500);

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