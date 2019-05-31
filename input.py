#!/usr/bin/python
# -*- coding: utf-8 -*-

import xml.sax

# GOAL:
# INSERT INTO jmdict VALUES('1000220', '明白', 'めいはく', NULL, NULL);
# INSERT INTO word_gloss('1000220', 'obvious')


class Entry( xml.sax.ContentHandler ):
    def __init__(self):
        self.CurrentData = ''
        self.ent_seq = ''
        self.keb = ''
        self.reb = ''
        self.pos = ''
        self.lsource = ''
        self.gloss = ''

    # call this when an element starts
    def startElement(self, tag, attributes):
        # print('unnamed')
        self.CurrentData = tag
        if tag == 'entry':
            print('unnamed')
        #     title = attributes['title']
        #     print('title: ', title)
        #     there should be no 'attributes' field in this case

    def endElement(self, tag):
        # if self.CurrentData == 'entry':
        #     print('type', self.type) # this should also break
        if self.CurrentData == 'ent_seq':
            print('ent_seq', self.ent_seq)
        elif self.CurrentData == 'keb':
            print('keb', self.keb)
        elif self.CurrentData == 'reb':
            print('reb', self.reb)
        # also pos, lsource
        # separately do ent_seq and each of the glosses

    def characters(self, content):
        # if self.CurrentData == 'type':
        #     self.type == contents
        if self.CurrentData == 'ent_seq':
            self.ent_seq == content
        elif self.CurrentData == 'keb':
            self.keb == content
        elif self.CurrentData == 'reb':
            self.reb == content
        # also pos, lsource
        # separately do ent_seq and each of the glosses

if (__name__ == '__main__'):
    # create an XMLReader
    parser = xml.sax.make_parser()

    #turn off namespaces
    parser.setFeature(xml.sax.handler.feature_namespaces, 0)

    # override the default ContextHandler
    Handler = Entry()
    parser.setContentHandler( Handler )

    parser.parse("data/temp.xml")
    # parser.parse("data/JMdict_e.xml")
