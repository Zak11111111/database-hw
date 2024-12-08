-- 1
CREATE VIEW samsBills
AS
(SELECT 
    s.first_name, 
    s.surname, 
    b.bill_date, 
    b.cust_name, 
    b.bill_total
FROM 
    restBill b
INNER JOIN 
    restStaff s
ON 
    b.waiter_no = s.staff_no
WHERE 
    s.staff_no = 4);
-- 2
SELECT * 
FROM samsBills
WHERE bill_total > 400;
-- 3
CREATE VIEW roomTotals
AS
(SELECT 
    t.room_name, 
    SUM(b.bill_total) AS total_sum
FROM 
    restBill b
INNER JOIN 
    restRest_table t
ON 
    b.table_no = t.table_no
GROUP BY 
    t.room_name);
-- 4
CREATE VIEW teamTotals
AS
(SELECT 
    CONCAT(h.first_name, ' ', h.surname) AS headwaiter_name, 
    SUM(b.bill_total) AS total_sum
FROM 
    restBill b
INNER JOIN 
    restStaff w
ON 
    b.waiter_no = w.staff_no
INNER JOIN 
    restStaff h
ON 
    w.headwaiter = h.staff_no
GROUP BY 
    h.first_name, 
    h.surname);