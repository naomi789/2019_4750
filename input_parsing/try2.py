#!/usr/bin/python
# -*- coding: utf-8 -*-

import json

# json_file = './JMdict_e.xml.json'
json_file = './example.json'

# with open(json_file, 'r') as file:
#     data = file.read().replace('\n', '')


with open(json_file, 'r') as file:
    all_data = json.loads(file.read())
    # print(all_data)


# j = json.load("{
#    "one":"1",
#    "two":"2",
#    "three":"3",
#    "four":[
#       0,
#       1,
#       2,
#       3,
#       4
#    ],
#    "five":[
#       {
#          "reb":[
#             "おはようございます"
#          ],
#          "re_pri":[
#             "spec1"
#          ]
#       }
#    ]
# }")
# j_string = json.loads('{"one" : "1", "two" : "2", "three" : "3"}')
# j = json.load('{"one" : "1", "two" : "2", "three" : "3"}')
# print(all_data['ent_seq'])
# print(j_string['four'])


counter = 0
for entry in all_data:
    ent_seq = all_data['ent_seq'] # this ALWAYS exists
    print(ent_seq)
    # print(counter, entry, entry[entry])
    # 0 is ent_seq
    # 1 is k_ele
    # 2 is r_ele
    # 3 is sense
    # if entry == 'ent_seq':
        # print(entry['ent_seq'])
    keb = entry[0]
    reb = entry[0]

    ent_seq = None
    keb = None
    reb = None
    sense = None
    lsource = None
    pos = None
    gloss = None

    # print(reb)
    # print(counter, entry, all_data[entry])





    counter += 1
    # for subentry in entry:
    #     print(subentry, counter)

    # for key, value in entry.iteritems():
    #     print('key', key, 'val', value)
    # ent_seq = entry['ent_seq']
    # print(ent_seq)



    # if 'ent_seq' in entry: ent_seq = entry['ent_seq']
    # if 'r_ele' in entry: r_ele = entry['r_ele']
    # if 'k_ele' in entry: k_ele = entry['k_ele']
    # if 'sense' in entry: sense = entry['sense']
    # if 'pos' in entry: pos = entry['pos']
    # gloss =  None# temp solution
    #
    # sql_statement = 'INSERT INTO jmdict VALUES(\'' + ent_seq + '\','
    # sql_statement += k_ele + '\',' + r_ele + '\','
    # sql_statement += pos + '\',' + lsource + '\'' + ');\n'
    # output.write(sql_statement)


    # second_statement = 'INSERT INTO word_gloss(' + ent_seq + '\','
    # second_statement += gloss + ');'
    # INSERT INTO jmdict VALUES('1000220', '明白', 'めいはく', NULL, NULL);
    # INSERT INTO word_gloss('1000220', 'obvious')
