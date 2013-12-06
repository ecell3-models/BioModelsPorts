[BIOMD0000000296](http://www.ebi.ac.uk/biomodels-main/BIOMD0000000296)
----------------------------------------------------------------------
Balagaddé2008_E_coli_Predator_Prey
======================================================================

Model
-----

* **Model File:** BIOMD0000000296.em
* **Submitter:** Yasuhiro Naito
* **Encoders:** Kaito Kikuchi (E-Cell Sprint 2013)

Description from BioModels
--------------------------

### Reference Publication

* **Publication ID:** [18414488](http://www.ncbi.nlm.nih.gov/pubmed/18414488)
* Balagaddé FK, Song H, Ozaki J, Collins CH, Barnet M, Arnold FH, Quake SR, You L.  
A synthetic Escherichia coli predator-prey ecosystem.  
Mol. Syst. Biol. 2008; 4: 187  
Department of Bioengineering, Stanford University and Howard Hughes Medical Institute, Stanford, CA, USA.

### Model

* **Original Model:** [Mol. Syst. Biol.](http://www.nature.com/msb/journal/v4/n1/extref/msb200824-s2.xml)
* **Submitter:** Lukas Endler
* **Encoders:** Lukas Endler, Hao Song

### Notes

This is the reduced model described in the article:  
A synthetic Escherichia coli predator–prey ecosystem  
Balagaddé FK, Song H, Ozaki J, Collins CH, Barnet M, Arnold FH, Quake SR, You L. Mol Syst Biol. 2008;4:187. Epub 2008 Apr 15. PMID: 18414488 ; DOI: 10.1038/msb.2008.24

Abstract:  
We have constructed a synthetic ecosystem consisting of two Escherichia coli populations, which communicate bi-directionally through quorum sensing and regulate each other's gene expression and survival via engineered gene circuits. Our synthetic ecosystem resembles canonical predator–prey systems in terms of logic and dynamics. The predator cells kill the prey by inducing expression of a killer protein in the prey, while the prey rescue the predators by eliciting expression of an antidote protein in the predator. Extinction, coexistence and oscillatory dynamics of the predator and prey populations are possible depending on the operating conditions as experimentally validated by long-term culturing of the system in microchemostats. A simple mathematical model is developed to capture these system dynamics. Coherent interplay between experiments and mathematical analysis enables exploration of the dynamics of interacting populations in a predictable manner.

In the article the cell density is given in per 10 3 cells per microlitre. To evade a conversion factor in the SBML implementation, the unit for the cell densities was just left the same as for the AHLs A and A2 (nM).