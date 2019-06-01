#!/usr/bin/python
# -*- coding: utf-8 -*-

import json

json_file = './JMdict_e.xml.json'
# json_file = './examp_6.json'

output = 'create.sql'

# with open(json_file, 'r') as file:
#     data = file.read().replace('\n', '')

with open(json_file, 'r') as file:
    all_data = file.read()

# print('all_data:', all_data)
all_data = json.loads(all_data)


with open(output, 'w') as output:
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


        # print(counter, entry)
        ent_seq = entry['ent_seq'] # this ALWAYS exists
        ent_seq = ent_seq[0] # there can only be one, therefore always zeroth

        r_ele = entry['r_ele'] # an object
        r_ele = r_ele[0]
        reb = r_ele['reb']

        if 'k_ele' in entry:
            # print(True)
            k_ele = entry['k_ele'] # an object, MAY NOT EXIST
            k_ele = k_ele[0]
            keb = k_ele['keb']

        if 'sense' in entry:
            sense = entry['sense'] # an object
            sense = sense[0]
            pos = sense['pos']
            gloss = sense['gloss']
            if 'lsource' in sense:
                # print(lsource)
                # if lsource is not None:
                #     # print(lsource)
                lsource = sense['lsource'][0]
                if '$' in lsource:
                    dollar_lang = lsource['$']
                    if '_' in lsource:
                        orig_word = lsource['_']

                    if 'ls_wasei' in dollar_lang:
                        waseieigo = dollar_lang['ls_wasei']
                    if 'xml:lang' in dollar_lang:
                        orig_lang = dollar_lang['xml:lang']


        jmdict_foreign_statement = str('INSERT INTO jmdict_foreign VALUES(\'' + ent_seq + '\',')
        jmdict_statement = str('INSERT INTO jmdict VALUES(\'' + ent_seq + '\',')
        if keb is not None:
            assert(len(keb) == 1), 'looks like this is off'
            jmdict_statement = str(jmdict_statement + keb[0] + '\',')
            jmdict_foreign_statement = str(jmdict_statement + keb[0] + '\',')

        if reb is not None:
            assert(len(reb) == 1), 'idk about this'
            jmdict_statement = str(jmdict_statement + reb[0] + '\');\n') # that's the last one
            jmdict_foreign_statement = str(jmdict_statement + reb[0] + '\',')


        pos_statement = str('INSERT INTO pos VALUES(\'')
        for single_pos in pos:

            # finished_pos_statement = str(pos_statement, single_pos, ')')
            # pos_word_statement = str('INSERT INTO pos_word VALUES(\'' + ent_seq + '\')')
            #
            # # TODO: write 'finished_pos_statement to a file
            # output.write(finished_pos_statement)
            # # TODO: write 'pos_word_statement to a file
            # output.write(pos_word_statement)
            pass

        gloss_statement = str('INSERT INTO gloss VALUES(\'')
        for single_gloss in gloss:
            # finished_gloss_statement = str(gloss_statement, single_gloss, ')')
            # gloss_word_statement = str('INSERT INTO gloss_word VALUES(\'' + ent_seq + '\')')
            #
            #
            # # TODO: write 'finished_gloss_statement to a file
            # output.write(finished_pos_statement)
            # # TODO: write 'gloss_word_statement' to a file
            # output.write(gloss_word_statement)
            pass


        if lsource is not None:
            # print('before', orig_lang, orig_word, waseieigo)
            if orig_lang is None:
                # print('orig_lang is NULL')
                orig_lang = 'NULL'
            if orig_word is None:
                # print('orig_word is NULL')
                orig_word = 'NULL'
            if waseieigo is None:
                # print('waseieigo is NULL')
                waseieigo = 'NULL'
            # print('after', orig_lang, orig_word, waseieigo)
            jmdict_foreign_statement = str(jmdict_foreign_statement + orig_lang + '\',')
            jmdict_foreign_statement = str(jmdict_foreign_statement + orig_word + '\',')
            jmdict_foreign_statement = str(jmdict_foreign_statement + waseieigo + '\');\n')
            output.write(jmdict_foreign_statement)
        else:
            # write to jmdict_statement
            output.write(jmdict_statement)



        # INSERT INTO jmdict VALUES('1000220', '明白', 'めいはく', NULL, NULL);
        # INSERT INTO word_gloss('1000220', 'obvious')



        # print(jmdict_statement)
