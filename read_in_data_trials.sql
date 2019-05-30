USE main_db;

DROP TABLE jmdict; 

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
# utf8mb4_unicode_ci
ALTER TABLE jmdict CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_ja_0900_as_cs;
ALTER TABLE jmdict CHANGE keb keb VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_ja_0900_as_cs;
ALTER TABLE jmdict CHANGE ent_seq ent_seq VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_ja_0900_as_cs;
ALTER TABLE jmdict CHANGE r_ele r_ele VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_ja_0900_as_cs;
ALTER TABLE jmdict CHANGE pos pos VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_ja_0900_as_cs;
ALTER TABLE jmdict CHANGE lsource lsource VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_ja_0900_as_cs; 
ALTER TABLE jmdict CHANGE gloss gloss VARCHAR(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_ja_0900_as_cs;
ALTER TABLE jmdict CHANGE k_ele k_ele VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_ja_0900_as_cs;

SHOW VARIABLES LIKE "secure_file_priv";
SELECT VERSION();
SELECT CHARACTER_SET_NAME, DESCRIPTION
       FROM INFORMATION_SCHEMA.CHARACTER_SETS
       WHERE DESCRIPTION LIKE '%Chin%'
       OR DESCRIPTION LIKE '%Japanese%'
       OR DESCRIPTION LIKE '%Korean%'
       ORDER BY CHARACTER_SET_NAME;
SHOW VARIABLES LIKE 'char%';

LOAD XML INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/data/JMdict_e.xml"
INTO TABLE jmdict
ROWS IDENTIFIED BY '<entry>';

SELECT * FROM jmdict; 
DESCRIBE jmdict; 