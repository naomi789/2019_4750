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
