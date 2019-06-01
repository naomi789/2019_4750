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
            jmdict_statement = str(jmdict_statement + reb[0] + '\');') # that's the last one 
            jmdict_foreign_statement = str(jmdict_statement + reb[0] + '\',')


        pos_statement = str('INSERT INTO pos VALUES(\'')
        for single_pos in pos:
            pass
            # finished_pos_statement = str(pos_statement, single_pos, ')')
            # pos_word_statement = str('INSERT INTO pos_word VALUES(\'' + ent_seq + '\')')
            #
            # # TODO: write 'finished_pos_statement to a file
            # output.write(finished_pos_statement)
            # # TODO: write 'pos_word_statement to a file
            # output.write(pos_word_statement)

        gloss_statement = str('INSERT INTO gloss VALUES(\'')
        for single_gloss in gloss:
            pass
            # finished_gloss_statement = str(gloss_statement, single_gloss, ')')
            # gloss_word_statement = str('INSERT INTO gloss_word VALUES(\'' + ent_seq + '\')')
            #
            #
            # # TODO: write 'finished_gloss_statement to a file
            # output.write(finished_pos_statement)
            # # TODO: write 'gloss_word_statement' to a file
            # output.write(gloss_word_statement)


        if lsource is not None:
            jmdict_foreign_statement = str(jmdict_foreign_statement + orig_lang + '\',')
            jmdict_foreign_statement = str(jmdict_foreign_statement + orig_word + '\',')
            jmdict_foreign_statement = str(jmdict_foreign_statement + waseieigo + '\');')





        # jmdict_statement += str(k_ele + '\',' + r_ele + '\',')
        # jmdict_statement += str(pos + '\',' + lsource + '\'' + ');\n')
        # jmdict_statement = str(ent_seq + keb + reb + pos + gloss)
        # print(jmdict_statement)
        # print(type(keb))


        # if type(keb) is not None:
        #     print('type(keb)', type(keb))
        #     if keb is not []:
        #         print('keb', keb)
        #         if keb is not None:
        #             output.write(str(keb[0]))

        # second_statement = 'INSERT INTO word_gloss(' + ent_seq + '\','
        # second_statement += gloss + ');'
        # INSERT INTO jmdict VALUES('1000220', '明白', 'めいはく', NULL, NULL);
        # INSERT INTO word_gloss('1000220', 'obvious')



        # print(jmdict_statement)
