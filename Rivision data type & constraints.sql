create table employees( 
emp_id serial primary key,
emp_name varchar (60) not null ,
department varchar (50)not null ,
salary decimal (10,2)check (salary >=15000) ,
email varchar (50) unique not null, 
joining_date date default now() 
); 

insert into employees (emp_name, department , salary , email)
values
('Riya', 'data seience', 50000.00, 'rm1234@gmail.com'),
('priya', 'it', 20000.00, 'pm1234@gmail.com'),
('prashant', 'data seience', 50000.00, 'pt143@gmail.com'),
('anurag', 'data seience', 40000.00, 'mishra123@gmail.com'),
('ishu', 'data seience', 100000.00, 'pandey134@gmail.com'),
('Riya mishra', 'it', 40000.00, 'rm12345@gmail.com');

select * from employees ;

update employees
set salary = 40000.00 where emp_name='ishu' 

select * from employees ;

delete from employees
where emp_name = 'anurag' ;

select * from employees ;
