(BIOMD\d+)\s\-\s(.+?)\n[\s\S]+^Publication\sID\:\s(\d+)\n([\s\S]+)\s*\[more\]\n[\s\S]+^Original\sModel\:\sBIOMD\d+\.xml\.origin\n[\s\S]*^Submitter\:\s(.+)\n[\s\S]*^Encoders\:\s([\s\S]+)\nset\s[\s\S]*^Notes\n([\s\S]*)	[\1](http://www.ebi.ac.uk/biomodels-main/\1)
----------------------------------------------------------------------
\2
======================================================================

Model
-----

* **Model File:** \1.em
* **Submitter:** Yasuhiro Naito
* **Encoders:** Yasuhiro Naito

Description from BioModels
--------------------------

### Reference Publication

* **Publication ID:** [\3](http://www.ncbi.nlm.nih.gov/pubmed/\3)
* \4

### Model

* **Original Model:** [\1.xml.origin](http://www.ebi.ac.uk/biomodels/models-main/publ/\1/\1.xml.origin)
* **Submitter:** \5
* **Encoders:** \6

### Notes

\7
(\#\#\#\sModel[\s\S]+)^\*\s\*\*Encoders\:\*\*\s+(.+)\n^\s+(.+)[\s\S]*^\#\#\#\sNotes	\1* **Encoders:** \2, \3

### Notes
(\#\#\#\sModel[\s\S]+)^\*\s\*\*Encoders\:\*\*\s+(.+)\n^\s+(.+)\n^\s+(.+)[\s\S]*^\#\#\#\sNotes	\1* **Encoders:** \2, \3, \4

### Notes
(\#\#\#\sModel[\s\S]+)^\*\s\*\*Encoders\:\*\*\s+(.+)\n^\s+(.+)\n^\s+(.+)\n^\s+(.+)[\s\S]*^\#\#\#\sNotes	\1* **Encoders:** \2, \3, \4, \5

### Notes
(\#\#\#\sModel[\s\S]+)^\*\s\*\*Encoders\:\*\*\s+(.+)\n^\s+(.+)\n^\s+(.+)\n^\s+(.+)\n^\s+(.+)[\s\S]*^\#\#\#\sNotes	\1* **Encoders:** \2, \3, \4, \5, \6

### Notes
