[BIOMD0000000402](http://www.ebi.ac.uk/biomodels-main/BIOMD0000000402)
----------------------------------------------------------------------
Ayati2010_BoneRemodelingDynamics_WithTumour
======================================================================

Model
-----

* **Model File:** BIOMD0000000402.em
* **Submitter:** Yasuhiro Naito
* **Encoders:** Yasuhiro Naito

Description from BioModels
--------------------------

### Reference Publication

* **Publication ID:** [20406449](http://www.ncbi.nlm.nih.gov/pubmed/20406449)
* Ayati BP, Edwards CM, Webb GF, Wikswo JP. 
A mathematical model of bone remodeling dynamics for normal bone cell populations and myeloma bone disease. 
Biol. Direct 2010; 5: 28 
Department of Mathematics, University of Iowa, Iowa City, IA 52242, USA. ayati@math.uiowa.edu  

### Model

* **Original Model:** [BIOMD0000000402.xml.origin](http://www.ebi.ac.uk/biomodels/models-main/publ/BIOMD0000000402/BIOMD0000000402.xml.origin)
* **Submitter:** Vijayalakshmi Chelliah
* **Encoders:** Vijayalakshmi Chelliah, Bruce P Ayati

### Notes

This a model from the article:  
A mathematical model of bone remodeling dynamics for normal bone cell populations and myeloma bone disease  
Bruce P Ayati, Claire M Edwards, Glenn F Webb and John P Wikswo. Biology Direct 2010 Apr 20;5(28). 20406449 ,  

Abstract:  
BACKGROUND: Multiple myeloma is a hematologic malignancy associated with the development of a destructive osteolytic bone disease. RESULTS: Mathematical models are developed for normal bone remodeling and for the dysregulated bone remodeling that occurs in myeloma bone disease. The models examine the critical signaling between osteoclasts (bone resorption) and osteoblasts (bone formation). The interactions of osteoclasts and osteoblasts are modeled as a system of differential equations for these cell populations, which exhibit stable oscillations in the normal case and unstable oscillations in the myeloma case. In the case of untreated myeloma, osteoclasts increase and osteoblasts decrease, with net bone loss as the tumor grows. The therapeutic effects of targeting both myeloma cells and cells of the bone marrow microenvironment on these dynamics are examined. CONCLUSIONS: The current model accurately reflects myeloma bone disease and illustrates how treatment approaches may be investigated using such computational approaches.  

Note:  
The paper describes three models 1) Zero-dimensional Bone Model without Tumour, 2) Zero-dimensional Bone Model with Tumour and 3) Zero-dimensional Bone Model with Tumour and Drug Treatment. This model corresponds to the Zero-dimensional Bone Model with Tumour.  

Typos in the publication:  
Equation (4): The first term should be (β1/α1)^(g12/Γ) and not (β2/α2)^(g12/Γ)  
Equation (14): The first term should be (β1/α1)^(((g12/(1+r12))/Γ) and not (β2/α2)^(((g12/(1+r12))/Γ)  
Equation (13): The first term should be (β1/α1)^((1-g22+r22)/Γ) and not (β1/α1)^((1-g22-r22)/Γ)  
All these corrections has been implemented in the model, with the authors agreement.  
Beyond these, there are several mismatches between the equation numbers that are mentioned in for each equation and the reference that has been made to these equations in the figure legend.  