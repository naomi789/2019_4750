# 2019_4750
Created by students at the University of Virginia for CS 4750 over the summer of 2019.

## Data sources:

Dictionary from Jim Breen's JMdict-EDICT Dictionary Project; the files are owned by the the Electronic Dictionary Research and Development Group at Monash University in Australia but are made available for both commercial and non-commercial use if done with adequate and appropriate acknowledgement:

https://www.edrdg.org/wiki/index.php/JMdict-EDICT_Dictionary_Project

Original vocabulary lists are subsets from Peter van der Woude's lists for the JLPT N5, N4, and N2:

https://jlptstudy.net

## Set up:

Install node, npm, and clone the repo.

You'll also need:
```
npm install express
npm install express-fileupload
npm install body-parser
npm install mysql
npm install ejs
```

## Steps for getting database set up locally and adding all dictionary data:

In MySQL Workbench, 

1) Run script.sql to create database, tables, columns, and to change unicode format
	(location: root of repo)

2) Run insert_commands_1.sql, insert_commands_2.sql, insert_commands_3.sql, and insert_commands_4.sql to insert jmdict records
	(location: /input_parsing)

3) Run n2_peter_create.sql, n4_peter_create.sql, and n5_peter_create.sql 
	(location: input_parsing)