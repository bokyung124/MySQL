/* book, customer table 이용 */

-- #1. 출판사 이름에 '미디어'가 들어가는 도서의 도서번호, 도서명, 출판사를 볼 수 있는 뷰 생성
create or replace view book_view
as
select bookid, bookname, publisher
from book
where publisher like '%미디어%';

/*
BOOKID  BOOKNAME        PUBLISHER
------- --------------- ------------------
     3  축구의 이해        대한미디어
     4  골프 바이블        대한미디어
     7  야구의 추억        이상미디어
     8  야구를 부탁해       이상미디어
*/

-- #2. with check option을 추가하면 뷰의 제약조건에 맞지 않는 데이터를 삽입 / 수정할 때 오류 발생
create or replace view book_view2
as
select bookid, bookname, publisher
from book
where publisher like '%미디어%'
with check option;

insert into book_view2(bookid, bookname) values(12, '클라이밍 개론');

/*
insert into book_view2(bookid, bookname) values(12, '클라이밍 개론')
            *
ERROR at line 1:
ORA-01402: view WITH CHECK OPTION where-clause violation
*/

insert into book_view2 values(12, '배드민턴 치기', '한국체육');
/*
insert into book_view2 values(12, '배드민턴 치기', '한국체육')
            *
ERROR at line 1:
ORA-01402: view WITH CHECK OPTION where-clause violation
*/