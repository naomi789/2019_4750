import xml.etree.cElementTree as et
from pprint import pprint as pp

xs = './../data/JMdict_e.xml'

# xs = './../data/temp.xml'
# with open (xs, "r") as myfile:
#     data = myfile.readlines()

with open(xs, 'r') as file:
    data = file.read().replace('\n', '')

xml_data = et.fromstring(data)

pp([dict((attr.tag, attr.text) for attr in el) for el in xml_data])
