/* book, customer table 이용 */

-- #1. 굿스포츠에서 출판한 도서의 제목과 제목의 글자 수 출력
select bookname, length(bookname)
from book
where publisher = '굿스포츠';

/*
BOOKNAME            LENGTH(BOOKNAME)
------------------  ------------------
축구의 역사                            6
피겨 교본                             5
역도 단계별 기술                        9
*/

-- #2. 서점의 고객 중 같은 성을 가진 사람이 몇 명이나 되는지 성 별 인원수 출력
select substr(name, 0, 1) last_name, count(*) count
from customer
group by substr(name, 0, 1);

/*
LAST        COUNT
--------    ---------
박                  2
김                  1
장                  1
추                  1
*/

-- #3. 도서제목에 야구가 포함된 도서를 피구로 변경한 후 도서 목록 출력
select replace(bookname, '야구', '피구') bookname
from book;

/*
BOOKNAME
--------------------
축구의 역사
축구 아는 여자
축구의 이해
골프 바이블
피겨 교본
역도 단계별 기술
피구의 추억
피구를 부탁해
올림픽 이야기
Olympic Champions
*/