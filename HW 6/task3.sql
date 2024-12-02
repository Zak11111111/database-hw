
SELECT DISTINCT s.first_name, s.surname
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
WHERE b.cust_name = 'Tanya Singh';


SELECT r.room_date
FROM restRoom_management r
JOIN restStaff s ON r.headwaiter = s.staff_no
WHERE s.first_name = 'Charles' AND r.room_name = 'Green'
AND r.room_date BETWEEN 160201 AND 160229;  


SELECT s.first_name, s.surname
FROM restStaff s
WHERE s.headwaiter = (SELECT headwaiter FROM restStaff WHERE first_name = 'Zoe' AND surname = 'Ball');

SELECT b.cust_name, b.bill_total, s.first_name || ' ' || s.surname AS waiter_name
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
ORDER BY b.bill_total DESC;

SELECT DISTINCT s.first_name, s.surname
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
WHERE b.table_no IN (
    SELECT table_no
    FROM restBill
    WHERE bill_no IN (00014, 00017)
);

SELECT s.first_name, s.surname
FROM restStaff s
JOIN restRoom_management r ON r.headwaiter = s.staff_no
WHERE r.room_name = 'Blue' AND r.room_date = 160312
UNION
SELECT s.first_name, s.surname
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
WHERE b.table_no IN (SELECT table_no FROM restRest_table WHERE room_name = 'Blue')
AND b.bill_date = 160312;

