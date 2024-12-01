SELECT DISTINCT b.cust_name
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
JOIN restRoom_management r ON b.table_no = r.room_name
WHERE b.bill_total > 450.00
AND r.headwaiter = (SELECT staff_no FROM restStaff WHERE first_name = 'Charles');

SELECT s.first_name, s.surname
FROM restRoom_management r
JOIN restStaff s ON r.headwaiter = s.staff_no
JOIN restBill b ON r.room_name = b.table_no
WHERE b.cust_name = 'Nerida Smith' AND b.bill_date = 160111;


SELECT cust_name
FROM restBill
WHERE bill_total = (SELECT MIN(bill_total) FROM restBill);

SELECT first_name, surname
FROM restStaff
WHERE staff_no NOT IN (SELECT DISTINCT waiter_no FROM restBill);

SELECT b.cust_name, s.first_name AS headwaiter_first_name, s.surname AS headwaiter_surname, r.room_name
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
JOIN restRoom_management r ON b.table_no = r.room_name
WHERE b.bill_total = (SELECT MAX(bill_total) FROM restBill);
