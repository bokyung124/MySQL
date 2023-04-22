-- #1. 'Happy Wednesday!'가 '*****Happy Wednesday!*****'으로 출력되도록 하나의 SQL문 작성
select lpad(rpad('Happy Wednesday!', 21, '*'), 26, '*') str
from dual;

/*
STR
--------------------------
*****Happy Wednesday!*****
*/

-- #2. '     Oh!     Oracle, Nice to meet you     !     ' 의 공백 제거 후 출력
select replace('     Oh!     Oracle, Nice to meet you     !     ', ' ', '') str
from dual;

/*
STR
------------------------
Oh!Oracle,Nicetomeetyou!
*/

-- #3. √3 을 오라클 함수를 사용한 sql문으로 나타내기
select sqrt(3)
from dual;

/*
SQRT(3)
----------
1.73205081
*/

-- #4. round함수를 이용해 789.0305 를 소수점 3자리 까지만 표시
select round(789.0305, 3)
from dual;

/*
ROUND(789.0305, 3)
-------------------
            789.031
*/

-- #5. 'Page 1'에서 'Page'만 출력
select rtrim(rtrim('Page 1', '1'), ' ')  rtrim
from dual;

/*
RTRIM
------
Page
*/