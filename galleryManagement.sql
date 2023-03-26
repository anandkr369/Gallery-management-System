CREATE TABLE  ARTISTS 
("Artist_ID" INT NOT NULL PRIMARY KEY,"Artist_Name" VARCHAR(35) NOT NULL,"Nationality" VARCHAR(45) NOT NULL,"Art_Style" VARCHAR(45) NOT NULL);


 -----------------------------------------------------------------------------
 
 CREATE TABLE ADDRESSES
 ("Address_ID" INT NOT NULL PRIMARY KEY,"Stret_Name" VARCHAR(6) NOT NULL,"Line_Number_1" VARCHAR(45) NOT NULL,"Line_Number_2" VARCHAR(45),"City" VARCHAR(45) NOT NULL,"State" VARCHAR(45),"Zip_Code" INT NOT NULL,"Country" VARCHAR(45) NOT NULL,"Per_Line_Number_1" VARCHAR(45),"Per_Line_Number_2" VARCHAR(45),"Per_City" VARCHAR(45) ,"Per_State" VARCHAR(45),"Per_Zip_Code" INT NULL,"Per_Country" VARCHAR(45));

 SELECT * FROM ADDRESSES

---------------------------------------------------------------

CREATE TABLE GALLERY 
("Gallery_ID" INT PRIMARY KEY NOT NULL,"Gallery_Name" VARCHAR(45),"Addresses_ID" INT NOT NULL REFERENCES ADDRESSES);

-----------------------------------------------------------------

CREATE TABLE ARTS 
("Art_ID" INT NOT NULL PRIMARY KEY,"Art_Title" VARCHAR(20) NOT NULL,"Art_Year" DATE NOT NULL,"Art_Type" VARCHAR(45) NOT NULL,"Artist_ID" INT NOT NULL REFERENCES ARTISTS,"Gallery_Id" INT NOT NULL REFERENCES GALLERY);

  -------------------------------------------------------------------

  CREATE TABLE CUSTOMERS
  (
	"Customer_ID" INT NOT NULL PRIMARY KEY,
	"Addresses_ID" INT NOT NULL REFERENCES ADDRESSES
  );

  ---------------------------------------------------------------------

 CREATE TABLE EXHIBITIONS ("Exhibition_ID" INT NOT NULL PRIMARY KEY,"Exhibition_Name" VARCHAR(45) NOT NULL,"Exhibition_Type" VARCHAR(45) NOT NULL,"Start_Date" DATE NOT NULL,"End_Date" DATE NOT NULL,"Location" VARCHAR(45),"Gallery_Id" INT NOT NULL REFERENCES GALLERY);

SELECT * FROM EXHIBITIONS
----------------------------------------------------------------------------

CREATE TABLE PAYMENT_METHOD
("Payment_ID" INT NOT NULL PRIMARY KEY,"Card_Type" VARCHAR(50) NOT NULL,"Payment_Date" DATE NOT NULL,"Payment_Received" DATE NULL,"Payment_Balance" FLOAT NULL,"Order_ID" INT NOT NULL);


CREATE INDEX index_payment_dt ON PAYMENT_METHOD("Payment_Date");
drop table PAYMENT_METHOD;
drop table BILLS;
----------------------------------------------------------------------------

CREATE TABLE BILLS 
("Bill_ID" INT NOT NULL PRIMARY KEY,"Bill_Date" DATE NOT NULL,"Art_Title" VARCHAR(45) NOT NULL,"Amount" FLOAT NOT NULL,"Customer_ID" INT NOT NULL REFERENCES CUSTOMERS,"Payment_ID" INT NOT NULL REFERENCES PAYMENT_METHOD,"Exhibition_ID" INT NOT NULL REFERENCES EXHIBITIONS);


---------------------------------------------------------------------------------

CREATE TABLE EMPLOYEES
("Employee_ID" INT NOT NULL PRIMARY KEY,"First_Name" VARCHAR(45) NOT NULL,"Last_Name" VARCHAR(45) NOT NULL,"Joining_Date" DATE NOT NULL,"Gender" VARCHAR(45) NOT NULL,"Cell_Phone_Number" INT NOT NULL,"Residence_Number" INT,"Gallery_Id" INT NOT NULL REFERENCES GALLERY,"Address_ID" INT NOT NULL REFERENCES ADDRESSES);

-------------------------------------------------------------------------------------

CREATE TABLE WAGES
("Wages_Id" INT NOT NULL PRIMARY KEY,"Hourly_Wages" INT NOT NULL,"Shift_Time" TIME NULL,"Total_Wage" FLOAT NOT NULL,"Employee_ID" INT NOT NULL REFERENCES EMPLOYEES,"Gallery_ID" INT NOT NULL REFERENCES GALLERY);

-----------------------------------------------------------------------------------------

CREATE TABLE ORDERS
("Order_ID" INT NOT NULL PRIMARY KEY,
"Order_Status" VARCHAR(40) NOT NULL,
"Order_Total" FLOAT NOT NULL,
"Customer_ID" INT NOT NULL REFERENCES CUSTOMERS);

drop table ORDERS;
---------------------------------------------------------------------------------------------


CREATE TABLE ORDER_DETAILS
("Order_Details_ID" INT NOT NULL PRIMARY KEY,"Line_Total" FLOAT NOT NULL ,"Order_ID" INT,"Art_ID" INT REFERENCES ARTS);

drop table ORDER_DETAILS;
--------------------------------------------------------------------------------------------------

CREATE TABLE ARTS_EXHIBITIONS("Art_ID" INT NOT NULL ,"Exhibition_ID" INT NOT NULL,PRIMARY KEY("Art_ID","Exhibition_ID"),FOREIGN KEY("Art_ID") REFERENCES ARTS("Art_ID"),FOREIGN KEY("Exhibition_ID") REFERENCES EXHIBITIONS("Exhibition_ID"));

SELECT * FROM ARTS_EXHIBITIONS


------------------------------------------INSERT ARTISTS-----------------------------------------------

INSERT INTO ARTISTS  VALUES (1,'Stephen Smith', 'American', 'Contemporary');
INSERT INTO ARTISTS  VALUES (2,'Anish Surti', 'Indian', 'Cubism');
INSERT INTO ARTISTS  VALUES (3,'Nilank Sharma', 'Indian', 'Abstract Expressionism');
INSERT INTO ARTISTS  VALUES (4,'Sidharth Upadhyay', 'Indian', 'Pop Art');
INSERT INTO ARTISTS  VALUES (5,'Wuping Wang', 'American', 'Art Deco');

SELECT * FROM  ARTISTS;
--------------------------------------------INSERT ADDRESS-----------------------------------------------

INSERT INTO ADDRESSES VALUES(200,'McGrev', '49/C','Roxbury Crossing', 'Boston', 'MA', 02120, 'USA', '262 Shamshed Apt' , 'Andheri East','Mumbai' , 'Maharashtra', 42346, 'India');
INSERT INTO ADDRESSES VALUES(201,'Horada', '49/C','Roxbury Crossing', 'Boston', 'MA', 02120, 'USA', '62 Sai Vihar' , 'Saket','Indore' , 'Madhya Pradesh', 42001, 'India');
INSERT INTO ADDRESSES VALUES(202,'Bill', '400 ','Dorhester', 'Boston', 'MA', 02120, 'USA', '62 Manavta Nagar' , 'Kanadiya Road','Noida' , 'New Delhi', 62235, 'India');
INSERT INTO ADDRESSES VALUES(203,'Harley', '638 ','Back Bay', 'Boston', 'MA', 02120, 'USA', '694 Mexican Apartments ' , 'Escobar Colony','Leon' , 'Chiapas', 78220, 'Mexico');
INSERT INTO ADDRESSES VALUES(204,'Hughes', '1114 ','Downton', 'Boston', 'MA', 02108, 'USA', '111 Harrier' , 'Salochna Road', 'Tijuana' , 'Mexico City', 82976, 'Mexico');

select * from ADDRESSES
-------------------------------------------------INSERT GALLERY-------------------------------------------------------

INSERT INTO GALLERY VALUES(300, 'COE Art Gallery', 200);
INSERT INTO GALLERY VALUES(301, 'Boston Art Show', 201);
INSERT INTO GALLERY VALUES(302, 'CPS Art Attack', 202);
INSERT INTO GALLERY VALUES(303, 'Arifibers', 203);
INSERT INTO GALLERY VALUES(304, 'Artsy Wish', 204);

SELECT * FROM GALLERY

---------------------------------------------------INSERT ARTS---------------------------------------------------------

INSERT INTO ARTS VALUES(400,'Smiling Eyes', '07/19/2019', 'Contemporary', 1, 300 );
INSERT INTO ARTS VALUES(401,'Finesse Nature', '06/01/2017', 'Contemporary', 2, 302 );
INSERT INTO ARTS VALUES(402,'Nonchalant Society', '01/01/2019', 'Abstract Expressionism', 3, 303 );
INSERT INTO ARTS VALUES(403,'The Starry Night', '02/20/2008', 'Pop Art', 4, 301 );

SELECT * FROM ARTS
-------------------------------------------------INSERT CUSTOMERS-------------------------

INSERT INTO CUSTOMERS VALUES(500,200 );
INSERT INTO CUSTOMERS VALUES(501, 201 );
INSERT INTO CUSTOMERS VALUES(502, 202 );
INSERT INTO CUSTOMERS VALUES(503,203 );
INSERT INTO CUSTOMERS VALUES(504, 204);

SELECT * FROM CUSTOMERS
ALTER TABLE ORDERS ADD Exhibition_ID INT REFERENCES EXHIBITIONS("Exhibition_ID")
-------------------------------------------------INSERT EXHIBITIONS---------------------------------------

INSERT INTO EXHIBITIONS VALUES(600, 'On the Horizon', 'Contemporary Cuban Art Jorge M. Pérez', '04/08/2018', '05/02/2018', 'Boston', 300);
INSERT INTO EXHIBITIONS VALUES(601, 'A Dangerous Woman', 'Subversion and Surrealism Art Honoré Sharrer', '04/08/2017', '05/02/2018', 'Boston', 301);
INSERT INTO EXHIBITIONS VALUES(602, 'DUOX4Odells', 'You’ll Know If You Belong Wickerham & Lomax', '03/10/2019', '03/18/2019', 'Boston', 302);
INSERT INTO EXHIBITIONS VALUES(603, 'Eye Fruit', 'Art of Franklin Williams', '01/03/2006', '01/23/2006', 'Boston', 303);
INSERT INTO EXHIBITIONS VALUES(604, 'Zhang Peili', 'Record, Repeat Art Institute of Chicago', '04/08/2016', '05/12/2016', 'Boston', 304);

select * from exhibitions

--------INSERT ORDER DETAILS------------------------
INSERT INTO ORDER_DETAILS VALUES(900, 40, 800,400)
INSERT INTO ORDER_DETAILS VALUES(901, 60, 801, 401)
INSERT INTO ORDER_DETAILS VALUES(902, 30, 802,402)
INSERT INTO ORDER_DETAILS VALUES(903, 80, 803,402)
INSERT INTO ORDER_DETAILS VALUES(904, 120, 804,403)

SELECT * FROM ORDER_DETAILS
---------------------------------------------------INSERT PAYMENT METHOD----------------------------------

SELECT * FROM PAYMENT_METHOD

INSERT INTO PAYMENT_METHOD VALUES(700, 'Debit Card', '07/27/2019', '08/02/2019', 2100.76, 800);

INSERT INTO PAYMENT_METHOD VALUES(701, 'Credit Card', '08/10/2019', '08/15/2019', 3000, 801);
INSERT INTO PAYMENT_METHOD VALUES(702, 'Master Card', '09/02/2019', '09/10/2019', 1324, 802);
INSERT INTO PAYMENT_METHOD VALUES(703, 'Venmo Card', '10/05/2019', '10/10/2019', 6400, 803);
INSERT INTO PAYMENT_METHOD VALUES(704, 'Credit Card', '11/13/2019', '11/20/2019', 9932, 804);
------------------------------------------------------------------------------------------------------------------
SELECT * FROM BILLS

INSERT INTO BILLS VALUES(110, '07/21/2019','Smiling Eyes', 7772.90, 500, 700, 600 );
INSERT INTO BILLS VALUES(112, '08/23/2019','Impression Sunrise', 3450, 502, 702, 602 );
INSERT INTO BILLS VALUES(113, '03/25/2019','Nonchalant Society', 7840, 503, 703, 603 );
INSERT INTO BILLS VALUES(114, '02/26/2019','The Starry Night', 1120, 504, 704, 604 );


---------------------------------------------------------INSERT EMPLOYEES---------------------------------------------
SELECT * FROM EMPLOYEES;

ALTER TABLE EMPLOYEES ALTER COLUMN Cell_Phone_Number BIGINT NOT NULL;
ALTER TABLE EMPLOYEES ALTER COLUMN Residence_Number BIGINT;

INSERT INTO EMPLOYEES VALUES(2000, 'Anish', 'Surti', '08/11/2016', 'M', 9876543210, 8897898965, 300, 200);
INSERT INTO EMPLOYEES VALUES(2001, 'Nilank', 'Sharma', '08/20/2016', 'M', 876512309, 5459892310, 301, 201);
INSERT INTO EMPLOYEES VALUES(2002, 'Sidharth', 'Upadhyay', '08/25/2016', 'M', 6754328901, 9876098231, 302, 202);
INSERT INTO EMPLOYEES VALUES(2003, 'Lisa', 'Hayden', '01/08/2018', 'F', 89986743, 9876098231, 303, 203);
INSERT INTO EMPLOYEES VALUES(2004, 'Rita', 'Suzen', '08/25/2016', 'F', 7652131023, 9876098231, 304, 204);
INSERT INTO EMPLOYEES VALUES(2005, 'Paul', 'Coeloh', '08/25/2016', 'M', 2314327761, 9876098231, 305, 205);

---------------------------------------------------------------------------------------------------
SELECT * FROM ARTS_EXHIBITIONS

INSERT INTO ARTS_EXHIBITIONS VALUES(400,600);

INSERT INTO ARTS_EXHIBITIONS VALUES(400,601);
INSERT INTO ARTS_EXHIBITIONS VALUES(400,602);

INSERT INTO ARTS_EXHIBITIONS VALUES(401,603);
INSERT INTO ARTS_EXHIBITIONS VALUES(402,603);





alter table PAYMENT_METHOD add Order_Id INT;
alter table PAYMENT_METHOD add status int;
SELECT * FROM EMPLOYEES



CREATE PROCEDURE InsertOrder
	cust_id int,
	exhibition_id int
AS
BEGIN
	INSERT INTO ORDERS
	(
	Order_ID, 
	Order_Status, 
	Customer_ID, 
	Exhibition_ID, 
	order_date
	) VALUES
	(
		NEXT VALUE FOR ord_seq,
		'Initial',
		cust_id,
		exhibition_id,
		GETDATE()
	)

END
