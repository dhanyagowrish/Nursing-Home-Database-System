/* PATIENT TABLE */

INSERT INTO NursingHome.PATIENT(Patient_id,Patient_name,Gender,Date_of_birth,Phone_no,Date_in) VALUES
('P100','Raj Varma','M','1950-05-19',9864739283,'2019-07-16'),
('P101','Neeti Sharma','F','1946-08-09',8965456342,'2015-01-02'),
('P102','Prakash Rao','M','1940-10-15',9087667857,'2010-10-11'),
('P103','Rani Agarwal','F','1945-11-22',9876745636,'2018-06-10'),
('P104','Padma Pai','F','1948-02-19',8874563910,'2020-01-10'),
('P105','Mayank Sinha','M','1938-03-15',9085674736,'2008-12-29'),
('P106','John Smith','M','1949-06-26',9876083615,'2017-09-28'),
('P107','Sushma Venkat','F','1942-09-28',9876548712,'2016-11-22'),
('P108','Prasad Singh','M','1935-01-18',9123547714,'2014-04-12'),
('P109','Kavita Murthy','F','1944-07-16',9912548712,'2018-11-16'),
('P110','Karan Kapoor','M','1948-06-04',9754824352,'2020-02-10'),
('P111','Ali Khan','M','1941-10-12',8845271828,'2013-12-18');

/* LOCAL_GUARDIAN TABLE */

INSERT INTO NursingHome.LOCAL_GUARDIAN(Patient_id,Guardian_name,Gender,Address,Phone_no) VALUES
('P100','Kunal Varma','M','#123 HSR Layout',7864527364),
('P101','Kalyan Mehta','M','#78 1st street Gandhinagar',9088735221),
('P102','Sara Mukesh','F','4th  block HBL Layout',9863445432),
('P103','Meenal Kumari','F','#91 7th stage JP Nagar',7872666123),
('P104','Manoj Pai','M','#78 5th stage Banashankari',8878714242),
('P105','Preeti Sinha','F','#9 2nd road Kammanhalli',9858825346),
('P106','Daisy Matthews','F','#76 4th block Frazer Town',9973456231),
('P107','Gowri Swaraj','F','#23 Prestige Apartments Yelahanka',9851234234),
('P108','Mahesh Singh','M','#55 1st road Cox Town',9854345643),
('P109','Anita Murthy','F','#101 Sobha Apartments Thanisandra',9984562421),
('P110','Sachin Bhatia','M','Maharaj Complex Kalyan Nagar',8875634523),
('P111','Amir Khan','M','#98 6th block Jayanagar',7874556631);



/* NURSE TABLE */

INSERT INTO NursingHome.NURSE(Nurse_id,Nurse_name,Gender,Phone_no) VALUES
('N001','Anya Shankar','F',8876455321),
('N002','Amit Shroff','M',9674536243),
('N003','Mahima Girish','F',8756745722),
('N004','Venkatesh Basu','M',8875462261),
('N005','Alice Fernandes','F',7885341233),
('N006','Girija Reddy','F',9925612345),
('N007','Anand Prasad','M',9546299812),
('N008','Akshata Nayak','F',9856774231),
('N009','Surya Singh','M',8875478666),
('N010','Abdul Bari','M',9745233354),
('N011','Khushi Pandey','F',9987452431),
('N012','Niyati Rao','F',9865543434),
('N013','Akash Gupta','M',8865454522),
('N014','Ganesh Ram','M',8954118745),
('N015','Reena Rawal','F',9845553123),
('N016','Annete Johnson','F',9865456533),
('N017','Pinky Kapoor','F',8755563212),
('N018','Dolly Singh','F',7765453434),
('N019','Ajay Prakash','M',8876545454),
('N020','Shiv Swaroop','M',8755990989),
('N021','Chirag Giri','M',9989323212),
('N022','Mariam Shah','F',8898987699);


/* NURSE_PATIENT_ASSIGNMENT */

INSERT INTO NursingHome.NURSE_PATIENT_ASSIGNMENT(Nurse_id,Patient_id) VALUES
('N001','P103'),
('N002','P111'),
('N003','P109'),
('N006','P110'),
('N005','P101'),
('N007','P108'),
('N004','P102'),
('N008','P100'),
('N009','P104'),
('N011','P105'),
('N015','P106'),
('N010','P107');


/* ROOM */

INSERT INTO NursingHome.ROOM(Room_id,Status,Floor_no) VALUES
(101,'Empty',1),
(102,'Filled',1),
(103,'Empty',1),
(104,'Filled',1),
(105,'Empty',1),
(106,'Filled',1),
(201,'Filled',2),
(202,'Filled',2),
(203,'Empty',2),
(204,'Empty',2),
(205,'Filled',2),
(206,'Filled',2),
(301,'Empty',3),
(302,'Filled',3),
(303,'Empty',3),
(304,'Empty',3),
(305,'Empty',3),
(306,'Empty',3),
(401,'Filled',4),
(402,'Filled',4),
(403,'Filled',4),
(404,'Empty',4),
(405,'Empty',4),
(406,'Filled',4);



/*  ROOM_ASSIGNMENTS */

INSERT INTO NursingHome.ROOM_ASSIGNMENT(Room_id,Patient_id) VALUES
(102,'P100'),
(104,'P101'),
(106,'P102'),
(201,'P103'),
(202,'P104'),
(205,'P105'),
(206,'P106'),
(302,'P107'),
(401,'P108'),
(402,'P109'),
(403,'P110'),
(406,'P111');


/*  CLEANER */

INSERT INTO NursingHome.CLEANER(Cleaner_id,Cleaner_name,Gender,Phone_no) VALUES
('C001','Raju Bhat','M',7786545342),
('C002','Roopa Singh','F',9865543231),
('C003','Neha Kumari','F',8876554323),
('C004','Akhila Sen','F',8874532123),
('C005','Vikram Seth','M',7788754532);


/* CLEANER_ROOM_ASSIGNMENT */

INSERT INTO NursingHome.CLEANER_ROOM_ASSIGNMENT(Room_id,Cleaner_id) VALUES
(102,'C001'),
(104,'C001'),
(106,'C001'),
(201,'C003'),
(202,'C004'),
(205,'C003'),
(206,'C003'),
(302,'C002'),
(402,'C003'),
(401,'C002'),
(403,'C005'),
(406,'C005');


/* BILL */

INSERT INTO NursingHome.BILL(Patient_id,Amount,Reason) VALUES
('P100',12500,'General'),
('P101',3400,'Late Fees'),
('P100',560,'Misc'),
('P102',12500,'General'),
('P102',190,'Misc'),
('P103',12500,'General'),
('P104',12500,'General'),
('P105',12500,'General'),
('P110',100,'Misc'),
('P106',12500,'General'),
('P107',12500,'General'),
('P109',500,'Late Fees'),
('P108',12500,'General'),
('P109',12500,'General'),
('P110',700,'Travel'),
('P110',12500,'General'),
('P105',900,'Misc'),
('P111',12500,'General');


/* MEDICINE */

INSERT INTO NursingHome.MEDICINE(Medicine_id,Medicine_name,Price) VALUES
('M100','Acebutolol',1400),
('M101','Nadolol',1350),
('M102','Verapamil',780),
('M103','Statins',1299.50),
('M104','Erythropoietin',2300),
('M105','Phosphate binders',550),
('M106','Benicar HCT',699),
('M107','Apresoline',1099),
('M108','Metformin',1100),
('M109','Pramlintide',990),
('M110','Afrezza',878),
('M111','Thiazolidinedione',580),
('M112','Arava',1399),
('M113','Azulfidine',1500),
('M114','Trexall',1889),
('M115','Minocin',1090),
('M116','Theophylline',320),
('M117','Anoro Ellipta',499),
('M118','Voltaren',650),
('M119','Indocin',999),
('M120','Lumigan',899),
('M121','Vyzulta',1000),
('M122','Zioptan',1099),
('M123','Maxalt',100);




/* DISEASE */

INSERT INTO NursingHome.DISEASE(Disease_id,Disease_name) VALUES
('D001','High Blood Pressure'),
('D002','Kidney Problem'),
('D003','Heart Disease'),
('D004','Type 1 Diabetes'),
('D005','Type 2 Diabetes'),
('D006','Rheumatoide Arthritis'),
('D007','Pulmonary Disease'),
('D008','Reactive Arthritis'),
('D009','Glaucoma'),
('D010','Migraines');




/* TREATMENTS */

INSERT INTO NursingHome.TREATMENTS(Medicine_id,Disease_id) VALUES
('M100','D001'),
('M101','D001'),
('M102','D001'),
('M103','D002'),
('M104','D002'),
('M105','D002'),
('M106','D003'),
('M107','D003'),
('M108','D004'),
('M109','D004'),
('M110','D004'),
('M111','D005'),
('M112','D006'),
('M113','D006'),
('M114','D006'),
('M115','D006'),
('M116','D007'),
('M117','D007'),
('M118','D008'),
('M119','D008'),
('M120','D009'),
('M121','D009'),
('M122','D009'),
('M123','D010');



/* PATIENT_MEDICINE_REQUIREMENTS */

INSERT INTO NursingHome.PATIENT_MEDICATION_REQUIREMENTS(Patient_id,Medicine_id) VALUES
('P100','M100'),
('P100','M122'),
('P100','M108'),

('P101','M101'),
('P101','M121'),
('P101','M109'),
('P101','M104'),

('P102','M120'),
('P102','M102'),
('P102','M112'),

('P103','M113'),
('P104','M117'),
('P104','M110'),
('P104','M111'),
('P104','M106'),

('P106','M103'),
('P106','M119'),
('P106','M109'),
('P106','M115'),
('P106','M100'),
('P106','M123'),

('P107','M108'),
('P107','M120'),
('P107','M116'),

('P108','M108'),
('P108','M114'),
('P108','M118'),

('P109','M111'),
('P109','M105'),
('P109','M107'),
('P109','M123'),

('P111','M115');


























