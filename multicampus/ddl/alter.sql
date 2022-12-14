# ALTER
# 테이블 이름변경 : RENAME TO
ALTER TABLE cp_employee RENAME TO CP_EMP_DEPT;


# 컬럼 추가
ALTER TABLE OUR_EMP ADD(JOB_CODE CHAR(2) DEFAULT 'J0' NOT NULL);


# 컬럼 삭제
ALTER TABLE OUR_EMP DROP JOB_CODE;


# 컬럼 이름변경
ALTER TABLE our_emp RENAME COLUMN JOB_CODE	TO JOB;


# 컬럼 변경
# 불가
-- ALTER TABLE OUR_EMP MODIFY EMP_NAME VARCHAR(2);
ALTER TABLE OUR_EMP MODIFY EMP_NAME VARCHAR(20);


# 제약조건 변경
# 기본키 삭제
ALTER TABLE OUR_EMP DROP PRIMARY KEY;
# 기본키 추가
ALTER TABLE OUR_EMP ADD PRIMARY KEY(EMP_ID);


# 외래키 삭제
ALTER TABLE OUR_EMP DROP CONSTRAINT our_emp_ibfk_1;
ALTER TABLE OUR_EMP ADD CONSTRAINT FK_OUR_DEPT
FOREIGN KEY(DEPT_CODE ) REFERENCES OUR_DEPT(DEPT_CODE) ON DELETE SET NULL;


SELECT *  FROM our_dept;
SELECT * FROM our_emp;

DELETE FROM OUR_DEPT WHERE DEPT_CODE = 'D01';
ROLLBACK;