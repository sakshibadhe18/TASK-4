CREATE DATABASE Library;
USE Library;

# 1st table is Member 
CREATE TABLE Member (
    member_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(15),
    address VARCHAR(200)
);
INSERT INTO Member (member_id, name, phone, address) VALUES (1, 'Rohit Sawant', '9876543210', 'Pune, Maharashtra'),(2, 'Sneha Deshmukh', '9123456789', 'Mumbai, Maharashtra'),
 (3, 'Amit Kulkarni', '9876501234', 'Nashik, Maharashtra'),(4, 'sanyukta gadge', '7894561230', 'Nagpur, Maharashtra'),
 (5, 'Vikram Shinde', '9988776655', 'Kolhapur, Maharashtra'),(6, 'Neha Patil', '7890123456', 'Aurangabad, Maharashtra'),
 (7, 'Suresh Pawar', '8976543210', 'Solapur, Maharashtra'),(8, 'Priya Sawant', '9090909090', 'Thane, Maharashtra'),
 (9, 'Rohit Bhosale', '9012345678', 'Satara, Maharashtra'),(10, 'Sahil Shelar', '8888888888', 'Navi Mumbai, Maharashtra'),
 (11, 'Kiran Gaikwad', '9876543123', 'Pune, Maharashtra'),(12, 'Smita Patil', '9988772233', 'Mumbai, Maharashtra'),
 (13, 'Ravi Sawant', '9876123456', 'Nashik, Maharashtra'),(14, 'Minal Joshi', '7899876543', 'Nagpur, Maharashtra'),
 (15, 'Sunil Shirsekar', '9090918273', 'Kolhapur, Maharashtra'),(16, 'Deepali Bhosale', '9123987456', 'Aurangabad, Maharashtra'),
 (17, 'Ajay Pawar', '9812345678', 'Solapur, Maharashtra'),(18, 'Meena Desai', '9988445566', 'Thane, Maharashtra'),
 (19, 'Vinay Patkar', '9876001234', 'Pune, Maharashtra'),(20, 'Pallavi Shinde', '9001122334', 'Navi Mumbai, Maharashtra');
 SELECT * FROM Member;
 
 # 2nd table is Books
 CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    author VARCHAR(100),
    published_year INT
);
INSERT INTO Books (book_id, title, author, published_year) VALUES (101, 'The Alchemist', 'Paulo Coelho', 1988), (102, 'Wings of Fire', 'A. P. J. Abdul Kalam', 1999),
(103, 'Rich Dad Poor Dad', 'Robert T. Kiyosaki', 1997),(104, 'Think and Grow Rich', 'Napoleon Hill', 1937),(105, 'To Kill a Mockingbird', 'Harper Lee', 1960),
(106, '1984', 'George Orwell', 1949),(107, 'The Power of Habit', 'Charles Duhigg', 2012),(108, 'Atomic Habits', 'James Clear', 2018),(109, 'The Secret', 'Rhonda Byrne', 2006),
(110, 'Bhagavad Gita', 'Vyasa', 2005);
 SELECT * FROM Books;
 
  # 3rd table is Issue
 CREATE TABLE Issue (
    issue_id INT PRIMARY KEY,
    member_id INT,
    book_id INT,
    issue_date DATE,
    return_date DATE,
    FOREIGN KEY (member_id) REFERENCES Member(member_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);
INSERT INTO Issue (issue_id, member_id, book_id, issue_date, return_date) 
VALUES (6001, 1, 101, '2025-06-01', '2025-06-10'),(6002, 2, 102, '2025-06-02', '2025-06-10'),(6003, 3, 103, '2025-06-03', '2025-06-08'),(6004, 4, 104, '2025-06-04', '2025-06-12'),
 (6005, 5, 105, '2025-06-05', NULL),(6006, 6, 106, '2025-06-06', NULL),(6007, 7, 107, '2025-06-07', '2025-06-15'),(6008, 8, 108, '2025-06-08', NULL),
 (6009, 9, 109, '2025-06-09', '2025-06-20'),(6010, 10, 110, '2025-06-10', NULL),(6011, 11, 101, '2025-06-11', NULL),(6012, 12, 102, '2025-06-12', '2025-06-19'),
(6013, 13, 103, '2025-06-13', NULL),(6014, 14, 104, '2025-06-14', NULL),(6015, 15, 105, '2025-06-15', NULL);
 SELECT * FROM Issue;
  

 # Insert a new member
 INSERT INTO Member (member_id, name, phone, address)
 VALUES (21, 'Rajesh Patil', '9876543211', 'Pune, Maharashtra');

 # Insert a new book
 INSERT INTO Books (book_id, title, author, published_year) VALUES(111, 'To Kill a Mockingbird', 'Harper Lee',1960);
 
# Insert a new Issue with NULL return_date
INSERT INTO Issue (issue_id, member_id, book_id, issue_date, return_date)
VALUES (6016, 21, 111, '2025-06-22', NULL); -- return_date is Null
 
# Insert using DEFAULT for a column
 INSERT INTO Books (book_id, title, author, published_year)
VALUES (112, 'Pride and Prejudice', ' Jane Austen', DEFAULT); -- published_year = 2000

#Update a member's address
UPDATE Member
SET address =  'Mumbai, Maharashtra'
WHERE member_id = 14;

# Update a books published_year
UPDATE Books
SET published_year = 2001
WHERE book_id = 107;

# Delete a specific issue 
DELETE FROM Issue
WHERE issue_id = 6009;

# Fetch all table
SELECT * FROM Member;
SELECT * FROM Books;
SELECT * FROM Issue;

#  Fetch specific columns
SELECT name, phone FROM Member;
SELECT title, published_year FROM Books;
SELECT  book_id, issue_date, return_date FROM Issue;

# Query
SELECT * FROM Issue
WHERE return_date IS NULL;

SELECT * FROM Books
WHERE title LIKE '%Story%';

SELECT * FROM Issue
WHERE issue_date BETWEEN '2025-06-01' AND '2025-06-15';

SELECT * FROM Member
WHERE address LIKE '%Pune%' AND name LIKE '%Raj%';

SELECT * FROM Issue
WHERE member_id = 21 OR book_id = 111;

SELECT * FROM Issue
ORDER BY issue_date ;

SELECT * FROM Member
ORDER BY address DESC;

SELECT * FROM Books
ORDER BY title , author;

SELECT * FROM Issue
WHERE return_date IS NULL
ORDER BY issue_date DESC
LIMIT 5;

# Aggregate Functions 
SELECT COUNT(*) AS total_members FROM Member;
SELECT COUNT(*) AS total_books FROM Books;
SELECT MIN(issue_date) AS earliest, MAX(issue_date) AS latest 
FROM Issue;

# GROUP BY Clause
SELECT author, COUNT(*) AS book_count
FROM Books
GROUP BY author;

SELECT member_id, COUNT(*) AS total_issues
FROM Issue
GROUP BY member_id;

SELECT issue_date, COUNT(*) AS total_books_issued
FROM Issue
WHERE issue_date = '2025-06-10'
GROUP BY issue_date;

SELECT book_id, COUNT(*) AS issue_count
FROM Issue
GROUP BY book_id;

SELECT address, COUNT(*) AS members_in_city
FROM Member
GROUP BY address;


# HAVING Clause
SELECT author, COUNT(*) AS book_count
FROM Books
GROUP BY author
HAVING COUNT(*) > 2;

SELECT member_id, COUNT(*) AS total_issues
FROM Issue
GROUP BY member_id
HAVING COUNT(*) > 3;

SELECT return_date, COUNT(*) AS books_return_date
FROM Issue
GROUP BY return_date
HAVING COUNT(*) > 1;

SELECT book_id, COUNT(*) AS issue_count
FROM Issue
GROUP BY book_id
HAVING COUNT(*) > 1;


