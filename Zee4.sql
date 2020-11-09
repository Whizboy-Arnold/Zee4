# CREATING SCHEMA, POPULATING, TESTING THEN USING IN QUERY IN QUESTION 2

CREATE SCHEMA `education` ;

use education; 

CREATE TABLE `education`.`institution` (
  `institutionid` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(250) NOT NULL,
  PRIMARY KEY (`institutionid`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE);
  
  CREATE TABLE `education`.`course` (
  `courseid` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `institution` INT NULL,
  PRIMARY KEY (`courseid`),
  INDEX `inst_idx` (`institution` ASC) VISIBLE,
  CONSTRAINT `inst`
    FOREIGN KEY (`institution`)
    REFERENCES `education`.`institution` (`institutionid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

CREATE TABLE `education`.`student` (
  `studentid` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `course` INT NULL,
  PRIMARY KEY (`studentid`),
  INDEX `crs_idx` (`course` ASC) VISIBLE,
  CONSTRAINT `crs`
    FOREIGN KEY (`course`)
    REFERENCES `education`.`course` (`courseid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



INSERT INTO `education`.`institution` (`name`) VALUES ('Kenyatta University');
INSERT INTO `education`.`institution` (`name`) VALUES ('Nairobi university');
INSERT INTO `education`.`institution` (`name`) VALUES ('Moi University');


INSERT INTO `education`.`course` (`name`, `institution`) VALUES ('Bsc. Acturual Science', '2');
INSERT INTO `education`.`course` (`name`, `institution`) VALUES ('Bsc. Acturual Science', '3');
INSERT INTO `education`.`course` (`name`, `institution`) VALUES ('Bsc. Education', '2');
INSERT INTO `education`.`course` (`name`, `institution`) VALUES ('Mphil Genomics', '1');
INSERT INTO `education`.`course` (`name`, `institution`) VALUES ('Bsc. Computer Science', '3');
INSERT INTO `education`.`course` (`name`, `institution`) VALUES ('Bsc. Computer Science', '2');



INSERT INTO `education`.`student` (`name`, `course`) VALUES ('warren arnold', '3');
INSERT INTO `education`.`student` (`name`, `course`) VALUES ('james ochuodho', '1');
INSERT INTO `education`.`student` (`name`, `course`) VALUES ('bidan kimani', '2');
INSERT INTO `education`.`student` (`name`, `course`) VALUES ('tirgei kiptirgei', '1');
INSERT INTO `education`.`student` (`name`, `course`) VALUES ('david mutinda', '2');
INSERT INTO `education`.`student` (`name`, `course`) VALUES ('gracie wanjiru', '3');
INSERT INTO `education`.`student` (`name`, `course`) VALUES ('oscar mpendwa', '1');
INSERT INTO `education`.`student` (`name`, `course`) VALUES ('natalie masumbuko', '3');
INSERT INTO `education`.`student` (`name`, `course`) VALUES ('oliech olunga', '1');
INSERT INTO `education`.`student` (`name`, `course`) VALUES ('oscar wanjie', '3');
INSERT INTO `education`.`student` (`name`, `course`) VALUES ('peterson zeraki', '3');
INSERT INTO `education`.`student` (`name`, `course`) VALUES ('kimani wa thiongo', '1');
UPDATE `education`.`student` SET `course` = '5' WHERE (`studentid` = '6');
UPDATE `education`.`student` SET `course` = '5' WHERE (`studentid` = '3');
UPDATE `education`.`student` SET `course` = '6' WHERE (`studentid` = '11');
UPDATE `education`.`student` SET `course` = '7' WHERE (`studentid` = '7');
UPDATE `education`.`student` SET `course` = '4' WHERE (`studentid` = '1');
UPDATE `education`.`student` SET `course` = '7' WHERE (`studentid` = '4');
UPDATE `education`.`student` SET `course` = '4' WHERE (`studentid` = '9');
INSERT INTO `education`.`student` (`name`, `course`) VALUES ('ngige kamau otieno', '1');
INSERT INTO `education`.`student` (`name`, `course`) VALUES ('uhuru kenyatta', '1');
INSERT INTO `education`.`student` (`name`, `course`) VALUES ('raila odinga', '1');
INSERT INTO `education`.`student` (`name`, `course`) VALUES ('ruto william', '2');
INSERT INTO `education`.`student` (`name`, `course`) VALUES ('james karanja', '2');

select `name`, count(institution) as `number of students` from  course  group by name;
select * from course ;
select * from student ;


select * from student right outer join course on student.course=course.courseid;
select *  from student inner join course on student.course=course.courseid group by courseid ; 
select *  from student inner join course on student.course=course.courseid  ; 
  
#SELECTING IN THE FORMAT NEEDED
select institution.name as `INSTITUTION NAME`, count(studentid) as `NUMBER OF STUDENTS`, course.name as `COURSE NAME` from institution inner join  course on course.institution=institution.institutionid  inner join student on student.course=course.courseid group by courseid;
 
  