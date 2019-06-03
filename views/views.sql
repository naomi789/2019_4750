/*create views*/

/*view used for showing result after search*/
DROP VIEW brief_result; 
CREATE VIEW brief_result AS
SELECT gloss_word.gloss_ID, gloss_word.ent_seq, jmdict.keb, jmdict.reb, gloss.gloss_def 
FROM  gloss_word
LEFT JOIN gloss 
ON gloss_word.gloss_ID = gloss.gloss_ID
LEFT JOIN jmdict 
ON gloss_word.ent_seq = jmdict.ent_seq
ORDER BY gloss_word.ent_seq;

SELECT * FROM brief_result;

