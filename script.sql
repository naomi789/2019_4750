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
INSERT INTO vocab_list(333, 'JLPT N5');

INSERT INTO kanji_english_pair(112, 223, 'iku', NULL, 'いく');
INSERT INTO english_word(223, 'to go, to proceed, to take place, to continue');
INSERT INTO kanji_symbol(112, '行く');
INSERT INTO vocab_list_word(112, 223, 333);

INSERT INTO kanji_english_pair(113, 224, 'konnichiwa', NULL, 'こんにちは');
INSERT INTO english_word(224, 'hello, good day (day time greating)');
INSERT INTO kanji_symbol(113, '今日は');
INSERT INTO vocab_list_word(113, 224, 333);

INSERT INTO kanji_english_pair(114, 225, 'aisukurimu', アイスクリーム, NULL);
INSERT INTO english_word(225, 'ice cream');
INSERT INTO kanji_symbol(114, 'アイスクリーム');
INSERT INTO vocab_list_word(114, 225, 333);

INSERT INTO kanji_english_pair(115, 226 'mondai', NULL, 'もんだい');
INSERT INTO english_word(226, 'problem, question, doubt, guess');
INSERT INTO kanji_symbol(115, '問題');
INSERT INTO vocab_list_word(115, 226, 333);
INSERT INTO vocab_list_word(115, 226, 334);
INSERT INTO vocab_list(334, 'JLPT N4');

INSERT INTO kanji_english_pair(116, 227, 'sanpo', NULL, 'さんぽ');
INSERT INTO english_word(227, 'to go for a walk, stroll, strolling');
INSERT INTO kanji_symbol(116, '散歩');
INSERT INTO vocab_list_word(116, 227, 335);
INSERT INTO vocab_list(333, 'JLPT N3');

INSERT INTO kanji_english_pair(117, 228, 'hirune', NULL, 'ひるね');
INSERT INTO english_word(228, 'nap (afternoon), siesta');
INSERT INTO kanji_symbol(117, '昼寝');
INSERT INTO vocab_list_word(117, 228, 336);
INSERT INTO vocab_list(336, 'JLPT N2');

INSERT INTO kanji_english_pair(118, 229, 'hima', NULL, 'ひま');
INSERT INTO english_word(229, 'spare time, free time, leisure, time (eg it takes to do something), time off');
INSERT INTO kanji_symbol(118, '暇');
INSERT INTO vocab_list_word(118, 229, 337);
INSERT INTO vocab_list(337, 'JLPT N1');


/*3. A SQL select statement for each table that shows all rows.*/
SELECT * FROM kanji_english_pair;
SELECT * FROM english_word;
SELECT * FROM kanji_symbol;
SELECT * FROM vocab_list_word;
SELECT * FROM vocab_list; 

/*4. SQL select statements that use criteria to select some rows.*/
SELECT * FROM jmdict WHERE ent_seq < 12346;

/*5. SQL select statements that summarize data.
SELECT * FROM jmdict WHERE GROUP BY*/

/*6. SQL select statements that join tables for a master-detail report.*/

/*7. A SQL select statement for each of your associative entities that shows the contents of your associative entities. These SQL statements must join the related tables and include some information from each table directly related to the associative entity.*/

/*8. Consider creating views for the SQL selects that involve joins.*/
-- CREATE VIEW kanji_jlpt_n1 AS SELECT k_ele FROM JMdict INNER JOIN

/*9. Create an in-class presentation summarizing your status report.*/
