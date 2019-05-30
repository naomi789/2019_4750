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
  ent_seq VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL PRIMARY KEY,
  keb VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  r_ele VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  pos VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  lsource VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  gloss VARCHAR(2000)  CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, # english
  k_ele VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci 
);

SHOW VARIABLES LIKE "secure_file_priv";

LOAD XML INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/data/JMdict_e.xml"
INTO TABLE jmdict
CHARACTER SET utf8mb4
ROWS IDENTIFIED BY '<entry>';

DESCRIBE jmdict; 

SELECT * FROM jmdict; 