
# SQL Project Employee Database

![sql.png](images/sql.png)

## Overview

This is a research project on employees of the corporation from 1985 and 2000. All that remain of the database of employees from that period are six CSV files.

In this project, I created the tables (6) to hold data in the CSVs, import the CSVs data SQL/data into a SQL database, and answer questions about the data. In other words, I performed:

1. Data Modeling

2. Data Engineering

3. Data Analysis

#### Data Modeling

Inspected the CSVs and create the ERD and using a tool at [http://www.quickdatabasediagrams.com](http://www.quickdatabasediagrams.com).

 ![](images/ERD.png)

#### Data Engineering

* I used the information to create a schema for each of the six CSV files with data types, primary keys, foreign keys, and other constraints.
* Then I imported each CSV file into the corresponding SQL tables. I had to import the CVS files as in the order below. 
  * departments
  * titles
  * employees
  * dept_manager
  * dept_emp
  * salaries

#### Data Analysis

I completed the database as following: 

1. List for each employee: employee number, last name, first name, sex, and salary.

2. List first name, last name, and hire date for employees who were hired in 1986.

3. List the manager of each department with the following: department number, department name, the manager's employee number, last name, first name.

4. List the department of each employee with the following: employee number, last name, first name, and department name.

5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

6. List all employees in sales department with their employee number, last name, first name, and department name information.

7. List all employees in the sales and development departments with their employee number, last name, first name, and department name information.

8. For descending, list the frequency count of employee last names, i.e., how many employees share each last name.


### Bonus 

1. Imported the SQL database into Pandas using the code below: 

   ```sql
   from sqlalchemy import create_engine
   URI = f"postgresql://postgres:{password}@localhost:5433/Employees"
   engine = create_engine(URI)
   ```


2. Joined the employees and salaries based on employee number and joined titles tables based on title id. I turned it to the Dataframe and group them by title. 

3. Created a bar chart of average salary by title. Title staff earns more than other title. 

 ![](images/averagesalary.png)

4. Create a histogram to visualize the most common salary ranges for employees based on the title. More staff earns around $40k, while salay is increasing, staff number is decreasing.

 ![](images/Salaryrange.png)


