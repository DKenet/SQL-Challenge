CREATE TABLE public."Departments" (
    dept_no character varying(255) NOT NULL,
    dept_name character varying(255) NOT NULL,
	CONSTRAINT "pk_Departments" PRIMARY KEY (dept_no)
);


CREATE TABLE public."Dept_emp" (
    emp_no integer NOT NULL,
    dept_no character varying(255) NOT NULL,
	CONSTRAINT "pk_Dept_emp" PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE public."Dept_manager" (
    dept_no character varying(255) NOT NULL,
    emp_no integer NOT NULL,
	CONSTRAINT "pk_Dept_manager" PRIMARY KEY (dept_no, emp_no)
);

CREATE TABLE public."Employees" (
    emp_no integer NOT NULL,
    emp_title_id character varying(255) NOT NULL,
    birth_date date NOT NULL,
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    sex character varying(255) NOT NULL,
    hire_date date NOT NULL,
	CONSTRAINT "pk_Employees" PRIMARY KEY (emp_no)
);


CREATE TABLE public."Salaries" (
    emp_no integer NOT NULL,
    salary integer NOT NULL,
	CONSTRAINT "pk_Salaries" PRIMARY KEY (emp_no)
);


CREATE TABLE public."Titles" (
    title_id character varying(255) NOT NULL,
    title character varying(255) NOT NULL,
	CONSTRAINT "pk_Titles" PRIMARY KEY (title_id)
);

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Employees" ADD CONSTRAINT "fk_employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "Titles" ("title_id");

ALTER TABLE "Dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "Dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

COPY "Employees" FROM 'C:\Program Files\PostgreSQL\14\employees.csv' DELIMITER ',' CSV HEADER;
COPY "Dept_manager" FROM 'C:\Program Files\PostgreSQL\14\dept_manager.csv' DELIMITER ',' CSV HEADER;
COPY "Dept_emp" FROM 'C:\Program Files\PostgreSQL\14\dept_emp.csv' DELIMITER ',' CSV HEADER;
COPY "Titles" FROM 'C:\Program Files\PostgreSQL\14\titles.csv' DELIMITER ',' CSV HEADER;
COPY "Departments" FROM 'C:\Program Files\PostgreSQL\14\departments.csv' DELIMITER ',' CSV HEADER;
COPY "Salaries" FROM 'C:\Program Files\PostgreSQL\14\salaries.csv' DELIMITER ',' CSV HEADER;
