CREATE TABLE "departments" (
    "dept_no" VARCHAR(4)   NOT NULL,
    "dept_name" VARCHAR(200)   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "titles" (
    "title_id" VARCHAR(5)   NOT NULL,
    "title" VARCHAR(200)   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE "employees" (
    "emp_no" INT   NOT NULL,
    "emp_title_id" VARCHAR(5)   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR(100)   NOT NULL,
    "last_name" VARCHAR(100)   NOT NULL,
    "sex" VARCHAR(1)   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     ),
    CONSTRAINT "fk_employees_emp_title_id" FOREIGN KEY("emp_title_id")
    REFERENCES "titles" ("title_id")
);

CREATE TABLE "dept_emp" (
    "emp_no" INT   NOT NULL,
    "dept_no" VARCHAR(4)   NOT NULL,
    CONSTRAINT "pk_dept_emp" PRIMARY KEY (
        "emp_no",
        "dept_no"
     ),
    CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
    REFERENCES "employees" ("emp_no"),
    CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
    REFERENCES "departments" ("dept_no")
);

CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR(4)   NOT NULL,
    "emp_no" INT   NOT NULL,
    CONSTRAINT "pk_dept_manager" PRIMARY KEY (
        "dept_no",
        "emp_no"
     ),
    CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
    REFERENCES "departments" ("dept_no"),
    CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
    REFERENCES "employees" ("emp_no")
);

CREATE TABLE "salaries" (
    "emp_no" INT   NOT NULL,
    "salary" INT   NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "emp_no",
        "salary"
     ),
    CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
    REFERENCES "employees" ("emp_no")
);

COPY departments ("dept_no", "dept_name") FROM 'C:\\Users\\stick\\Downloads\\Data Science Certification Program\\module (9) - SQL\\for_github\\SQL---Module-9-\\EmployeeSQL\\data\\departments.csv' WITH CSV HEADER;

COPY titles ("title_id", "title") FROM 'C:\\Users\\stick\\Downloads\\Data Science Certification Program\\module (9) - SQL\\for_github\\SQL---Module-9-\\EmployeeSQL\\data\\titles.csv' WITH CSV HEADER;

COPY employees ("emp_no", "emp_title_id", "birth_date", "first_name", "last_name", "sex", "hire_date") FROM 'C:\\Users\\stick\\Downloads\\Data Science Certification Program\\module (9) - SQL\\for_github\\SQL---Module-9-\\EmployeeSQL\\data\\employees.csv' WITH CSV HEADER;

COPY dept_emp ("emp_no", "dept_no") FROM 'C:\\Users\\stick\\Downloads\\Data Science Certification Program\\module (9) - SQL\\for_github\\SQL---Module-9-\\EmployeeSQL\\data\\dept_emp.csv' WITH CSV HEADER;

COPY dept_manager ("dept_no", "emp_no") FROM 'C:\\Users\\stick\\Downloads\\Data Science Certification Program\\module (9) - SQL\\for_github\\SQL---Module-9-\\EmployeeSQL\\data\\dept_manager.csv' WITH CSV HEADER;

COPY salaries ("emp_no", "salary") FROM 'C:\\Users\\stick\\Downloads\\Data Science Certification Program\\module (9) - SQL\\for_github\\SQL---Module-9-\\EmployeeSQL\\data\\salaries.csv' WITH CSV HEADER;
