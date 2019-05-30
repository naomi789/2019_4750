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

# DROP TABLE jmdict; 

CREATE TABLE IF NOT EXISTS jmdict(
  keb VARCHAR(20), # This element will contain a word or short phrase in Japanese  which is written using at least one non-kana character (usually kanji, but can be other characters).
  ent_seq VARCHAR(20), # unique ID from Jim Breen
  r_ele VARCHAR(20), # The reading element typically contains the valid readings of the word(s) in the kanji element using modern kanadzukai. 
  pos VARCHAR(20), # Part-of-speech information about the entry/sense. Should use  appropriate entity codes. 
  lsource VARCHAR(200), # This element records the information about the source language(s) of a loan-word/gairaigo. 
  gloss VARCHAR(2000), # target-language words or phrases which are equivalents to the  Japanese word
  k_ele VARCHAR(20), # The kanji element, or in its absence, the reading element, is the defining component of each entry.
  CONSTRAINT PK_jmdict PRIMARY KEY (ent_seq)
);

ALTER TABLE jmdict CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

/*2. SQL insert statements to fill your tables with initial data. Include enough data to show proper testing of your SQL select statements below.*/
# SHOW VARIABLES LIKE 'local_infile';
# SET GLOBAL local_infile = 1;
-- /data/JMdict_e.xml
-- /data/alt.txt
-- 'C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\'
# SHOW VARIABLES LIKE "secure_file_priv";

LOAD XML INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/data/JMdict_e.xml"
INTO TABLE jmdict
ROWS IDENTIFIED BY '<entry>';

SELECT * FROM jmdict; 
DESCRIBE jmdict; 