-- Alex Riess
-- My Table Description


CREATE TABLE BOOK(
	Book_id CHAR(4),
	Title VARCHAR(15),
	Publisher_name VARCHAR(30),
	
	PRIMARY KEY (Book_id),
	
	FOREIGN KEY (Publisher_name) REFERENCES PUBLISHER (Name)
);


CREATE TABLE AUTHORS(
	Book_id CHAR(4),
	Author_name VARCHAR(20),
	
	PRIMARY KEY (Book_id, Author_name),
	
	FOREIGN KEY (Book_id) REFERENCES BOOK (Book_id)
);


CREATE TABLE PUBLISHER(
	Name VARCHAR(30),
	Address VARCHAR(30),
	
	-- could possibly be (111)-111-1111
	Phone VARCHAR(15),
	
	PRIMARY KEY (Name)
);


CREATE TABLE BOOK_COPIES(
	Book_id CHAR(4),
	
	--letter, than a number
	Branch_id CHAR(2),
	No_of_copies INT,
	
	PRIMARY KEY (Book_id, Branch_id),
	
	FOREIGN KEY (Book_id) REFERENCES BOOK (Book_id),
	FOREIGN KEY (Branch_id) REFERENCES LIBRARY_BRANCH(Branch_id)
);


CREATE TABLE BOOK_LOANS(
	Book_id CHAR(4),
	
	--A1, B2
	Branch_id CHAR(2),
	
	-- H34
	Card_no CHAR(3),
	Date_out DATE,
	Due_date DATE,
	
	PRIMARY KEY (Book_id, Branch_id, Card_no),
	
	FOREIGN KEY (Book_id) REFERENCES BOOK (Book_id),
	FOREIGN KEY (Branch_id) REFERENCES LIBRARY_BRANCH (Branch_id),
	FOREIGN KEY (Card_no) REFERENCES BORROWER (Card_no)
	
);

CREATE TABLE LIBRARY_BRANCH(
	Branch_id CHAR(2),
	Branch_name VARCHAR(30),
	Address VARCHAR(30),
	
	PRIMARY KEY(Branch_id)

);

CREATE TABLE BORROWER(
	Card_no CHAR(3),
	Name VARCHAR(20),
	Address VARCHAR(25),
	Phone VARCHAR(15),
	
	PRIMARY KEY (Card_no)
);
	