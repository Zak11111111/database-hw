SELECT s.first_name, s.surname, b.bill_date, COUNT(b.bill_no) AS number_of_bills
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
GROUP BY s.staff_no, b.bill_date
HAVING COUNT(b.bill_no) >= 2;

SELECT r.room_name, COUNT(t.table_no) AS tables_count
FROM restRest_table t
JOIN restRoom_management r ON t.room_name = r.room_name
WHERE t.no_of_seats > 6
GROUP BY r.room_name;

SELECT r.room_name, SUM(b.bill_total) AS total_bill_amount
FROM restRoom_management r
JOIN restBill b ON r.room_name = (
    SELECT room_name FROM restRest_table WHERE table_no = b.table_no
)
GROUP BY r.room_name;

SELECT hw.first_name, hw.surname, SUM(b.bill_total) AS total_bill_amount
FROM restStaff hw
JOIN restStaff s ON hw.staff_no = s.headwaiter
JOIN restBill b ON s.staff_no = b.waiter_no
GROUP BY hw.staff_no
ORDER BY total_bill_amount DESC;

SELECT b.cust_name
FROM restBill b
GROUP BY b.cust_name
HAVING AVG(b.bill_total) > 400;

SELECT s.first_name, s.surname, b.bill_date, COUNT(b.bill_no) AS number_of_bills
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
GROUP BY s.staff_no, b.bill_date
HAVING COUNT(b.bill_no) >= 3;