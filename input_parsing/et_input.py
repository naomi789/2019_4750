#!/usr/bin/python
# -*- coding: utf-8 -*-

import xml.etree.cElementTree as et
from pprint import pprint as pp

xs = './../data/JMdict_e.xml'

# xs = './../data/temp.xml'
# with open (xs, "r") as myfile:
#     data = myfile.readlines()

# CREATE TABLE IF NOT EXISTS jmdict(
#   ent_seq NVARCHAR(255),
#   keb NVARCHAR(255),
#   reb  NVARCHAR(255),
#   pos  NVARCHAR(255),
#   lsource  NVARCHAR(255),
#   gloss  NVARCHAR(255)
# );

with open(xs, 'r') as file:
    data = file.read().replace('\n', '')

xml_data = et.fromstring(data)

all_data = [dict((attr.tag, attr.text) for attr in el) for el in xml_data]

with open('attempt2.sql', 'w') as output:
    for entry in all_data:
        if 'ent_seq' in entry: ent_seq = entry['ent_seq']
        if 'r_ele' in entry: r_ele = entry['r_ele']
        if 'k_ele' in entry: k_ele = entry['k_ele']
        if 'sense' in entry: sense = entry['sense']
        if 'pos' in entry: pos = entry['pos']
        gloss =  None# temp solution

        sql_statement = 'INSERT INTO jmdict VALUES(\'' + ent_seq + '\','
        sql_statement += k_ele + '\',' + r_ele + '\','
        sql_statement += pos + '\',' + lsource + '\'' + ');\n'
        output.write(sql_statement)


        # second_statement = 'INSERT INTO word_gloss(' + ent_seq + '\','
        # second_statement += gloss + ');'
        # INSERT INTO jmdict VALUES('1000220', '明白', 'めいはく', NULL, NULL);
        # INSERT INTO word_gloss('1000220', 'obvious')
