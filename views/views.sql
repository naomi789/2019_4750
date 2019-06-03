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

/*view for word detail page*/
SELECT gloss_word.gloss_ID, gloss_word.ent_seq, pos_word.pos_ID, jmdict.keb, jmdict.reb, gloss.gloss_def, jmdict.is_foreign, jmdict_foreign.orig_lang, jmdict_foreign.orig_word, jmdict_foreign.waseieigo, pos.pos_type 
FROM  gloss_word
LEFT JOIN gloss 
ON gloss_word.gloss_ID = gloss.gloss_ID
LEFT JOIN jmdict 
ON gloss_word.ent_seq = jmdict.ent_seq
LEFT JOIN jmdict_foreign 
ON gloss_word.ent_seq = jmdict_foreign.ent_seq
LEFT JOIN pos_word
ON gloss_word.ent_seq = pos_word.ent_seq
LEFT JOIN pos
ON pos_word.pos_ID = pos.pos_ID
ORDER BY gloss_word.ent_seq;



