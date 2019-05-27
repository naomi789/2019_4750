CREATE DATABASE main_db;
USE main_db;

CREATE TABLE IF NOT EXISTS kanji_english_pair
(kanji_id int NOT NULL, english_word_id int NOT NULL,
romaji VARCHAR(200), katakana VARCHAR(200), hiragana VARCHAR(200),
CONSTRAINT PK_kanji_english_pair PRIMARY KEY (kanji_id, english_word_id) );

CREATE TABLE IF NOT EXISTS english_word
(english_word_id int NOT NULL, english_word_name VARCHAR(2000),
CONSTRAINT PK_english_word PRIMARY KEY (english_word_id));

CREATE TABLE IF NOT EXISTS kanji_symbol
(kanji_id int NOT NULL, kanji_symbol_name VARCHAR(200),
CONSTRAINT PK_kanji_symbol PRIMARY KEY (kanji_id));

CREATE TABLE IF NOT EXISTS vocab_list_word (kanji_id int NOT NULL, english_word_id int NOT NULL,
vocab_list_id int NOT NULL, CONSTRAINT PK_vocab_list_word PRIMARY KEY
(kanji_id, english_word_id, vocab_list_id));

CREATE TABLE IF NOT EXISTS vocab_list (vocab_list_id int NOT NULL, vocab_list_name VARCHAR(200),
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

ALTER DATABASE main_db CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

ALTER TABLE english_word CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE kanji_english_pair CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE kanji_symbol CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE vocab_list CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE vocab_list_word CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE english_word CHANGE english_word_name english_word_name VARCHAR(2000)
 CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

ALTER TABLE kanji_english_pair CHANGE romaji romaji VARCHAR(200)
CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE kanji_english_pair CHANGE katakana katakana VARCHAR(200)
CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE kanji_english_pair CHANGE hiragana hiragana VARCHAR(200)
CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE kanji_symbol CHANGE kanji_symbol_name kanji_symbol_name VARCHAR(200)
CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE vocab_list CHANGE vocab_list_name vocab_list_name VARCHAR(200)
CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

INSERT INTO kanji_english_pair(111, 222, 'taberu', NULL, 'たべる');
INSERT INTO english_word(222, 'to eat');
INSERT INTO kanji_symbol(111, '食べる');
INSERT INTO vocab_list_word(111, 222, 333);
INSERT INTO vocab_list(333, 'JLPT N1');
