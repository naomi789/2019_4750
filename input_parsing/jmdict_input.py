#!/usr/bin/python
# -*- coding: utf-8 -*-

import json
import collections
import uuid

json_file = '../data/JMdict_e/JMdict_e.json'
output = 'jmdict_no_bridges_create.sql'
# output = 'jmdict_bridges_only_create.sql'


with open(json_file, 'r') as file:
    all_data = file.read()

# print('all_data:', all_data)
all_data = json.loads(all_data)


with open(output, 'w') as output:
    output.write('USE main_db;\n')
    for entry in all_data:
        ent_seq = None
        reb = None
        keb = None
        sense = None
        lsource = None
        pos = None
        gloss = None
        lsource = None
        orig_lang = None
        orig_word = None
        waseieigo = None

        ent_seq = entry['ent_seq'] # this ALWAYS exists
        ent_seq = ent_seq[0] # there can only be one, therefore always zeroth

        r_ele = entry['r_ele'] # an object
        r_ele = r_ele[0]
        reb = r_ele['reb']

        if 'k_ele' in entry:
            k_ele = entry['k_ele'] # an object, MAY NOT EXIST
            k_ele = k_ele[0]
            keb = k_ele['keb']

        if 'sense' in entry:
            sense = entry['sense'] # an object
            sense = sense[0]
            pos = sense['pos']
            gloss = sense['gloss']
            if 'lsource' in sense:
                lsource = sense['lsource'][0]
                if '$' in lsource:
                    dollar_lang = lsource['$']
                    if '_' in lsource:
                        orig_word = lsource['_']

                    if 'ls_wasei' in dollar_lang:
                        waseieigo = dollar_lang['ls_wasei']
                    if 'xml:lang' in dollar_lang:
                        orig_lang = dollar_lang['xml:lang']


        jmdict_statement = str('INSERT INTO jmdict VALUES(\'' + ent_seq + '\',\'')
        if keb is not None:
            assert(len(keb) == 1), 'looks like this is off'
            jmdict_statement = str(jmdict_statement + keb[0] + '\',')



        if reb is not None:
            assert(len(reb) == 1), 'idk about this'
            jmdict_statement = str(jmdict_statement + '\'' + reb[0] + '\');\n') # that's the last one


        pos_statement = 'INSERT INTO pos VALUES(\''
        for single_pos in pos:
            pos_id = str(uuid.uuid4())
            finished_pos_statement = str(pos_statement + pos_id + '\',\'' + single_pos + '\');\n')
            pos_word_statement = str('INSERT INTO pos_word VALUES(\'' + ent_seq + '\',\'' + pos_id + '\');\n')
            output.write(finished_pos_statement)  # NOT a bridge
            # output.write(pos_word_statement) # is a bridge

        gloss_statement = 'INSERT INTO gloss VALUES(\''
        for single_gloss in gloss:
            gloss_id = str(uuid.uuid4())
            if not isinstance(single_gloss, collections.Mapping):
                single_gloss = single_gloss.replace('\'', '')

                finished_gloss_statement = str(gloss_statement + gloss_id + '\',\'' + single_gloss + '\');\n')
            else: # these are probably exclusively for 'lsource' words?? Not 100% sure why this is different...
                key_from_dict_gloss = single_gloss['_'].replace('\'', '')
                finished_gloss_statement = str(gloss_statement + gloss_id + '\',\'' + key_from_dict_gloss + '\');\n')

            gloss_word_statement = str('INSERT INTO gloss_word VALUES(\'' + ent_seq + '\',\'' + gloss_id + '\');\n')
            # output.write(gloss_word_statement) # is a bridge
            output.write(finished_gloss_statement) # NOT a bridge

        if lsource is not None:
            # print(waseieigo)
            if orig_lang is None:
                orig_lang = 'NULL'
            if orig_word is None:
                orig_word = 'NULL'
            if waseieigo is None:
                waseieigo = ''
            elif waseieigo == 'y':
                waseieigo = 'waseieigo'
            # to do i should come back and fix this
            # else:
            #     print(waseieigo)
            #     assert(False, 'something bad might\'ve happened')

            jmdict_foreign_statement = str('INSERT INTO jmdict_foreign VALUES(\'' + ent_seq + '\', \'' + orig_lang + '\',\'')
            jmdict_foreign_statement = str(jmdict_foreign_statement + orig_word + '\',\'')
            jmdict_foreign_statement = str(jmdict_foreign_statement + waseieigo + '\');\n')
            output.write(jmdict_foreign_statement) # NOT a bridge
            output.write(jmdict_statement) # NOT a bridge
