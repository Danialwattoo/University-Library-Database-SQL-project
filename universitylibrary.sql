create database universitylibrary
use universitylibrary

CREATE TABLE EMPLOYEE (
    EmpID CHAR(5) NOT NULL,
    EmpName VARCHAR(100) NOT NULL,
    EmpAddr VARCHAR(150) NULL,
    EmpEmail VARCHAR(50) NOT NULL,
    CONSTRAINT EmployeePK PRIMARY KEY (EmpID)
);

INSERT INTO EMPLOYEE (EmpID, EmpName, EmpAddr, EmpEmail)
VALUES 
    ('101', 'Ahmed Khan', '920 Napoleon Road', 'ak@cat.edu'),
    ('102', 'Fatima Noor', '922 Lake Dr', 'fn@cat.edu'),
    ('103', 'Ibrahim Ali', '933 Westwood Dr', 'ia@cat.edu'),
    ('104', 'Ayesha Siddiqui', '935 Everwood Dr', 'as@cat.edu'),
    ('105', 'Zainab Hassan', '940 South Main Street', 'zh@cat.edu');
    
CREATE TABLE STUDENT (
    StudID CHAR(5) NOT NULL,
    StuName VARCHAR(100) NOT NULL,
    StuAddr VARCHAR(150) NULL,
    StuEmail VARCHAR(50) NOT NULL,
    CONSTRAINT StudentPK PRIMARY KEY (StudID)
);

INSERT INTO STUDENT (StudID, StuName, StuAddr, StuEmail)
VALUES 
    ('1', 'Aisha Khan', '165 Main Street', 'ak@cat.edu'),
    ('2', 'Ali Hassan', '30 Memorial Drive', 'ah@cat.edu'),
    ('3', 'Fatima Ahmed', '700 Oak Street', 'fa@cat.edu'),
    ('4', 'Usman Ali', '11 Jungle Road', 'ua@cat.edu'),
    ('5', 'Zainab Malik', '506 State Road', 'zm@cat.edu');
    
CREATE TABLE PUBLISHER (
    PubID CHAR(5) NOT NULL,
    PubName VARCHAR(100) NOT NULL,
    PubAddr VARCHAR(150) NULL,
    PubEmail VARCHAR(50) NOT NULL,
    CONSTRAINT PublisherPK PRIMARY KEY (PubID)
);

INSERT INTO PUBLISHER (PubID, PubName, PubAddr, PubEmail)
VALUES 
    ('1', 'Abdul Rahman', '352 Palmer Road', 'ar@cat.edu'),
    ('2', 'Fatima Zahra', '141 Washington Ave', 'fz@cat.edu'),
    ('3', 'Muhammad Ali', '279 Troy Road', 'ma@cat.edu'),
    ('4', 'Aisha Siddiqua', '4975 Transit Road', 'as@cat.edu'),
    ('5', 'Omar Farooq', '161 Berlin Road', 'of@cat.edu');
    
/* Create the AUTHOR table */
CREATE TABLE AUTHOR (
    AuthID CHAR(5) NOT NULL,
    AuthName VARCHAR(100) NOT NULL,
    AuthAddr VARCHAR(150) NULL,
    AuthEmail VARCHAR(50) NOT NULL,
    CONSTRAINT AuthPK PRIMARY KEY (AuthID)
);

/* Insert records into AUTHOR */
INSERT INTO AUTHOR (AuthID, AuthName, AuthAddr, AuthEmail)
VALUES 
    ('30001', 'Abdullah Khan', '235 Queen St', 'ak@cat.edu'),
    ('30002', 'Fatima Ahmed', '164 Danbury Rd', 'fa@cat.edu'),
    ('30003', 'Muhammad Ali', '80 Town Line Rd', 'ma@cat.edu'),
    ('30004', 'Ayesha Siddiqua', '970 Torringford Street', 'as@cat.edu'),
    ('30005', 'Omar Farooq', '844 No Colony Road', 'of@cat.edu');
    
/* Create the BOOK table */
CREATE TABLE BOOK (
    BookID CHAR(5) NOT NULL,
    BookName VARCHAR(100) NOT NULL,
    BookPages INT NOT NULL,
    ISBNNum VARCHAR(50) NOT NULL,
    StudID CHAR(5) NULL,
    EmpID CHAR(5) NULL,
    PubID CHAR(5) NOT NULL,
    CONSTRAINT BookPK PRIMARY KEY (BookID),
    CONSTRAINT BookFK1 FOREIGN KEY (StudID) REFERENCES STUDENT (StudID)
        ON UPDATE CASCADE
        ON DELETE NO ACTION,
    CONSTRAINT BookFK2 FOREIGN KEY (EmpID) REFERENCES EMPLOYEE (EmpID)
        ON UPDATE CASCADE
        ON DELETE NO ACTION,
    CONSTRAINT BookFK3 FOREIGN KEY (PubID) REFERENCES PUBLISHER (PubID)
        ON UPDATE CASCADE
        ON DELETE NO ACTION
);

/* Insert records into BOOK */
INSERT INTO BOOK (BookID, BookName, BookPages, ISBNNum, StudID, EmpID, PubID)
VALUES 
    ('40001', 'The Bell Jar', 110, '817525766-0', '1', '101', '1'),
    ('40002', 'Calvin', 230, '716578901-4', '2', '102', '2'),
    ('40003', 'Displacement', 360, '998456723-4', '3', '103', '3'),
    ('40004', 'Edinburgh', 500, '654732187-5', '4', '104', '4'),
    ('40005', 'The Fifth Risk', 650, '756489762-1', '5', '105', '5');

/* Create the BOOK_AUTH table */
CREATE TABLE BOOK_AUTH (
    BookAuthID CHAR(5) NOT NULL,
    BookID CHAR(5) NOT NULL,
    AuthID CHAR(5) NOT NULL,
    CONSTRAINT BookAuthPK PRIMARY KEY (BookAuthID),
    CONSTRAINT BookAuthFK1 FOREIGN KEY (BookID) REFERENCES BOOK (BookID)
        ON UPDATE CASCADE
        ON DELETE NO ACTION,
    CONSTRAINT BookAuthFK2 FOREIGN KEY (AuthID) REFERENCES AUTHOR (AuthID)
        ON UPDATE CASCADE
        ON DELETE NO ACTION
);

/* Insert records into BOOK_AUTH */
INSERT INTO BOOK_AUTH (BookAuthID, BookID, AuthID)
VALUES 
    ('50001', '40001', '30001'),
    ('50002', '40002', '30002'),
    ('50003', '40003', '30003'),
    ('50004', '40004', '30004'),
    ('50005', '40005', '30005');
show tables
select * from BOOK_AUTH
select * from BOOK