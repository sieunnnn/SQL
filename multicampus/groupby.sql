# 부서별 급여의 총액과 평균 급여륿 보자
SELECT DEPT_CODE, SUM(SALARY), AVG(SALARY)
FROM employee
GROUP BY DEPT_CODE;


# 직급별 급여 평균, 직급별 최고급여, 최저급여, 사원수를 조회하세요.
SELECT JOB_CODE, AVG(SALARY), MAX(SALARY), MIN(SALARY), COUNT(*)
FROM employee
GROUP BY JOB_CODE;


# 급여가 300 만원 이상인 사원들의 부서별 급여 총액을 구하세요.
SELECT DEPT_CODE, SUM(SALARY)
FROM employee
WHERE SALARY >= 3000000
GROUP BY DEPT_CODE;


# 부서의 평균급여가 3000000 이상인 부서를 조회하세요
SELECT DEPT_CODE
FROM employee
GROUP BY DEPT_CODE
HAVING AVG(SALARY) >= 3000000;


# 부서내, 직급별 급여의 최소 최대값을 구해보자
SELECT DEPT_CODE, JOB_CODE, MAX(SALARY), MIN(SALARY), COUNT(*)
FROM employee
GROUP BY DEPT_CODE, JOB_CODE;


# 집계함수
SELECT DEPT_CODE, JOB_CODE, SAL_LEVEL, SUM(SALARY), COUNT(*)
FROM employee
WHERE DEPT_CODE IS NOT NULL
GROUP BY DEPT_CODE, JOB_CODE, SAL_LEVEL WITH ROLLUP
ORDER BY DEPT_CODE IS NULL ASC, JOB_CODE IS NULL ASC,
	SAL_LEVEL IS NULL ASC, DEPT_CODE ASC,
	JOB_CODE ASC, SAL_LEVEL ASC;


# GOUPING
SELECT DEPT_CODE, JOB_CODE, SAL_LEVEL, SUM(SALARY), COUNT(*)
			, GROUPING(DEPT_CODE)
			,	GROUPING(JOB_CODE)
			, GROUPING(SAL_LEVEL)
			, SUM(SALARY), COUNT(*)
FROM employee
WHERE DEPT_CODE IS NOT NULL
GROUP BY DEPT_CODE, JOB_CODE, SAL_LEVEL WITH ROLLUP
ORDER BY DEPT_CODE IS NULL ASC, JOB_CODE IS NULL ASC,
	SAL_LEVEL IS NULL ASC, DEPT_CODE ASC,
	JOB_CODE ASC, SAL_LEVEL ASC;
