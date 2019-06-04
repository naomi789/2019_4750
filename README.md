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

2) Run all_jmdict_insert_commands.sql to insert jmdict records
	(location: input_parsing/)
	NOTE: If file is too large for your computer to handle, use jmdict_inserts_part1.sql and jmdict_inserts_part2.sql (location: input_parsing/). If these are still too large, you may need to divide them up into smaller files, making sure to run them in their natural order.

3) Run n2_peter_create.sql, n4_peter_create.sql, and n5_peter_create.sql
	(location: input_parsing/)

## How we set up the server
We found the following tutorials helpful:

https://hackernoon.com/tutorial-creating-and-managing-a-node-js-server-on-aws-part-1-d67367ac5171

https://www.linode.com/docs/databases/mysql/install-mysql-on-ubuntu-14-04/

https://computingforgeeks.com/linux-tmux-cheat-sheet/

```
CREATE USER 'data'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON * . * TO 'data'@'localhost';
ALTER USER 'data'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
FLUSH PRIVILEGES;

```

Afterwards, we ran our scripts in the following order:

```
sudo mysql -u root
//then the code goes into mysql and you can create the DB & tables, and insert data:
source script.sql;
source ./input_parsing/jmdict_inserts_part_1.sql;
source ./input_parsinng/jmdict_inserts_par2.sql;
source ./input_parsing/n2_peter_create.sql;
source ./input_parsing/n4_peter_create.sql;
source ./input_parsing/n5_peter_create.sql;
source ./views.sql;
```
