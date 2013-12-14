[BIOMD0000000239](http://www.ebi.ac.uk/biomodels-main/BIOMD0000000239)
----------------------------------------------------------------------
Jiang2007 - GSIS system, Pancreatic Beta Cells
======================================================================

Model
-----

* **Model File:** BIOMD0000000239.em
* **Submitter:** Yasuhiro Naito
* **Encoders:** Yasuhiro Naito

Description from BioModels
--------------------------

### Reference Publication

* **Publication ID:** [17514510](http://www.ncbi.nlm.nih.gov/pubmed/17514510)
* Jiang N, Cox RD, Hancock JM. 
A kinetic core model of the glucose-stimulated insulin secretion network of pancreatic beta cells. 
Mamm. Genome 2007 Jul; 18(6-7): 508-520 
Bioinformatics Group, MRC Mammalian Genetics Unit, Harwell, Oxfordshire, OX11 0RD, UK.

### Model

* **Original Model:** [BIOMD0000000239.xml.origin](http://www.ebi.ac.uk/biomodels/models-main/publ/BIOMD0000000239/BIOMD0000000239.xml.origin)
* **Submitter:** Kieran Smallbone
* **Encoders:** Vijayalakshmi Chelliah, Kieran Smallbone

### Notes

Jiang2007 - GSIS system, Pancreatic Beta Cells

Description of a core kinetic model of the glucose-stimulated insulin secretion system (GSIS) in pancreatic beta cells.

This model is described in the article:

A kinetic core model of the glucose-stimulated insulin secretion network of pancreatic beta cells.
Jiang N, Cox RD, Hancock JM.
Mamm Genome 2007 Jul; 18(6-7):508-20.

Abstract:

The construction and characterization of a core kinetic model of the glucose-stimulated insulin secretion system (GSIS) in pancreatic beta cells is described. The model consists of 44 enzymatic reactions, 59 metabolic state variables, and 272 parameters. It integrates five subsystems: glycolysis, the TCA cycle, the respiratory chain, NADH shuttles, and the pyruvate cycle. It also takes into account compartmentalization of the reactions in the cytoplasm and mitochondrial matrix. The model shows expected behavior in its outputs, including the response of ATP production to starting glucose concentration and the induction of oscillations of metabolite concentrations in the glycolytic pathway and in ATP and ADP concentrations. Identification of choke points and parameter sensitivity analysis indicate that the glycolytic pathway, and to a lesser extent the TCA cycle, are critical to the proper behavior of the system, while parameters in other components such as the respiratory chain are less critical. Notably, however, sensitivity analysis identifies the first reactions of nonglycolytic pathways as being important for the behavior of the system. The model is robust to deletion of malic enzyme activity, which is absent in mouse pancreatic beta cells. The model represents a step toward the construction of a model with species-specific parameters that can be used to understand mouse models of diabetes and the relationship of these mouse models to the human disease state.

The model reproduces Figure 2 of the paper, and is built using files 'ModelNNT11.xml' and 'changed.m' available from http://www.har.mrc.ac.uk/research/bioinformatics/research_areas/systems_biology.html .

A couple of small errors in the model (in the original SBML file 'ModelNNT11.xml') have been corrected. The errors are:

- v44 now produces Pyr rather than PYR

- the kinetic law of v27 is now dependent on cytoplasmic (rather than mitochondrial) acetyl CoA and OXA