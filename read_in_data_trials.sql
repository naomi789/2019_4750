USE main_db;
/*kanji_symbol
vocab_list_word
vocab_list
kanji_english_pair
english_word

https://stackoverflow.com/questions/8582837/load-xml-local-infile-with-inconsistent-column-names
*/

/*A SQL script that creates all of your tables.
Primary key and foreign key constraints must be included.
Check constraints must be included as well where applicable.*/

CREATE TABLE IF NOT EXISTS jmdict(
  k_ele VARCHAR(20),
  ent_seq VARCHAR(20),
  r_ele VARCHAR(20),
  gloss VARCHAR(20),
  CONSTRAINT PK_jmdict PRIMARY KEY (k_ele, gloss)
);

ALTER TABLE jmdict CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

/*2. SQL insert statements to fill your tables with initial data. Include enough data to show proper testing of your SQL select statements below.*/
SHOW VARIABLES LIKE 'local_infile';
SET GLOBAL local_infile = 1;
-- /data/JMdict_e.xml
-- /data/alt.txt
-- 'C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\'

SHOW VARIABLES LIKE "secure_file_priv";

LOAD XML INFILE "C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\data\JMdict_e.xml"
INTO TABLE jmdict
ROWS IDENTIFIED BY '<entry>';

# INSERT INTO jmdict ('行く', 12345, 'いく', 'to go, to proceed, to take place, to continue');
# INSERT INTO jmdict ('食べる', 12346, '食べる', 'to eat');
# INSERT INTO jmdict ('今日は', 12347, 'こんにちは', 'hello, good day (day time greating)');
# INSERT INTO jmdict ('林檎', 12348, 'りんご', 'apple, apple tree');
# INSERT INTO jmdict ('明るい', 12349, 'あかるい', 'bright, colorful, cheerful, familiar (with), knowledgeable (about), fair (eg politics), clean');


/*3. A SQL select statement for each table that shows all rows.*/
SELECT * FROM jmdict;

/*4. SQL select statements that use criteria to select some rows.*/
SELECT * FROM jmdict WHERE ent_seq < 12346;

/*5. SQL select statements that summarize data.
SELECT * FROM jmdict WHERE GROUP BY*/

/*6. SQL select statements that join tables for a master-detail report.*/

/*7. A SQL select statement for each of your associative entities that shows the contents of your associative entities. These SQL statements must join the related tables and include some information from each table directly related to the associative entity.*/

/*8. Consider creating views for the SQL selects that involve joins.*/
-- CREATE VIEW kanji_jlpt_n1 AS SELECT k_ele FROM JMdict INNER JOIN

/*9. Create an in-class presentation summarizing your status report.*/
