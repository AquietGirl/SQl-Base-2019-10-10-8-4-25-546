CREATE TABLE student
(
	id VARCHAR(3) NOT NULL PRIMARY KEY,
	name VARCHAR(64) NOT NULL, 
	age INT NOT NULL,
	sex VARCHAR(10) NOT NULL
);
INSERT INTO student VALUES ('001', 'zhangsan', 18, 'male');
INSERT INTO student VALUES ('002', 'lisi', 20, 'female');


CREATE TABLE subject
(
	id VARCHAR(4) NOT NULL PRIMARY KEY,
	subject VARCHAR(10) NOT NULL, 
	teacher VARCHAR(10) NOT NULL,
	description VARCHAR(255)
);
INSERT INTO subject VALUES('1001', 'Chinese', 'Mr.Wang', 'the exam is easy');
INSERT INTO subject VALUES('1002', 'math', 'Miss liu', 'the exam is difficult');


CREATE TABLE score
(
	id INT NOT NULL PRIMARY KEY,
	student_id VARCHAR(3) NOT NULL,
	subject_id VARCHAR(4) NOT NULL,
	score NUMBER(5,2)
);
-- id自增
CREATE SEQUENCE SEQ_score_Identity
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE 
NOCACHE;
CREATE OR REPLACE TRIGGER TG_score_Identity
BEFORE INSERT ON score
FOR EACH ROW WHEN(NEW.ID is null)
BEGIN
:NEW.ID := SEQ_score_Identity.nextval;
end;
INSERT INTO score VALUES(null, '001', '1001', 80);
INSERT INTO score VALUES(null, '002', '1002', 60);
INSERT INTO score VALUES(null, '001', '1001', 70);
INSERT INTO score VALUES(null, '002', '1002', 60.5);
