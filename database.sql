CREATE DATABASE KINDERGARTEN;
USE KINDERGARTEN;

CREATE TABLE student
( 	studentid CHAR(6) NOT NULL,
	fname VARCHAR(25) NOT NULL,
    lname VARCHAR(25) NOT NULL,
    dob DATE NOT NULL,
    gender CHAR(1) NOT NULL,
    address VARCHAR(40) NOT NULL,
    enrollmentdate DATE NOT NULL,
	PRIMARY KEY (studentid) );
    
CREATE TABLE employee
( 	employeeid CHAR(6) NOT NULL,
	fname VARCHAR(25) NOT NULL,
    lname VARCHAR(25) NOT NULL,
    employeeposition VARCHAR(25) NOT NULL,
	gender CHAR(1) NOT NULL,
    dob DATE NOT NULL,
	phonenumber CHAR(12) NOT NULL,
    address VARCHAR(40) NOT NULL,
    datehired DATE NOT NULL,
    email VARCHAR(100) NOT NULL,
    salary NUMERIC(9,2) NOT NULL,
    classroomoffice VARCHAR(5) NOT NULL,
	PRIMARY KEY (employeeid) );
    
CREATE TABLE homeroom 
(	studentid CHAR(6) NOT NULL,
 	teacherid CHAR(6) NOT NULL,
    PRIMARY KEY(studentid, teacherid),
    FOREIGN KEY (studentid) REFERENCES student(studentid),
    FOREIGN KEY (teacherid) REFERENCES employee(employeeid));
    
CREATE TABLE parent
( 	parentid CHAR(6) NOT NULL,
	fname VARCHAR(25) NOT NULL,
    lname VARCHAR(25) NOT NULL,
    relationtostudent VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL,
	phonenumber CHAR(12) NOT NULL,
	PRIMARY KEY (parentid) );
    
CREATE TABLE parentstudent 
(	studentid CHAR(6) NOT NULL,
 	parentid CHAR(6) NOT NULL,
    PRIMARY KEY(studentid, parentid),
    FOREIGN KEY (studentid) REFERENCES student(studentid),
    FOREIGN KEY (parentid) REFERENCES parent(parentid));
    
CREATE TABLE vaccine
( 	vaccineid CHAR(6) NOT NULL,
	vaccinename VARCHAR(25) NOT NULL,
    vaccinedesc VARCHAR(40) NOT NULL,
	PRIMARY KEY (vaccineid) );
    
CREATE TABLE studentvaccines 
(	studentid CHAR(6) NOT NULL,
	vaccineid CHAR(6) NOT NULL,
    PRIMARY KEY(studentid, vaccineid),
    FOREIGN KEY (studentid) REFERENCES student(studentid),
    FOREIGN KEY (vaccineid) REFERENCES vaccine(vaccineid));
    
CREATE TABLE medicalcondition
( 	conditionid CHAR(6) NOT NULL,
	conditionname VARCHAR(25) NOT NULL,
    conditiondesc VARCHAR(100) NOT NULL,
	PRIMARY KEY (conditionid) );
    
CREATE TABLE studentconditions 
(	studentid CHAR(6) NOT NULL,
	conditionid CHAR(6) NOT NULL,
    PRIMARY KEY(studentid, conditionid),
    FOREIGN KEY (studentid) REFERENCES student(studentid),
    FOREIGN KEY (conditionid) REFERENCES medicalcondition(conditionid));
    
CREATE TABLE financial
( 	transactionid CHAR(6) NOT NULL,
	transactionamount NUMERIC(7,2) NOT NULL,
    transactiondate DATE NOT NULL,
    transactiondesc VARCHAR(40) NOT NULL,
	PRIMARY KEY (transactionid) );
    
CREATE TABLE inventory
( 	equipmentid CHAR(6) NOT NULL,
	equipmentprice NUMERIC(7,2) NOT NULL,
    equipmentlocation VARCHAR(5) NOT NULL,
	PRIMARY KEY (equipmentid));
    
CREATE TABLE transactions
( 	equipmentid CHAR(6) NOT NULL,
 	transactionid CHAR(6) NOT NULL,
	PRIMARY KEY (equipmentid, transactionid), 
    FOREIGN KEY (equipmentid) REFERENCES inventory(equipmentid),
	FOREIGN KEY (transactionid) REFERENCES financial(transactionid));
    
INSERT INTO student VALUES ('S00001', 'Jasmine', 'Doe', '2018-04-15', 'F', '123 Elm Dr', '2023-09-01');
INSERT INTO student VALUES ('S00002', 'Jane', 'Foster', '2018-07-22', 'F', '126 Oak St', '2023-09-01');
INSERT INTO student VALUES ('S00003', 'George', 'Lucas', '2018-10-30', 'M', '127 Pine Dr', '2023-09-01');
INSERT INTO student VALUES ('S00004', 'Benjamin', 'Franklin', '2018-01-17', 'M', '128 Maple St', '2023-09-01');
INSERT INTO student VALUES ('S00005', 'Alexander', 'Hamilton', '2018-09-15', 'M', '129 Birch Dr', '2023-09-01');
INSERT INTO student VALUES ('S00006', 'Ethan', 'Moore', '2018-05-29', 'M', '231 Wood St', '2023-09-01');
INSERT INTO student VALUES ('S00007', 'Lilly', 'Gonzalez', '2018-02-09', 'F', '123 Spruce Dr', '2023-09-01');
INSERT INTO student VALUES ('S00008', 'Ava', 'Miller', '2019-01-01', 'F', '123 Redwood Dr', '2023-09-01');
INSERT INTO student VALUES ('S00009', 'Milly', 'Brown', '2019-02-14', 'F', '561 Univesity Dr', '2023-09-01');
INSERT INTO student VALUES ('S00010', 'Thor', 'Odinson', '2018-03-14', 'M', '213 Valhala Dr', '2023-09-01');
INSERT INTO student VALUES ('S00011', 'Loki', 'Odinson', '2018-04-06', 'M', '215 Valhala St', '2023-09-01');
INSERT INTO student VALUES ('S00012', 'Emma', 'Chamberlain', '2018-12-21', 'F', '134 Aspen Dr', '2023-09-01');
INSERT INTO student VALUES ('S00013', 'James', 'Brown', '2019-07-19', 'M', '215 Elwood Blvd', '2023-09-01');
INSERT INTO student VALUES ('S00014', 'Olivia', 'Rodrigo', '2018-08-14', 'F', '333 Pine St', '2023-09-01');
INSERT INTO student VALUES ('S00015', 'Lebron', 'Curry', '2019-05-08', 'M', '123 Birch Dr', '2023-09-01');
INSERT INTO student VALUES ('S00016', 'Anthony', 'Davis', '2018-07-05', 'M', '422 Redwood St', '2023-09-01');
INSERT INTO student VALUES ('S00017', 'Peter', 'Parker', '2018-09-23', 'M', '433 East Dr', '2023-09-01');
INSERT INTO student VALUES ('S00018', 'Henry', 'Martin', '2018-09-21', 'M', '142 Birch St', '2023-09-01');
INSERT INTO student VALUES ('S00019', 'Martin', 'Lee', '2019-04-11', 'M', '143 Cedar St', '2023-09-01');
INSERT INTO student VALUES ('S00020', 'Evelyn', 'Perez', '2018-12-25', 'F', '144 Redwood St', '2023-09-01');


INSERT INTO employee VALUES ('E00001', 'Wilson', 'Fisk', 'Principal', 'M', '1975-12-15', '555-456-7890', '405 Willow St', '2010-03-05', 'david.wilson@kindergarten.com', 70000.00, 'O1');
INSERT INTO employee VALUES ('E00002', 'Lisa', 'Miller', 'Vice Principal', 'F', '1975-08-20', '555-567-8901', '306 Maple St', '2015-06-01', 'lisa.miller@kindergarten.com', 65000.00, 'O1');
INSERT INTO employee VALUES ('E00003', 'Emily', 'Davis', 'School Nurse', 'F', '1980-11-15', '555-678-9012', '204 Pine St', '2019-01-10', 'emily.davis@kindergarten.com', 45000.00, 'NR');
INSERT INTO employee VALUES ('E00004', 'John', 'Harris', 'School Nurse', 'M', '1985-04-22', '555-789-0123', '305 Cedar St', '2020-05-15', 'john.harris@kindergarten.com', 46000.00, 'NR');
INSERT INTO employee VALUES ('E00005', 'Sophia', 'Jackson', 'School Nurse', 'F', '1990-06-30', '555-890-1234', '406 Elm St', '2021-09-01', 'sophia.jackson@kindergarten.com', 47000.00, 'NR');
INSERT INTO employee VALUES ('E00006', 'Alice', 'Johnson', 'Teacher', 'F', '1985-03-20', '555-123-4567', '102 Birch St', '2015-08-15', 'alice.johnson@kindergarten.com', 50000.00, 'A1');
INSERT INTO employee VALUES ('E00007', 'Bob', 'Smith', 'Teacher', 'M', '1978-11-05', '555-234-5678', '203 Cedar St', '2018-01-10', 'bob.smith@kindergarten.com', 52000.00, 'A2');
INSERT INTO employee VALUES ('E00008', 'Carol', 'Brown', 'Teacher', 'F', '1990-07-25', '555-345-6789', '304 Redwood St', '2020-05-20', 'carol.brown@kindergarten.com', 51000.00, 'A3');
INSERT INTO employee VALUES ('E00009', 'Daniel', 'Taylor', 'Teacher', 'M', '1982-09-10', '555-456-7890', '405 Willow St', '2017-03-15', 'daniel.taylor@kindergarten.com', 53000.00, 'A4');
INSERT INTO employee VALUES ('E00010', 'Emily', 'Wilson', 'Teacher', 'F', '1987-12-05', '555-567-8901', '506 Maple St', '2016-08-01', 'emily.wilson@kindergarten.com', 50000.00, 'A5');
INSERT INTO employee VALUES ('E00011', 'Frank', 'Miller', 'Teacher', 'M', '1992-01-30', '555-678-9012', '607 Pine St', '2019-04-10', 'frank.miller@kindergarten.com', 52000.00, 'A6');
INSERT INTO employee VALUES ('E00012', 'Grace', 'Clark', 'Teacher', 'F', '1988-05-15', '555-789-0123', '708 Oak St', '2017-11-15', 'grace.clark@kindergarten.com', 51000.00, 'A7');
INSERT INTO employee VALUES ('E00013', 'Henry', 'Lewis', 'Teacher', 'M', '1991-06-20', '555-890-1234', '809 Cedar St', '2020-02-01', 'henry.lewis@kindergarten.com', 52500.00, 'A8');
INSERT INTO employee VALUES ('E00014', 'Ivy', 'Walker', 'Teacher', 'F', '1984-07-25', '555-901-2345', '910 Elm St', '2018-05-01', 'ivy.walker@kindergarten.com', 50000.00, 'A9');
INSERT INTO employee VALUES ('E00015', 'Jack', 'Hall', 'Teacher', 'M', '1995-08-30', '555-012-3456', '101 Pine St', '2021-01-10', 'jack.hall@kindergarten.com', 49000.00, 'A10');
INSERT INTO employee VALUES ('E00016', 'Nancy', 'Green', 'Secretary', 'F', '2000-02-14', '555-234-5679', '202 Birch St', '2023-07-15', 'nancy.green@kindergarten.com', 40000.00, 'O1');
INSERT INTO employee VALUES ('E00017', 'Paul', 'Adams', 'Secretary', 'M', '1986-09-23', '555-345-6780', '303 Oak St', '2020-10-20', 'paul.adams@kindergarten.com', 42000.00, 'O1');
INSERT INTO employee VALUES ('E00018', 'Robert', 'King', 'Security Guard', 'M', '1979-03-12', '555-456-7891', '404 Maple St', '2018-11-01', 'robert.king@kindergarten.com', 38000.00, 'SR');
INSERT INTO employee VALUES ('E00019', 'Olivia', 'Scott', 'Security Guard', 'F', '1982-06-05', '555-567-8902', '505 Pine St', '2019-05-15', 'olivia.scott@kindergarten.com', 39000.00, 'SR');
INSERT INTO employee VALUES ('E00020', 'James', 'Turner', 'Security Guard', 'M', '1987-10-30', '555-678-9013', '606 Oak St', '2020-07-20', 'james.turner@kindergarten.com', 37000.00, 'SR');

INSERT INTO homeroom VALUES('S00001', 'E00006');
INSERT INTO homeroom VALUES('S00002', 'E00007');
INSERT INTO homeroom VALUES('S00003', 'E00008');
INSERT INTO homeroom VALUES('S00004', 'E00009');
INSERT INTO homeroom VALUES('S00005', 'E00010');
INSERT INTO homeroom VALUES('S00006', 'E00011');
INSERT INTO homeroom VALUES('S00007', 'E00012');
INSERT INTO homeroom VALUES('S00008', 'E00013');
INSERT INTO homeroom VALUES('S00009', 'E00014');
INSERT INTO homeroom VALUES('S00010', 'E00015');
INSERT INTO homeroom VALUES('S00011', 'E00006');
INSERT INTO homeroom VALUES('S00012', 'E00007');
INSERT INTO homeroom VALUES('S00013', 'E00008');
INSERT INTO homeroom VALUES('S00014', 'E00009');
INSERT INTO homeroom VALUES('S00015', 'E00010');
INSERT INTO homeroom VALUES('S00016', 'E00011');
INSERT INTO homeroom VALUES('S00017', 'E00012');
INSERT INTO homeroom VALUES('S00018', 'E00013');
INSERT INTO homeroom VALUES('S00019', 'E00014');
INSERT INTO homeroom VALUES('S00020', 'E00015');

INSERT INTO parent VALUES ('P00001', 'John', 'Doe', 'Father', 'john.doe@gmail.com', '940-123-4567');
INSERT INTO parent VALUES ('P00002', 'Jane', 'Smith', 'Mother', 'jane.smith@gmail.com', '940-234-5678');
INSERT INTO parent VALUES ('P00003', 'James', 'Foster', 'Father', 'james.foster@gmail.com', '940-345-6789');
INSERT INTO parent VALUES ('P00004', 'Mary', 'Johnson', 'Mother', 'mary.johnson@gmail.com', '940-456-7890');
INSERT INTO parent VALUES ('P00005', 'Michael', 'Lucas', 'Father', 'michael.lucas@gmail.com', '940-567-8901');
INSERT INTO parent VALUES ('P00006', 'Susan', 'Williams', 'Mother', 'susan.williams@gmail.com', '940-678-9012');
INSERT INTO parent VALUES ('P00007', 'William', 'Brown', 'Father', 'william.brown@gmail.com', '940-789-0123');
INSERT INTO parent VALUES ('P00008', 'Laura', 'Davis', 'Mother', 'laura.davis@gmail.com', '940-890-1234');
INSERT INTO parent VALUES ('P00009', 'Charles', 'Miller', 'Father', 'charles.miller@gmail.com', '940-901-2345');
INSERT INTO parent VALUES ('P00010', 'Nancy', 'Wilson', 'Mother', 'nancy.wilson@gmail.com', '940-012-3456');
INSERT INTO parent VALUES ('P00011', 'Robert', 'Moore', 'Father', 'robert.moore@gmail.com', '940-123-4568');
INSERT INTO parent VALUES ('P00012', 'Emily', 'Taylor', 'Mother', 'emily.taylor@gmail.com', '940-234-5679');
INSERT INTO parent VALUES ('P00013', 'David', 'Anderson', 'Father', 'david.anderson@gmail.com', '940-345-6780');
INSERT INTO parent VALUES ('P00014', 'Rachel', 'Thomas', 'Mother', 'rachel.thomas@gmail.com', '940-456-7891');
INSERT INTO parent VALUES ('P00015', 'Mark', 'Jackson', 'Father', 'mark.jackson@gmail.com', '940-567-8902');
INSERT INTO parent VALUES ('P00016', 'Linda', 'White', 'Mother', 'linda.white@gmail.com', '940-678-9013');
INSERT INTO parent VALUES ('P00017', 'May', 'Parker', 'Aunt', 'may.parker@gmail.com', '940-789-0124');
INSERT INTO parent VALUES ('P00018', 'Jane', 'Martin', 'Mother', 'jane.martin@gmail.com', '940-890-1235');
INSERT INTO parent VALUES ('P00019', 'George', 'Garcia', 'Father', 'george.garcia@gmail.com', '940-901-2346');
INSERT INTO parent VALUES ('P00020', 'Elizabeth', 'Rodriguez', 'Mother', 'elizabeth.rodriguez@gmail.com', '940-012-3457');

INSERT INTO parentstudent VALUES ('S00001','P00001');
INSERT INTO parentstudent VALUES ('S00002','P00002');
INSERT INTO parentstudent VALUES ('S00003','P00003');
INSERT INTO parentstudent VALUES ('S00004','P00004');
INSERT INTO parentstudent VALUES ('S00005','P00005');
INSERT INTO parentstudent VALUES ('S00006','P00006');
INSERT INTO parentstudent VALUES ('S00007','P00007');
INSERT INTO parentstudent VALUES ('S00008','P00008');
INSERT INTO parentstudent VALUES ('S00009','P00009');
INSERT INTO parentstudent VALUES ('S00010','P00010');
INSERT INTO parentstudent VALUES ('S00011','P00011');
INSERT INTO parentstudent VALUES ('S00012','P00012');
INSERT INTO parentstudent VALUES ('S00013','P00013');
INSERT INTO parentstudent VALUES ('S00014','P00014');
INSERT INTO parentstudent VALUES ('S00015','P00015');
INSERT INTO parentstudent VALUES ('S00016','P00016');
INSERT INTO parentstudent VALUES ('S00017','P00017');
INSERT INTO parentstudent VALUES ('S00018','P00018');
INSERT INTO parentstudent VALUES ('S00019','P00019');
INSERT INTO parentstudent VALUES ('S00020','P00020');

INSERT INTO vaccine VALUES ('V00020', 'COVID-19', 'Vaccine for COVID-19.');
INSERT INTO vaccine VALUES ('V00001', 'Measles', 'Vaccine for measles.');
INSERT INTO vaccine VALUES ('V00002', 'Mumps', 'Vaccine for mumps.');
INSERT INTO vaccine VALUES ('V00003', 'Rubella', 'Vaccine for rubella.');
INSERT INTO vaccine VALUES ('V00004', 'Hepatitis A', 'Vaccine for hepatitis A.');
INSERT INTO vaccine VALUES ('V00005', 'Hepatitis B', 'Vaccine for hepatitis B.');
INSERT INTO vaccine VALUES ('V00006', 'Polio', 'Vaccine for polio.');
INSERT INTO vaccine VALUES ('V00007', 'Tetanus', 'Vaccine for tetanus.');
INSERT INTO vaccine VALUES ('V00008', 'Diphtheria', 'Vaccine for diphtheria.');
INSERT INTO vaccine VALUES ('V00009', 'Pertussis', 'Vaccine for whooping cough.');
INSERT INTO vaccine VALUES ('V00010', 'Influenza', 'Annual flu vaccine.');
INSERT INTO vaccine VALUES ('V00011', 'Varicella', 'Vaccine for chickenpox.');
INSERT INTO vaccine VALUES ('V00012', 'Pneumococcal', 'Vaccine for pneumococcal disease.');
INSERT INTO vaccine VALUES ('V00013', 'Meningococcal', 'Vaccine for meningococcal disease.');
INSERT INTO vaccine VALUES ('V00014', 'Human Papillomavirus', 'Vaccine for HPV.');
INSERT INTO vaccine VALUES ('V00015', 'Rotavirus', 'Vaccine for rotavirus.');
INSERT INTO vaccine VALUES ('V00016', 'Hib', 'Vaccine for Haemophilus influenzae B.');
INSERT INTO vaccine VALUES ('V00017', 'Hepatitis C', 'Experimental vaccine for hepatitis C.');
INSERT INTO vaccine VALUES ('V00018', 'Tuberculosis', 'Vaccine for tuberculosis.');
INSERT INTO vaccine VALUES ('V00019', 'Shingles', 'Vaccine for shingles.');

INSERT INTO studentvaccines VALUES ('S00001', 'V00001');
INSERT INTO studentvaccines VALUES ('S00001', 'V00002');
INSERT INTO studentvaccines VALUES ('S00002', 'V00003');
INSERT INTO studentvaccines VALUES ('S00002', 'V00004');
INSERT INTO studentvaccines VALUES ('S00003', 'V00005');
INSERT INTO studentvaccines VALUES ('S00003', 'V00006');
INSERT INTO studentvaccines VALUES ('S00004', 'V00007');
INSERT INTO studentvaccines VALUES ('S00004', 'V00008');
INSERT INTO studentvaccines VALUES ('S00005', 'V00009');
INSERT INTO studentvaccines VALUES ('S00005', 'V00010');
INSERT INTO studentvaccines VALUES ('S00006', 'V00011');
INSERT INTO studentvaccines VALUES ('S00006', 'V00012');
INSERT INTO studentvaccines VALUES ('S00007', 'V00013');
INSERT INTO studentvaccines VALUES ('S00007', 'V00014');
INSERT INTO studentvaccines VALUES ('S00008', 'V00015');
INSERT INTO studentvaccines VALUES ('S00008', 'V00016');
INSERT INTO studentvaccines VALUES ('S00009', 'V00017');
INSERT INTO studentvaccines VALUES ('S00009', 'V00018');
INSERT INTO studentvaccines VALUES ('S00012', 'V00003');
INSERT INTO studentvaccines VALUES ('S00012', 'V00004');
INSERT INTO studentvaccines VALUES ('S00014', 'V00007');
INSERT INTO studentvaccines VALUES ('S00014', 'V00008');
INSERT INTO studentvaccines VALUES ('S00016', 'V00011');
INSERT INTO studentvaccines VALUES ('S00016', 'V00012');
INSERT INTO studentvaccines VALUES ('S00017', 'V00013');
INSERT INTO studentvaccines VALUES ('S00017', 'V00014');
INSERT INTO studentvaccines VALUES ('S00018', 'V00015');
INSERT INTO studentvaccines VALUES ('S00018', 'V00016');
INSERT INTO studentvaccines VALUES ('S00019', 'V00017');
INSERT INTO studentvaccines VALUES ('S00019', 'V00018');
INSERT INTO studentvaccines VALUES ('S00020', 'V00019');
INSERT INTO studentvaccines VALUES ('S00020', 'V00020');

INSERT INTO medicalcondition VALUES ('C00001', 'Asthma', 'A condition causing breathing difficulties.');
INSERT INTO medicalcondition VALUES ('C00002', 'Allergy', 'Reaction to allergens like pollen or peanuts.');
INSERT INTO medicalcondition VALUES ('C00003', 'Diabetes', 'A condition where blood sugar levels are too high.');
INSERT INTO medicalcondition VALUES ('C00004', 'Eczema', 'A skin condition causing itching and redness.');
INSERT INTO medicalcondition VALUES ('C00005', 'Chickenpox', 'A contagious disease causing an itchy rash.');
INSERT INTO medicalcondition VALUES ('C00006', 'Bronchitis', 'Inflammation of the bronchial tubes.');
INSERT INTO medicalcondition VALUES ('C00007', 'Conjunctivitis', 'Inflammation of the eye’s outer membrane.');
INSERT INTO medicalcondition VALUES ('C00008', 'Pink Eye', 'Another term for conjunctivitis.');
INSERT INTO medicalcondition VALUES ('C00009', 'Impetigo', 'A bacterial skin infection.');
INSERT INTO medicalcondition VALUES ('C00010', 'Head Lice', 'Infestation of the scalp with lice.');
INSERT INTO medicalcondition VALUES ('C00011', 'Worms', 'Intestinal parasitic infections.');
INSERT INTO medicalcondition VALUES ('C00012', 'Sinusitis', 'Inflammation of the sinuses.');
INSERT INTO medicalcondition VALUES ('C00013', 'Croup', 'A respiratory condition causing a barking cough.');
INSERT INTO medicalcondition VALUES ('C00014', 'Scarlet Fever', 'A bacterial illness causing a red rash.');
INSERT INTO medicalcondition VALUES ('C00015', 'Fever', 'Elevated body temperature.');
INSERT INTO medicalcondition VALUES ('C00016', 'Gastroenteritis', 'Inflammation of the stomach and intestines.');
INSERT INTO medicalcondition VALUES ('C00017', 'Sore Throat', 'Pain in the throat area.');
INSERT INTO medicalcondition VALUES ('C00018', 'Ear Infection', 'Infection of the ear.');
INSERT INTO medicalcondition VALUES ('C00019', 'Headache', 'Pain in the head or upper neck.');
INSERT INTO medicalcondition VALUES ('C00020', 'Sleep Apnea', 'A condition where breathing stops and starts during sleep.');

INSERT INTO studentconditions VALUES ('S00001', 'C00001');
INSERT INTO studentconditions VALUES ('S00001', 'C00002');
INSERT INTO studentconditions VALUES ('S00002', 'C00003');
INSERT INTO studentconditions VALUES ('S00002', 'C00004');
INSERT INTO studentconditions VALUES ('S00003', 'C00005');
INSERT INTO studentconditions VALUES ('S00003', 'C00006');
INSERT INTO studentconditions VALUES ('S00004', 'C00007');
INSERT INTO studentconditions VALUES ('S00004', 'C00008');
INSERT INTO studentconditions VALUES ('S00005', 'C00009');
INSERT INTO studentconditions VALUES ('S00005', 'C00010');
INSERT INTO studentconditions VALUES ('S00006', 'C00011');
INSERT INTO studentconditions VALUES ('S00006', 'C00012');
INSERT INTO studentconditions VALUES ('S00007', 'C00013');
INSERT INTO studentconditions VALUES ('S00007', 'C00014');
INSERT INTO studentconditions VALUES ('S00008', 'C00015');
INSERT INTO studentconditions VALUES ('S00008', 'C00016');
INSERT INTO studentconditions VALUES ('S00009', 'C00017');
INSERT INTO studentconditions VALUES ('S00009', 'C00018');
INSERT INTO studentconditions VALUES ('S00010', 'C00019');
INSERT INTO studentconditions VALUES ('S00010', 'C00020');
INSERT INTO studentconditions VALUES ('S00011', 'C00001');
INSERT INTO studentconditions VALUES ('S00011', 'C00002');
INSERT INTO studentconditions VALUES ('S00012', 'C00003');
INSERT INTO studentconditions VALUES ('S00012', 'C00004');
INSERT INTO studentconditions VALUES ('S00013', 'C00005');
INSERT INTO studentconditions VALUES ('S00013', 'C00006');
INSERT INTO studentconditions VALUES ('S00014', 'C00007');
INSERT INTO studentconditions VALUES ('S00014', 'C00008');
INSERT INTO studentconditions VALUES ('S00015', 'C00009');
INSERT INTO studentconditions VALUES ('S00015', 'C00010');
INSERT INTO studentconditions VALUES ('S00016', 'C00011');
INSERT INTO studentconditions VALUES ('S00016', 'C00012');
INSERT INTO studentconditions VALUES ('S00017', 'C00013');
INSERT INTO studentconditions VALUES ('S00017', 'C00014');
INSERT INTO studentconditions VALUES ('S00018', 'C00015');
INSERT INTO studentconditions VALUES ('S00018', 'C00016');
INSERT INTO studentconditions VALUES ('S00019', 'C00017');
INSERT INTO studentconditions VALUES ('S00019', 'C00018');
INSERT INTO studentconditions VALUES ('S00020', 'C00019');
INSERT INTO studentconditions VALUES ('S00020', 'C00020');

INSERT INTO inventory VALUES ('E00001', 100.00, '01');
INSERT INTO inventory VALUES ('E00002', 150.00, '01');
INSERT INTO inventory VALUES ('E00003', 200.00, '01');
INSERT INTO inventory VALUES ('E00004', 250.00, 'SR');
INSERT INTO inventory VALUES ('E00005', 175.00, 'SR');
INSERT INTO inventory VALUES ('E00006', 130.00, 'SR');
INSERT INTO inventory VALUES ('E00007', 90.00, 'NR');
INSERT INTO inventory VALUES ('E00008', 160.00, 'NR');
INSERT INTO inventory VALUES ('E00009', 110.00, 'NR');
INSERT INTO inventory VALUES ('E00010', 180.00, 'A1');
INSERT INTO inventory VALUES ('E00011', 155.00, 'A2');
INSERT INTO inventory VALUES ('E00012', 140.00, 'A3');
INSERT INTO inventory VALUES ('E00013', 210.00, 'A4');
INSERT INTO inventory VALUES ('E00014', 145.00, 'A5');
INSERT INTO inventory VALUES ('E00015', 125.00, 'A6');
INSERT INTO inventory VALUES ('E00016', 195.00, 'A7');
INSERT INTO inventory VALUES ('E00017', 165.00, 'A8');
INSERT INTO inventory VALUES ('E00018', 220.00, 'A9');
INSERT INTO inventory VALUES ('E00019', 140.00, 'A10');
INSERT INTO inventory VALUES ('E00020', 110.00, 'A10');

INSERT INTO financial VALUES ('T00001', 150.00, '2024-01-10', 'Purchase of classroom supplies');
INSERT INTO financial VALUES ('T00002', 80.00, '2024-01-15', 'Payment for educational software');
INSERT INTO financial VALUES ('T00003', 200.00, '2024-01-20', 'Annual maintenance fee');
INSERT INTO financial VALUES ('T00004', 95.00, '2024-02-05', 'Books for library');
INSERT INTO financial VALUES ('T00005', 60.00, '2024-02-10', 'Art supplies');
INSERT INTO financial VALUES ('T00006', 120.00, '2024-02-15', 'New playground equipment');
INSERT INTO financial VALUES ('T00007', 50.00, '2024-03-01', 'Office stationery');
INSERT INTO financial VALUES ('T00008', 175.00, '2024-03-10', 'Repairs to classroom furniture');
INSERT INTO financial VALUES ('T00009', 250.00, '2024-03-20', 'Subscription to educational journals');
INSERT INTO financial VALUES ('T00010', 85.00, '2024-04-01', 'Replacement of broken windows');
INSERT INTO financial VALUES ('T00011', 140.00, '2024-04-05', 'Cleaning supplies for classrooms');
INSERT INTO financial VALUES ('T00012', 90.00, '2024-04-15', 'Purchase of teaching aids');
INSERT INTO financial VALUES ('T00013', 70.00, '2024-05-01', 'New classroom chairs');
INSERT INTO financial VALUES ('T00014', 100.00, '2024-05-10', 'Outdoor play equipment');
INSERT INTO financial VALUES ('T00015', 130.00, '2024-05-20', 'Computer software for students');
INSERT INTO financial VALUES ('T00016', 60.00, '2024-06-01', 'Office supplies');
INSERT INTO financial VALUES ('T00017', 180.00, '2024-06-10', 'Installation of new whiteboards');
INSERT INTO financial VALUES ('T00018', 75.00, '2024-06-15', 'Educational games for classrooms');
INSERT INTO financial VALUES ('T00019', 110.00, '2024-07-01', 'Annual library subscription');
INSERT INTO financial VALUES ('T00020', 160.00, '2024-07-15', 'New classroom desks');

INSERT INTO transactions VALUES ('E00001', 'T00001');
INSERT INTO transactions VALUES ('E00001', 'T00002');
INSERT INTO transactions VALUES ('E00002', 'T00003');
INSERT INTO transactions VALUES ('E00003', 'T00004');
INSERT INTO transactions VALUES ('E00003', 'T00005');
INSERT INTO transactions VALUES ('E00004', 'T00006');
INSERT INTO transactions VALUES ('E00004', 'T00007');
INSERT INTO transactions VALUES ('E00005', 'T00008');
INSERT INTO transactions VALUES ('E00005', 'T00009');
INSERT INTO transactions VALUES ('E00006', 'T00010');
INSERT INTO transactions VALUES ('E00006', 'T00011');
INSERT INTO transactions VALUES ('E00007', 'T00012');
INSERT INTO transactions VALUES ('E00008', 'T00013');
INSERT INTO transactions VALUES ('E00008', 'T00014');
INSERT INTO transactions VALUES ('E00009', 'T00015');
INSERT INTO transactions VALUES ('E00009', 'T00016');
INSERT INTO transactions VALUES ('E00010', 'T00017');
INSERT INTO transactions VALUES ('E00010', 'T00018');
INSERT INTO transactions VALUES ('E00011', 'T00019');
INSERT INTO transactions VALUES ('E00011', 'T00020');


-- Simple select query --
SELECT fname, lname, dob, gender, address, enrollmentdate, studentid
FROM student
ORDER BY fName;

-- medium aggreagate query -- 
SELECT e.fname, e.lname, e.gender, e.dob, e.salary
FROM employee e
WHERE e.employeeposition = 'Teacher'
AND e.salary > (SELECT AVG(salary) FROM employee)
ORDER BY e.dob, e.gender;

SELECT Distinct transactiondesc, SUM(transactionamount) AS total_amount,
 AVG(transactionamount) AS average_amount
FROM financial
GROUP BY transactiondesc;

-- subquery --
SELECT studentid, fname, lname
FROM student
WHERE studentid 
IN (
	SELECT studentid
    FROM studentconditions
    WHERE conditionid = 'C00001'
);

-- join query --
SELECT s.studentid, s.fname AS student_first_name, s.lname AS student_last_name,
 t.fname as teacher_first_name, t.lname as teacher_last_name
FROM student s, employee t, homeroom h
WHERE h.studentid = s.studentid AND t.employeeid = h.teacherid;

-- left join -- 

SELECT s.studentid, s.fname AS student_first_name, s.lname AS student_last_name, 
       v.vaccineid, v.vaccinename, v.vaccinedesc
FROM student s
LEFT JOIN studentvaccines sv ON s.studentid = sv.studentid
LEFT JOIN vaccine v ON sv.vaccineid = v.vaccineid;

-- view --
CREATE VIEW student_teacher_info_view AS
SELECT s.studentid, s.fname AS student_first_name, s.lname AS student_last_name,
 t.fname as teacher_first_name, t.lname as teacher_last_name
FROM student s, employee t, homeroom h
WHERE h.studentid = s.studentid AND t.employeeid = h.teacherid;

SELECT * from student_teacher_info_view;


-- Custom Function --
DELIMITER //
CREATE FUNCTION age_from_dob(dob DATE)
RETURNS INT 
DETERMINISTIC
BEGIN

DECLARE age INT; 

SET age = TIMESTAMPDIFF(YEAR, dob, CURDATE());

RETURN age;

END//
DELIMITER ;

SELECT studentid, lname, fname, age_from_dob(dob) as age
FROM student;

-- union -- 
SELECT parentid, phonenumber, email
FROM parent
UNION
SELECT employeeid, phonenumber, email
from employee;


DELIMITER //

CREATE PROCEDURE add_student_and_parent(
    IN student_id CHAR(6),
    IN student_fname VARCHAR(25),
    IN student_lname VARCHAR(25),
    IN student_dob DATE,
    IN student_gender CHAR(1),
    IN student_address VARCHAR(40),
    IN student_enrollmentdate DATE,
    IN parent_id CHAR(6),
    IN parent_fname VARCHAR(25),
    IN parent_lname VARCHAR(25),
    IN parent_relation VARCHAR(20),
    IN parent_email VARCHAR(100),
    IN parent_phonenumber CHAR(12)
)
BEGIN
    START TRANSACTION;

    INSERT INTO student (studentid, fname, lname, dob, gender, address, enrollmentdate)
    VALUES (student_id, student_fname, student_lname, student_dob, student_gender,
    student_address, student_enrollmentdate);

    INSERT INTO parent (parentid, fname, lname, relationtostudent, email, phonenumber)
    VALUES (parent_id, parent_fname, parent_lname, parent_relation, parent_email, parent_phonenumber);

    INSERT INTO parentstudent (studentid, parentid)
    VALUES (student_id, parent_id);

    COMMIT;
END //

DELIMITER ;

CALL add_student_and_parent('S00030', 'Lionel', 'Messi', '2018-07-20', 'M', '213 Goat St',
 '2023-09-02','P00030','Jorge', 'Messi', 'Father', 'jorge.messi@gmail.com','940-631-9451');

SELECT * 
From student s, parent p, parentstudent ps
WHERE ps.studentid = s.studentid AND p.parentid = ps.parentid;




