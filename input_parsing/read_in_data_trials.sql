CREATE DATABASE main_db DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
# or character set: utf8mb4, utf8
# or collate to: utf8mb4_unicode_520_ci, utf8_general_ci, utf8mb4_unicode_ci, utf8mb4_unicode_520_ci


USE main_db;

DROP TABLE jmdict; 

# This element will contain a word or short phrase in Japanese  which is written using at least one non-kana character (usually kanji, but can be other characters).
# unique ID from Jim Breen
# The reading element typically contains the valid readings of the word(s) in the kanji element using modern kanadzukai. 
# Part-of-speech information about the entry/sense. Should use  appropriate entity codes. 
# This element records the information about the source language(s) of a loan-word/gairaigo. 
# target-language words or phrases which are equivalents to the  Japanese word
# The kanji element, or in its absence, the reading element, is the defining component of each entry.
# CONSTRAINT PK_jmdict PRIMARY KEY (ent_seq)

CREATE TABLE IF NOT EXISTS jmdict(
  ent_seq NVARCHAR(255),
  keb NVARCHAR(255),
  reb  NVARCHAR(255),
  pos  NVARCHAR(255),
  lsource  NVARCHAR(255),
  gloss  NVARCHAR(255)
);

SHOW VARIABLES LIKE "secure_file_priv";

# LOAD XML INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/data/JMdict_e.xml"
LOAD XML INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/data/temp.xml"
INTO TABLE jmdict
CHARACTER SET utf8mb4
ROWS IDENTIFIED BY '<entry>';

DESCRIBE jmdict; 

SELECT * FROM jmdict; 
SELECT * FROM jmdict WHERE keb IS NOT NULL; 