/* ** 실습문제 : HR유저(DB)에서 요구사항 해결 **********
-- 사번(employee_id)이 100인 직원 정보 전체 보기
-- 월급(salary)이 15000 이상인 직원의 모든 정보 보기
-- 월급이 15000 이상인 사원의 사번, 이름(LAST_NAME), 입사일(hire_date), 월급여 정보 보기
-- 월급이 10000 이하인 사원의 사번, 이름(LAST_NAME), 입사일, 월급여 정보 보기
---- (급여가 많은 사람부터)
-- 이름(first_name)이 john인 사원의 모든 정보 조회
-- 이름(first_name)이 john인 사원은 몇 명인가?
-- 2008년에 입사한 사원의 사번, 성명('first_name last_name'), 월급여 정보 조회
---- 성명 출력예) 'Steven King'
-- 월급여가 20000~30000 구간인 직원 사번, 성명(last_name first_name), 월급여 정보 조회
-- 관리자ID(MANAGER_ID)가 없는 사람 정보 조회
-- 직종(job_id)코드 'IT_PROG'에서 가장 많은 월급여는 얼마
-- 직종별 최대 월급여 검색
-- 직종별 최대 월급여 검색하고, 최대 월급여가 10000이상인 직종 조회
-- 직종별 평균급여 이상인 직원 조회
**********************************************************/
-- 사번(employee_id)이 100인 직원 정보 전체 보기
SELECT * FROM EMPLOYEES;

SELECT * 
 FROM EMPLOYEES 
 WHERE EMPLOYEE_ID = 100
 ;
-- 월급(salary)이 15000 이상인 직원의 모든 정보 보기
SELECT * 
 FROM EMPLOYEES 
 WHERE SALARY >=15000
 ;
 
-- 월급이 15000 이상인 사원의 사번, 이름(LAST_NAME), 입사일(hire_date), 월급여 정보 보기
SELECT EMPLOYEE_ID, LAST_NAME, HIRE_DATE, SALARY
 FROM EMPLOYEES 
 WHERE SALARY >=15000
 ORDER BY EMPLOYEE_ID
 ;

-- 월급이 10000 이하인 사원의 사번, 이름(LAST_NAME), 입사일, 월급여 정보 보기
SELECT  E.EMPLOYEE_ID, E.LAST_NAME, E.HIRE_DATE, E.SALARY 
FROM EMPLOYEES E
WHERE E.SALARY <=10000
ORDER BY E.SALARY DESC
;
 

-- 이름(first_name)이 john인 사원의 모든 정보 조회
SELECT *
 FROM EMPLOYEES 
 WHERE FIRST_NAME = 'John' --표준화가 되어 있는 경우
;

SELECT *
 FROM EMPLOYEES 
WHERE UPPER (FIRST_NAME) = 'JOHN' --표준화가 되어 있지 않은 경우
;
SELECT * 
FROM EMPLOYEES
WHERE LOWER (FIRST_NAME) = 'john'
;
SELECT * 
FROM EMPLOYEES
WHERE INITCAP (FIRST_NAME) = 'John'
;
 
 
-- 이름(first_name)이 john인 사원은 몇 명인가? 
SELECT COUNT(*)
   FROM EMPLOYEES 
 WHERE FIRST_NAME = INITCAP('John')
 ;

-- 2008년에 입사한 사원의 사번, 성명('first_name last_name'), 월급여 정보 조회
 
SELECT EMPLOYEE_ID, FIRST_NAME||' '||LAST_NAME AS NAME, SALARY, HIRE_DATE 
   FROM EMPLOYEES 
   WHERE HIRE_DATE BETWEEN TO_DATE ('2008/01/01', 'YYYY-MM-DD')
                        AND TO_DATE('2008/12/31', 'YYYY-MM-DD')
   ORDER BY HIRE_DATE
;    
SELECT EMPLOYEE_ID, FIRST_NAME||' '||LAST_NAME AS NAME, SALARY, HIRE_DATE 
   FROM EMPLOYEES 
   WHERE TO_CHAR (HIRE_DATE, 'YYYY') ='2008'
   ORDER BY HIRE_DATE
;    

    

-- 월급여가 20000~30000 구간인 직원 사번, 성명(last_name first_name), 월급여 정보 조회
SELECT  EMPLOYEE_ID, INITCAP(LAST_NAME)||INITCAP(FIRST_NAME) NAME,  SALARY 
   FROM EMPLOYEES 
   WHERE SALARY >= 20000 AND SALARY <= 30000
   ;


-- 관리자ID(MANAGER_ID)가 없는 사람 정보 조회
SELECT * 
FROM EMPLOYEES
WHERE MANAGER_ID IS NULL
; 

-- 직종(job_id)코드 'IT_PROG'에서 가장 많은 월급여는 얼마

SELECT MAX(SALARY)
 FROM EMPLOYEES
 WHERE JOB_ID IN ('IT_PROG')
 ;
 
-- 직종별 최대 월급여 검색
SELECT JOB_ID, MAX_SALARY
 FROM JOBS 
 ORDER BY MAX_SALARY DESC
;

SELECT JOB_ID , COUNT(*), SUM(SALARY) , AVG(SALARY), MAX(SALARY) ,MIN(SALARY)
FROM EMPLOYEES
GROUP BY JOB_ID
;


-- 직종별 최대 월급여 검색하고, 최대 월급여가 10000이상인 직종 조회
 SELECT JOB_ID, MAX(SALARY)
  FROM EMPLOYEES
 WHERE SALARY >= 10000
 GROUP BY JOB_ID 
 ORDER BY MAX(SALARY) DESC
 ;
 
SELECT JOB_ID, MAX(SALARY)
  FROM EMPLOYEES
 GROUP BY JOB_ID
 HAVING MAX(SALARY) >= 10000
 ;
 
 SELECT JOB_ID, MAX(SALARY)
 --SELECT EMPLOYEE_ID, JOB_ID, SALARY
  FROM EMPLOYEES
 WHERE SALARY >= 10000  --10000이상 받은 사람들만 대상으로 
 GROUP BY JOB_ID 
 ; 
 
-- 직종별 평균급여 이상인 직원 조회

SELECT  E.JOB_ID, E.EMPLOYEE_ID, INITCAP(FIRST_NAME)||INITCAP(LAST_NAME) NAME, E.SALARY, AVG. AVG_SALARY FROM EMPLOYEES E , 
 (SELECT JOB_ID, TRUNC(AVG(SALARY)) AVG_SALARY FROM EMPLOYEES GROUP BY JOB_ID) AVG
    WHERE E.JOB_ID = AVG.JOB_ID 
    AND E.SALARY >= AVG.AVG_SALARY
;

SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.JOB_ID, E.SALARY 
FROM EMPLOYEES E
WHERE SALARY >= (SELECT AVG(SALARY) FROM EMPLOYEES
                WHERE JOB_ID = E.JOB_ID)
;
-----
SELECT  E.EMPLOYEE_ID, E.FIRST_NAME, E.JOB_ID, E.SALARY,
      J.JOB_ID J_JOB_ID , J.AVG_SALARY
FROM EMPLOYEES E,
      (SELECT JOB_ID, TRUNC(AVG(SALARY)) AVG_SALARY
        FROM EMPLOYEES
        GROUP BY JOB_ID ) J --서브쿼리 :가상테이블(인라인_
WHERE E.JOB_ID = J.JOB_ID --조인조건
  AND E.SALARY >= J.AVG_SALARY --검색조건
;




