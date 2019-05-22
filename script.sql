CREATE DATABASE main_db;
USE main_db;
CREATE TABLE kanji_english_pair 
(kanji_id int NOT NULL, english_word_id int NOT NULL,
romaji CHAR(60), katakana CHAR(60), hiragana CHAR(60),
CONSTRAINT PK_kanji_english_pair PRIMARY KEY (kanji_id, english_word_id) );
CREATE TABLE english_word
(english_word_id int NOT NULL, english_word_name CHAR(50),
CONSTRAINT PK_english_word PRIMARY KEY (english_word_id));
CREATE TABLE kanji_symbol
(kanji_id int NOT NULL, kanji_symbol_name CHAR(60),
CONSTRAINT PK_kanji_symbol PRIMARY KEY (kanji_id));
CREATE TABLE vocab_list_word (kanji_id int NOT NULL, english_word_id int NOT NULL, 
vocab_list_id int NOT NULL, CONSTRAINT PK_vocab_list_word PRIMARY KEY
(kanji_id, english_word_id, vocab_list_id));
CREATE TABLE vocab_list (vocab_list_id int NOT NULL, vocab_list_name CHAR(50), 
CONSTRAINT PK_vocab_list PRIMARY KEY (vocab_list_id) );
ALTER TABLE kanji_english_pair 
ADD FOREIGN KEY (english_word_id) REFERENCES english_word(english_word_id);
ALTER TABLE kanji_english_pair 
ADD FOREIGN KEY (kanji_id) REFERENCES kanji_symbol(kanji_id);
ALTER TABLE vocab_list_word
ADD FOREIGN KEY (kanji_id) REFERENCES kanji_english_pair(kanji_id);
ALTER TABLE vocab_list_word
ADD FOREIGN KEY (english_word_id) REFERENCES kanji_english_pair(english_word_id);
ALTER TABLE vocab_list_word
ADD FOREIGN KEY (vocab_list_id) REFERENCES vocab_list(vocab_list_id);
