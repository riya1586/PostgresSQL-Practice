create table students(
students_name char(30),
student_age int,
city char (50)
);

insert into students (students_name,student_age,city)
values('riya',18,'noida'),
('prashant', 19 ,'rajkot'),
('srishti', 12 ,'maskanwa'),
('chotu', 10 ,'ganrahi');

select * from students ;

update students
set students_name ='anurag'
where city = 'ganrahi'; 

select * from students ;

select students_name,city from students ; 

select student_age from students
where student_age < 18  ;

select students_name from students
where city = 'rajkot' ;

select students_name from students
where student_age < 18 and city = 'noida' ;

delete from students where students_name = 'anurag' ;


