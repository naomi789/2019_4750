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


INSERT INTO english_word VALUES (222, 'to eat');
INSERT INTO kanji_symbol VALUES (111, '食べる');
INSERT INTO kanji_english_pair VALUES (111, 222, 'taberu', NULL, 'たべる');
INSERT INTO vocab_list VALUES (333, 'JLPT N5');
INSERT INTO vocab_list_word VALUES (111, 222, 333);

INSERT INTO english_word VALUES (223, 'to go, to proceed, to take place, to continue');
INSERT INTO kanji_symbol VALUES (112, '行く');
INSERT INTO kanji_english_pair VALUES (112, 223, 'iku', NULL, 'いく');
INSERT INTO vocab_list_word VALUES (112, 223, 333);

INSERT INTO english_word VALUES (224, 'hello, good day (day time greating)');
INSERT INTO kanji_symbol VALUES (113, '今日は');
INSERT INTO kanji_english_pair VALUES (113, 224, 'konnichiwa', NULL, 'こんにちは');
INSERT INTO vocab_list_word VALUES (113, 224, 333);

INSERT INTO english_word VALUES (225, 'ice cream');
INSERT INTO kanji_symbol VALUES (114, 'アイスクリーム');
INSERT INTO kanji_english_pair VALUES (114, 225, 'aisukurimu', 'アイスクリーム', NULL);
INSERT INTO vocab_list_word VALUES (114, 225, 333);

INSERT INTO english_word VALUES (226, 'problem, question, doubt, guess');
INSERT INTO kanji_symbol VALUES (115, '問題');
INSERT INTO kanji_english_pair VALUES (115, 226, 'mondai', NULL, 'もんだい');
INSERT INTO vocab_list VALUES (334, 'JLPT N4');
INSERT INTO vocab_list_word VALUES (115, 226, 333);
INSERT INTO vocab_list_word VALUES (115, 226, 334);


INSERT INTO english_word VALUES (227, 'to go for a walk, stroll, strolling');
INSERT INTO kanji_symbol VALUES (116, '散歩');
INSERT INTO kanji_english_pair VALUES (116, 227, 'sanpo', NULL, 'さんぽ');
INSERT INTO vocab_list VALUES (335, 'JLPT N3');
INSERT INTO vocab_list_word VALUES (116, 227, 335);

INSERT INTO english_word VALUES (228, 'nap (afternoon), siesta');
INSERT INTO kanji_symbol VALUES (117, '昼寝');
INSERT INTO kanji_english_pair VALUES (117, 228, 'hirune', NULL, 'ひるね');
INSERT INTO vocab_list VALUES (336, 'JLPT N2');
INSERT INTO vocab_list_word VALUES (117, 228, 336);

INSERT INTO english_word VALUES (229, 'spare time, free time, leisure, time (eg it takes to do something), time off');
INSERT INTO kanji_symbol VALUES (118, '暇');
INSERT INTO kanji_english_pair VALUES (118, 229, 'hima', NULL, 'ひま');
INSERT INTO vocab_list VALUES (337, 'JLPT N1');
INSERT INTO vocab_list_word VALUES (118, 229, 337);


INSERT INTO english_word VALUES (230, 'travel, trip, journey, excursion, tour');
INSERT INTO kanji_symbol VALUES (119, '旅行');
INSERT INTO kanji_english_pair VALUES (119, 230, 'ryokou', NULL, 'りょこう');
INSERT INTO vocab_list_word VALUES (119, 230, 333);


/*3. A SQL select statement for each table that shows all rows.*/
SELECT * FROM kanji_english_pair;
SELECT * FROM english_word;
SELECT * FROM kanji_symbol;
SELECT * FROM vocab_list_word;
SELECT * FROM vocab_list;

/*4. SQL select statements that use criteria to select some rows.*/
SELECT * FROM kanji_english_pair WHERE katakana IS NOT NULL;
SELECT * FROM english_word WHERE english_word_name LIKE 'to%';
SELECT * FROM kanji_symbol WHERE kanji_symbol_name LIKE '%行%';
SELECT * FROM vocab_list_word WHERE vocab_list_id=333;
SELECT * FROM vocab_list WHERE vocab_list_name='JLPT N5';

/*5. SQL select statements that summarize data.*/
/*count the number of english word in data*/
SELECT COUNT(english_word_id) FROM english_word;
/*count the number of kanji in the database*/
SELECT COUNT(kanji_id) FROM kanji_symbol;
/*count the number of kanji in each lists created*/
SELECT COUNT(kanji_id), vocab_list_id FROM vocab_list_word GROUP BY vocab_list_id;
/*summarize the percentage of kanji with katakana and hiragana*/
SELECT (SELECT COUNT(katakana) / (SELECT COUNT(kanji_id) FROM kanji_english_pair) 
FROM kanji_english_pair) AS katakana_Percentage,
(SELECT COUNT(hiragana) / (SELECT COUNT(kanji_id) FROM kanji_english_pair) 
FROM kanji_english_pair) AS hiragana_Percentage; 
/*count the exist kanji-english-pairs*/
SELECT COUNT(*) FROM kanji_english_pair;


/*6. SQL select statements that join tables for a master-detail report.*/

/*7. A SQL select statement for each of your associative entities that shows the contents of your associative entities. These SQL statements must join the related tables and include some information from each table directly related to the associative entity.*/

/*8. Consider creating views for the SQL selects that involve joins.*/
-- CREATE VIEW kanji_jlpt_n1 AS SELECT k_ele FROM JMdict INNER JOIN

/*9. Create an in-class presentation summarizing your status report.*/
