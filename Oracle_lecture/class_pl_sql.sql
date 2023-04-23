-- create table
create table class(
    c_id number primary key,
    c_no number,
    c_name varchar2(50),
    c_prof varchar2(20)
);

insert into class values(1, 190101, '데이터베이스', '심준호');
insert into class values(2, 190102, '데이터사이언스', '이기용');
insert into class values(3, 190103, '프로그래밍언어', '이광수');
insert into class values(4, 190104, '소프트웨어의이해', '이현자');
insert into class values(5, 190105, '자료구조', '유석종');

/*
C_ID	   C_NO C_NAME			               C_PROF
---- ---------- ------------------------------ ----------
   1     190101 데이터베이스                      심준호
   2     190102 데이터사이언스                     이기용
   3     190103 프로그래밍언어                     이광수
   4     190104 소프트웨어의이해                   이현자
   5     190105 자료구조                         유석종
*/

-- #1. 과목 테이블에서 '자료구조' 과목의 과목번호를 검색하여, 그 과목번호에 5를 더한 수를 과목번호로 하고, 과목id에 1을 더한 수를 과목id로 하는 '자료구조02' 과목을 추가하는 PL/SQL 문 작성
DECLARE
    v_id    class.c_id%TYPE;
    v_no    class.c_no%TYPE;
    v_name  class.c_name%TYPE;
BEGIN
    select c_id+1, c_no+5
    into v_id, v_no
    from class
    where c_name = '자료구조';

    v_name := '자료구조02';

    insert into class(c_id, c_no, c_name) values(v_id, v_no, v_name);
END;
/

/*
PL/SQL procedure successfully completed.
*/

select * from class;

/*
C_ID	   C_NO C_NAME			               C_PROF
---- ---------- ------------------------------ ----------
   1     190101 데이터베이스                      심준호
   2     190102 데이터사이언스                     이기용
   3     190103 프로그래밍언어                     이광수
   4     190104 소프트웨어의이해                   이현자
   5     190105 자료구조                         유석종
   6     190110 자료구조02
*/

-- #2. 1번에서 추가한 '자료구조02'의 과목명을 '컴퓨터 네트워크'로 변경하는 PL/SQL 문 작성
DECLARE 
    v_name  class.c_name%TYPE;
    v_id    class.c_id%TYPE;
BEGIN
    select c_id
    into v_id
    from class
    where c_name = '자료구조02';

    v_name := '컴퓨터 네트워크';

    update class
    set c_name = v_name
    where c_id = v_id;
END;
/

/*
PL/SQL procedure successfully completed.
*/

select * from class;

/*
C_ID	   C_NO C_NAME			               C_PROF
---- ---------- ------------------------------ ----------
   1     190101 데이터베이스                      심준호
   2     190102 데이터사이언스                     이기용
   3     190103 프로그래밍언어                     이광수
   4     190104 소프트웨어의이해                   이현자
   5     190105 자료구조                         유석종
   6     190110 컴퓨터 네트워크
*/

-- #3. %TYPE 데이터타입을 이용하여 EMP 테이블에서 사원번호가 7876인 사원의 이름, 사원 번호, 급여를 출력하는 프로그램 작성
DECLARE 
    e_id    emp.empno%TYPE;
    e_name  emp.ename%TYPE;
    e_sal   emp.sal%TYPE;
BEGIN   
    select empno, ename, sal
    into e_id, e_name, e_sal
    from emp
    where empno = 7876;

    DBMS_OUTPUT.PUT_LINE('이름: ' || e_name || ', 사원번호: ' || e_id || ', 급여: ' || e_sal);
END;
/

/*
이름: ADAMS, 사원번호: 7876, 급여: 1100

PL/SQL procedure successfully completed.
*/

-- #4. %ROW 데이터타입을 이용하여 EMP 테이블에서 사원번호가 7844인 사원의 이름, 번호, 급여를 출력하는 프로그램 작성
DECLARE 
    e_emp   emp%ROWTYPE;
BEGIN
    select empno, ename, sal
    into e_emp.empno, e_emp.ename, e_emp.sal
    from emp
    where empno = 7844;

    DBMS_OUTPUT.PUT_LINE('이름: ' || e_emp.ename || ', 사원번호: ' || e_emp.ename || ', 급여: ' || e_emp.sal);
END;
/

/*
이름: TURNER, 사원번호: TURNER, 급여: 1500

PL/SQL procedure successfully completed.
*/
