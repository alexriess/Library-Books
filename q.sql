-- Alex Riess
-- Queries


-- SELECT 'columns i want'
-- FROM   'tables i'm checking'
-- WHERE  'conditions'

--a)
SELECT Title
FROM BOOK;

--b)
SELECT Branch_name
FROM LIBRARY_BRANCH;

--c)
SELECT Title
FROM BOOK as a, BOOK_COPIES as c
WHERE c.Branch_id = 'A1' AND a.Book_id = c.Book_id 
ORDER BY c.No_of_copies DESC;

--d)
SELECT Name
FROM PUBLISHER, BOOK
WHERE Title = 'Haunted' AND Name = Publisher_name; -- have to hook them

--e)
SELECT Title
--So i can reference correctly without ambiguity
FROM BOOK as b, AUTHORS as a
WHERE Author_name = 'Steven Spielberg' AND b.Book_id = a.Book_id;

--f)
SELECT Title
FROM BOOK as b, AUTHORS as a, BOOK_COPIES as d
WHERE Author_name = 'Steven Spielberg' AND 
		b.Book_id = a.Book_id AND 
		b.Book_id = d.Book_id AND 
		d.No_of_copies >= 1;

--g)
SELECT Name
FROM BORROWER as b, BOOK_LOANS as a
WHERE b.Card_no = a.Card_no;

--h)
SELECT b.Name, b.Phone, a.Due_date
FROM BOOK_LOANS as a, BORROWER as b, BOOK as c
-- CURRENT_DATE Function tracks todays date
WHERE a.Due_date < CURRENT_DATE AND b.Card_no = a.Card_no AND c.Book_id = a.Book_id;

--i)
-- name and due date of who is borrowing 'American Sniper'
SELECT a.Name, b.Due_date
FROM BORROWER as a, BOOK_LOANS as b, BOOK as c
WHERE Title = 'American Sniper' AND a.Card_no = b.Card_no AND c.Book_id = b.Book_id;

--j)

SELECT a.Name, b.Due_date, c.Title
FROM BORROWER as a, BOOK_LOANS as b, BOOK as c, BOOK_COPIES as d
-- specific branch
WHERE b.Branch_id = 'E5' AND 
-- no copies in this branch
		d.No_of_copies = 0 AND 
		a.Card_no = b.Card_no AND 
		c.Book_id = b.Book_id AND
		c.Book_id = d.Book_id;



----
-- 3a)
----

-- Add this person's loan info to the loans table 
INSERT INTO BOOK_LOANS(Book_id, Branch_id, Card_no, Date_out, Due_date)
--							exact date with roughly 3 months of check-out time
VALUES ('1002', 'C3', 'H34', CURRENT_DATE, CURRENT_DATE + 65); 

-- that specific book from that branch decreases No_of_copies by 1
UPDATE BOOK_COPIES
SET No_of_copies = No_of_copies - 1;
WHERE Book_id = '1002' AND Branch_id = 'C3';


		
----
-- 3b) UPDATE
----

-- remove info from BOOK_LOANS Table
-- removed the card number, card numbers specific book and what branch they got it from
-- seperate command: update No_of_copies by 1 
DELETE FROM BOOK_LOANS WHERE Book_id = '1002' AND Branch_id = 'C3' AND Card_no = 'H34';

-- Based on the book number, I added 1 back to the No_of_copies
UPDATE BOOK_COPIES 
SET No_of_copies = No_of_copies + 1
WHERE Book_id = '1002';








