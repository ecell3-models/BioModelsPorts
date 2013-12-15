[BIOMD0000000067](http://www.ebi.ac.uk/biomodels-main/BIOMD0000000067)
----------------------------------------------------------------------
Fung2005_Metabolic_Oscillator
======================================================================

Model
-----

* **Model File:** BIOMD0000000067.em
* **Submitter:** Yasuhiro Naito
* **Encoders:** Yasuhiro Naito

Description from BioModels
--------------------------

### Reference Publication

* **Publication ID:** [15875027](http://www.ncbi.nlm.nih.gov/pubmed/15875027)
* Fung E, Wong WW, Suen JK, Bulter T, Lee SG, Liao JC. 
A synthetic gene-metabolic oscillator. 
Nature 2005 May; 435(7038): 118-122 
Department of Chemical Engineering, University of California-Los Angeles, Los Angeles, California 90095, USA.  

### Model

* **Original Model:** [BIOMD0000000067.xml.origin](http://www.ebi.ac.uk/biomodels/models-main/publ/BIOMD0000000067/BIOMD0000000067.xml.origin)
* **Submitter:** Harish Dharuri
* **Encoders:**  Harish Dharuri
set #1	
bqbiol:occursIn	Taxonomy Escherichia coli (strain K12)

### Notes

A Synthetic Gene-Metabolic Oscillator  
Reference: Fung et al; Nature (2005) 435:118-122  
Name of kinetic law	Reaction  
Glycolytic flux, V_gly:	nil -> AcCoA;  
Flux to TCA cycle/ETOH, V_TCA:	AcCoA -> TCA/EtOH;  
HOAc ex/import,reversible, V_out:	HOAc -> HOAc_E  
V_Pta:	AcCoA + Pi -> AcP + CoA  
reversible, V_Ack:	AcP + ADP -> OAc + ATP  
V_Acs:	OAC + ATP -> AcCoA +PPi  
Acetic acid-base equillibrium, reversible, V_Ace:	OAC + H -> HOAc  
Expression of LacI, R_LacI:	nil -> LacI  
Expression of Acs, R_Acs:	nil -> Acs  
Expression of Pta, R_Pta:	nil -> Pta  
LacI degradation, R_dLacI:	LacI -> nil  
Acs degradation, R_dAcs:	Acs -> nil  
Pta degradation, R_dPta:	Pta -> nil  
For this model the differential equation for V_Ace was changed from:  
C*(AcP*H-K_eq*OAC) with C = 100 in the supplemental material  
to C*(OAc*H-K_eq*HOAc) with C = 100, as in Bulter et. al; PNAS(2004),101,2299-2304 , and a value for K_eq of 5*10^-4 after communication with the authors.  
translated to SBML by:  
Lukas Endler(luen at tbi.univie.ac.at), Christoph Flamm (xtof at tbi.univie.ac.at)  
Biomodels Curation The model reproduces 3a of the paper for glycolytic flux Vgly = 0.5. The authors have agreed that the values on Y-axis are marked wrong and hence there is a discrepancy between model simulation results and the figure. Also, note that the values of concentration and time are in dimensionless units. The model was successfully tested on MathSBML and Jarnac.  