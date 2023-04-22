-- create table

create table customer(
    custid number primary key,
    name varchar2(10),
    address varchar2(30),
    phone varchar2(15)
);

-- insert data

insert into customer values(1, '박지성', '영국 맨체스타', '000-5000-0001');
insert into customer values(2, '김연아', '대한민국 서울', '000-6000-0001');
insert into customer values(3, '장미란', '대한민국 강원도', '000-7000-0001');
insert into customer values(4, '추신수', '미국 클리블랜드', '000-8000-0001');
insert into customer values(5, '박세리', '대한민국 대전', NULL);