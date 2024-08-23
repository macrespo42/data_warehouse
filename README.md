# Data Warehouse
## Module 01 of the piscine datascience

Make my first data Warehouse based on database created in [module 00: data engineer](https://github.com/macrespo42/data_engineer)

### Quick Start

run ``docker compose up --build`` to run the services needed to use this project

Then you can connect to the db service: ``docker compose exec -it db bash``

and initialise the database with db script : ``/opt/initdb.sh``

An adminer is also available at [localhost:8080](http://localhost:8080)

To run an exercice simply connect to psql shell (``psql -U macrespo -d piscineds -h localhost -W``)  
and then you can run a specific exercice like this ``\i /opt/ex$(number of the exercice)/name_of_the_script.sql``

### Ex00

It consist at installing adminer or other db visualisation to your db service.  
You can access it at [localhost:8080](http://localhost:8080)

### Ex01

In this exercice we have to take all the table data_20**_***.csv and merge them in a customers table
To run this exercice just execute the SQL script located ``/opt/ex01/customers_table.sql`` inside db container 

### Ex02

For this one we have to deduplicate all data in customers including the fact that the server as sometimes send 2 times  
the same record but with an ~1-59 seconds offset.  

To run this exercice just execute the SQL script located ``/opt/ex02/remove_duplicates.sql`` inside db container 

### Ex03

The last one ! This time we have to: combine the "customers" tables with "items" in the "customers" table  

Like the 2 previous exercice you can run a script who are this time located at : ``/opt/ex03/fusion.sql``
