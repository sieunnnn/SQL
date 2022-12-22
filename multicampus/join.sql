# 모든 직원의 직원번호, 이름, 부서코드, 부서명을 조회
SELECT EMP_ID, EMP_NAME, DEPT_CODE, DEPT_TITLE
FROM employee
JOIN department ON (DEPT_CODE = DEPT_ID);


# CROSS JOIN
SELECT *
FROM employee 
CROSS JOIN department
ORDER BY EMP_ID;


# INNER JOIN
# 사번, 이름, 직급코드, 직급명을 출력하세요.
SELECT EMP_NO, EMP_NAME, E.JOB_CODE, JOB_NAME
FROM employee E
JOIN job J ON (E.JOB_CODE = J.JOB_CODE);

SELECT *
FROM employee 
JOIN job USING(JOB_CODE);


# 여러 테이블 JOIN 하기
# 모든 사원들의 사번, 이름, 부서명, 근무지이름을 출력하세요.
SELECT EMP_NO, EMP_NAME, DEPT_TITLE, LOCAL_NAME
FROM employee
JOIN department ON(DEPT_CODE = DEPT_ID)
JOIN location ON(LOCATION_ID = LOCAL_CODE);


# ASIA 지역에서 근무하는 급여 500 만원 미만의 직원들을 조회하세요.
# ASIA1, ASIA2, AISA3 모두 포함
SELECT EMP_NAME, LOCAL_NAME, SALARY
FROM employee
JOIN department ON(DEPT_CODE = DEPT_ID)
JOIN location ON(LOCATION_ID = LOCAL_CODE)
WHERE  SALARY <= 5000000 
AND LOCAL_NAME LIKE 'ASIA_';


# OUTER JOIN
# 부서별 사원수를 조회해보자.
SELECT DEPT_ID, DEPT_TITLE, COUNT(EMP_ID)
FROM department
LEFT JOIN employee ON(DEPT_CODE = DEPT_ID)	# department 테이블을 기준으로 JOIN 하기 때문에 LEFT JOIN
GROUP BY DEPT_ID, DEPT_TITLE 
ORDER BY DEPT_ID;

SELECT DEPT_ID, DEPT_TITLE, COUNT(EMP_ID)
FROM employee
RIGHT JOIN department ON(DEPT_CODE = DEPT_ID)	# department 테이블을 기준으로 JOIN 하기 때문에 RIGHT JOIN
GROUP BY DEPT_ID, DEPT_TITLE 
ORDER BY DEPT_ID;


#FULL OUTER JOIN : LEFT JOIN + RIGHT JOIN
# 두 result set 의 합집합을 반환
SELECT DEPT_ID, DEPT_TITLE, COUNT(EMP_ID)
FROM department
LEFT JOIN employee ON(DEPT_CODE = DEPT_ID)	
GROUP BY DEPT_ID, DEPT_TITLE 
UNION
SELECT DEPT_ID, DEPT_TITLE, COUNT(EMP_ID)
FROM department
RIGHT JOIN employee ON(DEPT_CODE = DEPT_ID)	
GROUP BY DEPT_ID, DEPT_TITLE ;


# SELF JOIN
# employee 테이블에서 이름, 부서코드, 관리자 사번, 관리자 이름을 출력하세요.
SELECT E.EMP_NAME, DEPT_CODE, MANAGER_ID,
	(SELECT EMP_NAME 
		FROM employee 
        WHERE EMP_ID = E.MANAGER_ID)
FROM employee E;

# NULL 값은 나오지 않는다. (* table 1)
SELECT E.EMP_NAME, E.DEPT_CODE, E.MANAGER_ID, E2.EMP_NAME
FROM employee E
JOIN employee E2 ON (E2.EMP_ID = E.MANAGER_ID)
ORDER BY E2.EMP_NAME;

# NULL 값도 포함해서 나오게된다 (* table 2)
SELECT E.EMP_NAME, E.DEPT_CODE, E.MANAGER_ID, E2.EMP_NAME
FROM employee E
LEFT JOIN employee E2 ON (E2.EMP_ID = E.MANAGER_ID) # LEFT JOIN 을 사용했다!
ORDER BY E2.EMP_NAME DESC;


