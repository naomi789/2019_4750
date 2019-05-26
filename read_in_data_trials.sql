USE main_db;
/*kanji_symbol
vocab_list_word
vocab_list
kanji_english_pair
english_word

https://stackoverflow.com/questions/8582837/load-xml-local-infile-with-inconsistent-column-names
*/

CREATE TABLE IF NOT EXISTS jmdict(
  k_ele VARCHAR(20) PRIMARY KEY,
  ent_seq VARCHAR(20),
  r_ele VARCHAR(20),
  gloss VARCHAR(20) PRIMARY KEY
);

ALTER TABLE jmdict CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

LOAD XML LOCAL INFILE '/data/JMdict_e.xml'
INTO TABLE jmdict
ROWS IDENTIFIED BY '<entry>';

SHOW VARIABLES LIKE 'local_infile';
SET GLOBAL local_infile = 1;

/*
1. A SQL script that creates all of your tables.
Primary key and foreign key constraints must be included.
Check constraints must be included as well where applicable.
2. SQL insert statements to fill your tables with initial data. Include enough data to show proper testing of your SQL select statements below.
3. A SQL select statement for each table that shows all rows.
4. SQL select statements that use criteria to select some rows.
5. SQL select statements that summarize data.
6. SQL select statements that join tables for a master-detail report.
7. A SQL select statement for each of your associative entities that shows the contents of your associative entities. These SQL statements must join the related tables and include some information from each table directly related to the associative entity.
8. Consider creating views for the SQL selects that involve joins.
9. Create an in-class presentation summarizing your status report.
*/
