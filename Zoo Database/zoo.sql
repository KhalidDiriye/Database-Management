--Question 1

SELECT ZOO_ADDRESS, ZOO_CITY, ZOO_STATE
FROM ZOO;

--Question 2

SElECT VOL_ID
FROM VOLUNTEER_DEPT_HISTORY
WHERE VOL_DAYS_WORKED IS NULL;

--Question 3 

SELECT MED_TYPE, MED_DIRECTIONS
FROM MEDICATION
WHERE MED_UNIT_OF_MEASURE LIKE '%tsp%';

--Question 4

SELECT ZOO_CITY
FROM ZOO;

--Question 5

SELECT ANIM_NAME
FROM ANIMAL
WHERE ANIM_NAME LIKE 'B%';

--Question 6

SELECT DON_FIRST_NAME, DON_LAST_NAME
FROM DONATOR
WHERE DON_DATE_DONATED > '08-JUN-10';

--Question 7

SELECT VET_FIRST_NAME, VET_LAST_NAME
FROM VET
WHERE VET_HOSPITAL LIKE 'Wo%';

--Question 8

SELECT ANIM_NAME
FROM ANIMAL A
JOIN ANIMAL_LIVING_ENVIRONMENT ALE
ON A.ANIM_LIVING_ENVIRONMENT_ID = ALE.ANIM_LIVING_ENVIRONMENT_ID
WHERE ALE.ANIM_LIVING_ENVIRONMENT_TYPE = 'Lake';

--Question 9

SELECT ANIM_NAME
FROM ANIMAL 
WHERE ANIM_NAME LIKE 'K%';

--Question 10

SELECT E.EMP_ID, R.RES_BONUS
FROM EMPLOYEE E
JOIN RESEARCHER R
ON E.EMP_ID = R.EMP_ID
WHERE R.RES_BONUS IS NOT NULL;

--Question 11

SELECT P.PRODUCT_ID, P.PRODUCT_NAME
FROM PRODUCT P
JOIN RECEIPT_LINE RL
ON P.PRODUCT_ID = RL.PRODUCT_ID
WHERE SELLING_PRICE > 10 
AND  SELLING_PRICE < 20;

--Question 12

SELECT WAREHOUSE_ID, WAREHOUSE_PHONE_NUMBER, WAREHOUSE_CITY
FROM WAREHOUSE
WHERE WAREHOUSE_CITY IN ('Detroit', 'Dayton');

--Question 13 

SELECT ANIM_BREED_NAME
FROM ANIMAL_BREED
WHERE ANIM_BREED_HABITAT LIKE '%Tropical%' 
OR ANIM_BREED_HABITAT LIKE '%Grasslands%';

--Question 14

SELECT ANIM_NAME, ANIM_ACQUIRED_FROM
FROM ANIMAL 
WHERE ANIM_ACQUIRED_FROM LIKE '%Minnesota Zoo%'
ORDER BY ANIM_ACQUIRED_FROM DESC;

--Question 15

SELECT ANIM_NAME, ANIM_BIRTH_DATE
FROM ANIMAL 
WHERE ANIM_BIRTH_DATE LIKE '%SEP%'
ORDER BY ANIM_BIRTH_DATE DESC;

--Question 16

SELECT VOL_FIRST_NAME, VOL_LAST_NAME
FROM VOLUNTEER
ORDER BY VOL_LAST_NAME DESC;

--Question 17

SELECT P.PRODUCT_ID, P.PRODUCT_NAME, P.PRODUCT_SUGGESTED_PRICE
FROM PRODUCT P
JOIN PURCHASED_PRODUCT PP
ON P.PRODUCT_ID = PP.PRODUCT_ID
WHERE PP.PRODUCT_PURCHASE_DATE LIKE '%07%'
ORDER BY P.PRODUCT_SUGGESTED_PRICE;

--Question 18

SELECT EMP_FIRST_NAME, EMP_LAST_NAME, EMP_TYPE
FROM EMPLOYEE
WHERE OFFICE_ID IS NOT NULL
ORDER BY EMP_TYPE, EMP_LAST_NAME;

--Question 19

SELECT P.PRODUCT_NAME, P.PRODUCT_TYPE
FROM INVENTORY I
JOIN PRODUCT P
ON I.PRODUCT_ID = P.PRODUCT_ID
WHERE I.WAREHOUSE_ID = 2
ORDER BY P.PRODUCT_NAME DESC;

--Question 20

SELECT SPON_ID, SPON_COMPANY_NAME, SPON_DATE_DONATED
FROM CORPORATE_SPONSOR CS
JOIN ZOO Z
ON CS.ZOO_ID = Z.ZOO_ID
WHERE Z.ZOO_NAME = 'Minnesota Zoo';

--Question 21

SELECT ANIM_NAME
FROM ANIMAL A
WHERE A.ANIM_BIRTH_DATE LIKE '%NOV%';

--Question 22

SELECT E.EMP_ID, E.EMP_FIRST_NAME, E.EMP_LAST_NAME
FROM EMPLOYEE E
JOIN OFFICE O
ON E.OFFICE_ID = O.OFFICE_ID
WHERE O.OFFICE_BUILDING = 'Administration';


--Question 23 

SELECT D.DON_FIRST_NAME, D.DON_LAST_NAME, D.DON_DATE_DONATED
FROM DONATOR D
JOIN ZOO Z
ON D.ZOO_ID = Z.ZOO_ID
WHERE Z.ZOO_NAME = 'Underwater Adventure';

--Question 24

SELECT DON_ID, DON_FIRST_NAME, DON_LAST_NAME
FROM DONATOR JOIN DONATOR_PAYMENT USING (DON_ID)
WHERE DON_ID IN (SELECT DON_ID
FROM DONATOR_PAYMENT JOIN PAYMENT USING (PAY_ID)
WHERE PAY_TYPE IN (SELECT PAY_TYPE
FROM PAYMENT
WHERE PAY_TYPE = 'Check' AND PAY_AMOUNT > '100'))
ORDER BY DON_ID;

--Question 25

SELECT ILL_DESCRIPTION, ILL_START_DATE
FROM ILLNESS JOIN ILLNESS_TYPE USING (ILL_TYPE_ID)
WHERE ILL_TYPE_ID IN (SELECT ILL_TYPE_ID
FROM ILLNESS_TYPE JOIN ANIM_OTHER_DETAILS USING (ANIM_ID)
WHERE ANIM_OTHER_DETAILS IN (SELECT ANIM_OTHER_DETAILS
FROM ANIMAL 
WHERE ANIM_OTHER_DETAILS LIKE '%Must live alone%'))
ORDER BY ANIM_BIRTH_DATE;

--Question 26

SELECT PRODUCT.PRODUCT_ID, PRODUCT_PURCHASE_PRICE
FROM PRODUCT
FULL JOIN PURCHASED_PRODUCT
ON PRODUCT.PRODUCT_ID=PURCHASED_PRODUCT.PRODUCT_ID
WHERE PRODUCT_NAME LIKE '%Zoo Magnet%';

--Question 27

SELECT ANIM_NAME, ANIM_BREED_NAME
FROM ANIMAL A
JOIN ANIMAL_BREED AB
ON A.ANIM_BREED_ID = AB.ANIM_BREED_ID
WHERE ANIM_OTHER_DETAILS LIKE '%Must live alone%';

--Question 28

SELECT EMP_ID, MAINT_TITLE
FROM MAINTENANCE;

--Question 29

SELECT E.EMP_FIRST_NAME, E.EMP_LAST_NAME
FROM EMPLOYEE E
JOIN MAINTENANCE M
ON E.EMP_ID = M.EMP_ID
WHERE M.MAINT_TITLE = 'Electrician';

--Question 30

SELECT ANIM_BREED_NAME FROM
(SELECT DISTINCT AB.ANIM_BREED_NAME
FROM ANIMAL A
JOIN ANIMAL_BREED AB
ON A.ANIM_BREED_ID = AB.ANIM_BREED_ID
WHERE A.ANIM_HEIGHT_ON_ARRIVAL > 10 
ORDER BY AB.ANIM_BREED_NAME)
WHERE ROWNUM <= 20;