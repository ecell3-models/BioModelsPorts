# BIOMD0000000239 - Jiang2007 - GSIS system, Pancreatic Beta Cells
# 
# Jiang N, Cox RD, Hancock JM. 
# A kinetic core model of the glucose-stimulated insulin secretion network of pancreatic beta cells. 
# Mamm. Genome 2007 Jul; 18(6-7): 508-520 
# Bioinformatics Group, MRC Mammalian Genetics Unit, Harwell, Oxfordshire, OX11 0RD, UK.


##### Steppers #####

Stepper FixedODE1Stepper( ODE ) {}

##### Model Entities #####

System System( / )
{
	StepperID ODE;

	Variable Variable( SIZE ){ Value 1.0; }

	#### Global Parameters (1) ####

	Variable Variable( flow ) { Value 0.011; Fixed 1; }
	
}

System System( /cytoplasm )
{
	StepperID ODE;
	
	Name "cytoplasm";

	Variable Variable( SIZE ){ Value 1.0; }

	##### Physical entities (26) #####

	Variable Variable( glucose )
	{
		Name "glucose";
		Value 1.12817E-5;
	}

	Variable Variable( fructose_6_phosphate )
	{
		Name "fructose-6-phosphate";
		Value 6.5939E-4;
	}

	Variable Variable( fructose_1_6_bisphosphate )
	{
		Name "fructose-1,6-bisphosphate";
		Value 7.70135E-6;
	}

	Variable Variable( glyceraldehyde_3_phosphate )
	{
		Name "glyceraldehyde 3-phosphate";
		Value 1.90919E-6;
	}

	Variable Variable( _1_2_bisphospho_D_glycerate )
	{
		Name "1,2-bisphospho-D-glycerate";
		Value 2.99109E-4;
	}

	Variable Variable( phosphoenolpyruvate )
	{
		Name "phosphoenolpyruvate";
		Value 2.1125E-6;
	}

	Variable Variable( pyruvate )
	{
		Name "pyruvate";
		Value 4.22702E-6;
	}

	Variable Variable( adenine_monophosphate )
	{
		Name "adenine monophosphate";
		Value 2.61149E-6;
	}

	Variable Variable( lactate )
	{
		Name "lactate";
		Value 3.3981E-4;
	}

	Variable Variable( glycerol_3_phosphate )
	{
		Name "glycerol-3-phosphate";
		Value 0.0076925;
	}

	Variable Variable( dihydrohxyacetone_phosphate )
	{
		Name "dihydrohxyacetone-phosphate";
		Value 0.0076925;
	}

	Variable Variable( oxaloacetate )
	{
		Name "oxaloacetate";
		Value 4.0E-6;
	}

	Variable Variable( aspartate )
	{
		Name "aspartate";
		Value 0.00114;
	}

	Variable Variable( glutamate )
	{
		Name "glutamate";
		Value 0.00303;
	}

	Variable Variable( oxoglutarate )
	{
		Name "oxoglutarate";
		Value 2.1E-5;
	}

	Variable Variable( malate )
	{
		Name "malate";
		Value 5.0E-4;
	}

	Variable Variable( acetyl_CoA )
	{
		Name "acetyl CoA";
		Value 3.0E-5;
	}

	Variable Variable( coenzyme_A )
	{
		Name "coenzyme A";
		Value 2.72E-4;
	}

	Variable Variable( isocitrate )
	{
		Name "isocitrate";
		Value 4.2E-4;
	}

	Variable Variable( citrate )
	{
		Name "citrate";
		Value 4.2E-4;
	}

	Variable Variable( adenine_triphosphate )
	{
		Name "adenine triphosphate";
		Value 0.00449064;
	}

	Variable Variable( adenine_diphosphate )
	{
		Name "adenine diphosphate";
		Value 1.08367E-4;
	}

	Variable Variable( NAD )
	{
		Name "NAD";
		Value 0.00362057;
	}

	Variable Variable( NADH )
	{
		Name "NADH";
		Value 6.16118E-4;
	}

	Variable Variable( NADP )
	{
		Name "NADP";
		Value 0.00362057;
	}

	Variable Variable( NADPH )
	{
		Name "NADPH";
		Value 6.16118E-4;
	}

	#### Reactions (45) ####

	Process ExpressionFluxProcess( GLCflow )
	{
		Name "GLCflow";

		VariableReferenceList
			## Parameters ##
			[flow :/:flow 0]

			## Species ##
			[GLC :/cytoplasm:glucose 1];

		Expression "( Glc_F * 0.001 - GLC.Value ) * flow.Value";

		Glc_F  64.941;
	}

	Process ExpressionFluxProcess( LACflow )
	{
		Name "LACflow";

		VariableReferenceList
			## Parameters ##
			[flow :/:flow 0]

			## Species ##
			[LAC :/cytoplasm:lactate -1];

		Expression "LAC.Value * flow.Value";

	}

	Process ExpressionFluxProcess( GAPflow )
	{
		Name "GAPflow";

		VariableReferenceList
			## Parameters ##
			[flow :/:flow 0]

			## Species ##
			[GAP :/cytoplasm:glyceraldehyde_3_phosphate -1];

		Expression "GAP.Value * flow.Value";

	}

	Process ExpressionFluxProcess( glucokinase )
	{
		Name "glucokinase";

		VariableReferenceList
			## Species ##
			[GLC                  :/cytoplasm:glucose              -1]
			[ATP_cyt              :/cytoplasm:adenine_triphosphate -1]
			[F6P :/cytoplasm:fructose_6_phosphate  1]
			[adenine_diphosphate  :/cytoplasm:adenine_diphosphate   1];

		Expression "V1 * ATP_cyt.Value * GLC.Value / (( K1GLC + GLC.Value ) * ( K1ATP + ATP_cyt.Value ))";

		V1  5.0E-4;
		K1GLC  1.0E-4;
		K1ATP  6.3E-5;
	}

	Process ExpressionFluxProcess( _6_phosphofructokinase )
	{
		Name "6-phosphofructokinase";

		VariableReferenceList
			## Species ##
			[F6P     :/cytoplasm:fructose_6_phosphate      -1]
			[ATP_cyt :/cytoplasm:adenine_triphosphate      -1]
			[FBP     :/cytoplasm:fructose_1_6_bisphosphate  1]
			[ADP_cyt :/cytoplasm:adenine_diphosphate        1]
			[AMP     :/cytoplasm:adenine_monophosphate      0];

		Expression "V2 * ATP_cyt.Value * pow(F6P.Value, 2) / (( K2 * ( 1.0 + k2 * pow( ATP_cyt.Value / AMP.Value, 2 )) + pow( F6P.Value, 2 )) * ( K2ATP + ATP_cyt.Value ))";

		V2  0.0015;
		K2  1.6E-9;
		k2  0.017;
		K2ATP  1.0E-5;
	}

	Process ExpressionFluxProcess( fructose_bisphosphate_aldolase )
	{
		Name "fructose-bisphosphate aldolase";

		VariableReferenceList
			## Species ##
			[FBP :/cytoplasm:fructose_1_6_bisphosphate  -1]
			[GAP :/cytoplasm:glyceraldehyde_3_phosphate  2];

		Expression "( k3f * FBP.Value - k3b * pow( GAP.Value, 2 ))";

		k3f  1.0;
		k3b  0.05;
	}

	Process ExpressionFluxProcess( glyceraldehyde_3_phosphate_dehydrogenase )
	{
		Name "glyceraldehyde 3-phosphate dehydrogenase";

		VariableReferenceList
			## Species ##
			[GAP      :/cytoplasm:glyceraldehyde_3_phosphate  -1]
			[NAD      :/cytoplasm:NAD                         -1]
			[DPG      :/cytoplasm:_1_2_bisphospho_D_glycerate  1]
			[NADH_cyt :/cytoplasm:NADH                         1];

		Expression "V4 * NAD.Value * GAP.Value / (( K4GAP + GAP.Value ) * ( K4NAD + NAD.Value ))";

		V4  0.01;
		K4GAP  0.0010;
		K4NAD  0.0010;
	}

	Process ExpressionFluxProcess( bisphosphoglycerate_phosphotase_1_2 )
	{
		Name "bisphosphoglycerate phosphotase (1/2)";

		VariableReferenceList
			## Species ##
			[DPG     :/cytoplasm:_1_2_bisphospho_D_glycerate -1]
			[ADP_cyt :/cytoplasm:adenine_diphosphate         -1]
			[PEP     :/cytoplasm:phosphoenolpyruvate          1]
			[ATP_cyt :/cytoplasm:adenine_triphosphate         1];

		Expression "( k5f * DPG.Value * ADP_cyt.Value - k5b * PEP.Value * ATP_cyt.Value )";

		k5f  1000.0;
		k5b  500.0;
	}

	Process ExpressionFluxProcess( pyruvate_kinase )
	{
		Name "pyruvate kinase";

		VariableReferenceList
			## Species ##
			[PEP     :/cytoplasm:phosphoenolpyruvate -1]
			[ADP_cyt :/cytoplasm:adenine_diphosphate -1]
			[Pyr_cyt :/cytoplasm:pyruvate             1]
			[ATP_cyt :/cytoplasm:adenine_triphosphate 1];

		Expression "V6 * ADP_cyt.Value * PEP.Value / (( K6PEP + PEP.Value ) * ( K6ADP + ADP_cyt.Value ))";

		V6  0.01;
		K6PEP  2.0E-4;
		K6ADP  3.0E-4;
	}

	Process ExpressionFluxProcess( lactate_dehydrogenase )
	{
		Name "lactate dehydrogenase";

		VariableReferenceList
			## Species ##
			[PYR_cyt  :/cytoplasm:pyruvate -1]
			[NADH_cyt :/cytoplasm:NADH     -1]
			[LAC      :/cytoplasm:lactate   1]
			[NAD      :/cytoplasm:NAD       1];

		Expression "( k8f * NADH_cyt.Value * PYR_cyt.Value - k8b * NAD.Value * LAC.Value )";

		k8f  1000.0;
		k8b  0.143;
	}

	Process ExpressionFluxProcess( hidden_1 )
	{
		Name "hidden_1";

		VariableReferenceList
			## Species ##
			[AMP     :/cytoplasm:adenine_monophosphate -1]
			[ATP_cyt :/cytoplasm:adenine_triphosphate  -1]
			[ADP_cyt :/cytoplasm:adenine_diphosphate    2];

		Expression "( k9f * AMP.Value * ATP_cyt.Value - k9b * pow( ADP_cyt.Value, 2))";

		k9f  10000.0;
		k9b  10000.0;
	}

	Process ExpressionFluxProcess( citrate_synthase )
	{
		Name "citrate synthase";

		VariableReferenceList
			## Species ##
			[Cit_cyt        :/cytoplasm:citrate      -1]
			[CoA_cyt        :/cytoplasm:coenzyme_A   -1]
			[OXA_cyt        :/cytoplasm:oxaloacetate  1]
			[Acetyl_CoA_cyt :/cytoplasm:acetyl_CoA    1];

		Expression "Kid * Kc * V * Acetyl_CoA_cyt.Value * OXA_cyt.Value * CS / ( Acetyl_CoA_cyt.Value * OXA_cyt.Value + Ka * OXA_cyt.Value + Kb * Acetyl_CoA_cyt.Value + Kia * Kib ) / ( Keq * Kia * Kb )";

		V  0.004833;
		Ka  5.0E-6;
		Kb  4.5E-6;
		Kc  3.9E-5;
		Kia  5.0E-6;
		Kib  4.5E-6;
		Kid  0.0043;
		Keq  1.8E7;
		CS  3.8617E-7;
	}

	Process ExpressionFluxProcess( aconitase )
	{
		Name "aconitase";

		VariableReferenceList
			## Species ##
			[Cit_cyt   :/cytoplasm:citrate    -1]
			[IsoCitcyt :/cytoplasm:isocitrate  1];

		Expression "( KcF * Kp * Cit_cyt.Value - KcR * Ks * IsoCitcyt.Value ) * ACO / ( Ks * IsoCitcyt.Value + Kp * Cit_cyt.Value + Ks * Kp )";

		Ks  5.0E-4;
		Kp  1.1E-4;
		KcF  20.47;
		KcR  31.44;
		ACO  3.8617E-7;
	}

	Process ExpressionFluxProcess( malate_dehydrogenase_cytosol )
	{
		Name "malate dehydrogenase (cytosol)";

		VariableReferenceList
			## Species ##
			[NADH_cyt :/cytoplasm:NADH         -1]
			[OXA_cyt  :/cytoplasm:oxaloacetate -1]
			[Mal_cyt  :/cytoplasm:malate        1]
			[NAD      :/cytoplasm:NAD           1];

		Expression "MDH * ( k1 * k2 * k3 * k4 * NADH_cyt.Value * OXA_cyt.Value - kminus1 * kminus2 * kminus3 * kminus4 * Mal_cyt.Value * NAD.Value ) / ( kminus1 * ( kminus2 + k3 ) * k4 + k1 * ( kminus2 + k3 ) * k4 * NADH_cyt.Value + kminus1 * ( kminus2 + k3 ) * kminus4 * NAD.Value + k2 * k3 * k4 * OXA_cyt.Value + kminus1 * kminus2 * kminus3 * Mal_cyt.Value + k1 * k2 * ( k3 + k4 ) * NADH_cyt.Value * OXA_cyt.Value + ( kminus1 + kminus2 ) * kminus3 * kminus4 * Mal_cyt.Value * NAD.Value + k1 + kminus2 + kminus3 * NADH_cyt.Value * Mal_cyt.Value + k1 * k2 * kminus3 * NADH_cyt.Value * OXA_cyt.Value * Mal_cyt.Value + k2 * k3 * kminus4 * OXA_cyt.Value * NAD.Value + k2 * kminus3 * kminus4 * OXA_cyt.Value * Mal_cyt.Value * NAD.Value )";

		k1  3.4E7;
		k2  3.5E7;
		k3  4650.0;
		k4  214.0;
		kminus1  26.0;
		kminus2  1400.0;
		kminus3  570000.0;
		kminus4  260000.0;
		MDH  3.8617E-7;
	}

	Process ExpressionFluxProcess( aspartate_transaminase )
	{
		Name "aspartate transaminase";

		VariableReferenceList
			## Species ##
			[Asp_cyt :/cytoplasm:aspartate    -1]
			[OG_cyt  :/cytoplasm:oxoglutarate -1]
			[OXA_cyt :/cytoplasm:oxaloacetate  1]
			[Glu_cyt :/cytoplasm:glutamate     1];

		Expression "KcF * KcR * AspTA * ( Asp_cyt.Value * OG_cyt.Value - OXA_cyt.Value * Glu_cyt.Value / Keq ) / ( KcR * KmS2 * Asp_cyt.Value + KcR * KmS1 * OG_cyt.Value + KcF * KmP2 * OXA_cyt.Value / Keq + KcF * KmP1 * Glu_cyt.Value / Keq + KcR * Asp_cyt.Value * OG_cyt.Value + KcF * KmP2 * Asp_cyt.Value * OXA_cyt.Value / ( Keq * KiS1 ) + KcF * OXA_cyt.Value * Glu_cyt.Value / Keq + KcR * KmS1 * OG_cyt.Value * Glu_cyt.Value / KiP2 )";

		KmS1  9.0E-4;
		KmS2  1.0E-4;
		KmP1  4.0E-5;
		KmP2  0.0040;
		KiS1  0.0020;
		KiP2  0.0083;
		Keq  6.2;
		KcF  300.0;
		KcR  1000.0;
		AspTA  3.8617E-7;
	}

	Process ExpressionFluxProcess( glycerol_3_phosphate_dehydrogenase_FAD_dependent )
	{
		Name "glycerol-3-phosphate dehydrogenase (FAD dependent)";

		VariableReferenceList
			## Species ##
			[G3P   :/cytoplasm:glycerol_3_phosphate        -1]
			[FAD   :/mitochondrial_matrix:FAD              -1]
			[FADH2 :/mitochondrial_matrix:FADH2             1]
			[DHAP  :/cytoplasm:dihydrohxyacetone_phosphate  1];

		Expression "V * GUT2P * G3P.Value / ( K + G3P.Value )";

		K  3.4E-5;
		V  3.99E-8;
		GUT2P  0.0010;
	}

	Process ExpressionFluxProcess( glycerol_3_phosphate_dehydrogenase_NAD_plus_dependent )
	{
		Name "glycerol-3-phosphate dehydrogenase (NAD+ dependent)";

		VariableReferenceList
			## Species ##
			[NADH_cyt :/cytoplasm:NADH                        -1]
			[DHAP     :/cytoplasm:dihydrohxyacetone_phosphate -1]
			[G3P      :/cytoplasm:glycerol_3_phosphate         1]
			[NAD      :/cytoplasm:NAD                          1];

		Expression "V * GUT2P * NADH_cyt.Value / ( K + NADH_cyt.Value )";

		K  34.0;
		V  0.0399;
		GUT2P  0.0010;
	}

	Process ExpressionFluxProcess( cytosolic_isocitrate_dehydrogenase )
	{
		Name "cytosolic isocitrate dehydrogenase";

		VariableReferenceList
			## Species ##
			[IsoCitcyt :/cytoplasm:isocitrate                -1]
			[NADP_cyt  :/cytoplasm:NADP                      -1]
			[OG_cyt    :/cytoplasm:oxoglutarate               1]
			[NADPH_cyt :/cytoplasm:NADPH                      1]
			[CO2       :/mitochondrial_matrix:carbon_dioxide  0];

		Expression "IDHc * ( IsoCitcyt.Value * NADP_cyt.Value / ( phi0 * IsoCitcyt.Value * NADP_cyt.Value + phi1 * NADP_cyt.Value + phi2 * IsoCitcyt.Value + phi12 ) - OG_cyt.Value * NADPH_cyt.Value * CO2.Value / ( phir0 * OG_cyt.Value * NADPH_cyt.Value * CO2.Value + phir1 * NADPH_cyt.Value * CO2.Value + phir2 * OG_cyt.Value * CO2.Value + phir3 * OG_cyt.Value * NADPH_cyt.Value + phir12 * CO2.Value + phir13 * NADPH_cyt.Value + phir23 * OG_cyt.Value + phir123 ))";

		phi0  0.051;
		phi1  9.5E-8;
		phi2  9.6E-7;
		phi12  9.0E-8;
		phir0  0.066;
		phir1  3.7E-7;
		phir2  2.9E-5;
		phir3  2.5E-4;
		phir12  6.0E-12;
		phir13  1.3E-10;
		phir23  9.4E-8;
		phir123  4.6E-14;
		IDHc  3.8617E-7;
	}

	Process ExpressionFluxProcess( malate_dehydrogenase_oxaloacetate_decarboxylating_NADP_plus )
	{
		Name "malate dehydrogenase (oxaloacetate-decarboxylating) (NADP+)";

		VariableReferenceList
			## Species ##
			[Mal_cyt   :/cytoplasm:malate   -1]
			[NADP_cyt  :/cytoplasm:NADP     -1]
			[NADPH_cyt :/cytoplasm:NADPH     1]
			[Pyr_cyt   :/cytoplasm:pyruvate  1];

		Expression "MDH * Kcat * Mal_cyt.Value * NADP_cyt.Value / (( Kmal + Mal_cyt.Value ) * ( Knadp + NADP_cyt.Value ))";

		Kcat  0.333;
		Kmal  1.25E-4;
		Knadp  0.011;
		MDH  3.8617E-7;
	}

}

System System( /mitochondrial_intermembrane_space )
{
	StepperID ODE;
	
	Name "mitochondrial intermembrane space";

	Variable Variable( SIZE ){ Value 1.0; }

	##### Physical entities #####

	Variable Variable( ubiquinone )
	{
		Name "ubiquinone";
		Value 0.026;
	}

	Variable Variable( ubiquinol )
	{
		Name "ubiquinol";
		Value 0.028;
	}

	Variable Variable( ferrocytochrome_c )
	{
		Name "ferrocytochrome c";
		Value 0.0030;
	}

	Variable Variable( ferricytochrome_c )
	{
		Name "ferricytochrome c";
		Value 1.1E-4;
	}

	Process ExpressionFluxProcess( ubiquinol_cytochrome_c_oxidoreductase )
	{
		Name "ubiquinol:cytochrome c oxidoreductase";

		VariableReferenceList
			## Species ##
			[QH2    :/mitochondrial_intermembrane_space:ubiquinol         -1]
			[Cytc3p :/mitochondrial_intermembrane_space:ferrocytochrome_c -2]
			[Q      :/mitochondrial_intermembrane_space:ubiquinone         1]
			[Cytc2p :/mitochondrial_intermembrane_space:ferricytochrome_c  2];

		Expression "KcF * Complex_III * QH2.Value * Cytc3p.Value / (( KmA * Kq2 * Kb2 + KmA * Kq2 * Cytc3p.Value + KcF / k8 * Kq1 * QH2.Value * Kb1 + KcF / k8 * Kq1 * QH2.Value * Cytc3p.Value ) * Cytc2p.Value + KmA * Cytc3p.Value + KmB * QH2.Value + QH2.Value * Cytc3p.Value )";

		KmA  2.8E-5;
		KmB  3.0E-6;
		Kb1  5.4E-6;
		Kb2  5.7E-6;
		Kq1  2.8E-6;
		Kq2  1.9E-6;
		k8  622.1;
		KcF  426.8;
		Complex_III  9.963E-9;
	}

	Process ExpressionFluxProcess( cytochrome_c_oxidase )
	{
		Name "cytochrome c oxidase";

		VariableReferenceList
			## Species ##
			[Cytc2p :/mitochondrial_intermembrane_space:ferricytochrome_c -1]
			[Cytc3p :/mitochondrial_intermembrane_space:ferrocytochrome_c  1];

		Expression "KcF * Complex_IV * Cytc2p.Value / ( Ks + Cytc2p.Value )";

		Ks  1.1E-4;
		KcF  9.35E-4;
		Complex_IV  0.002325;
	}

}

System System( /mitochondrial_inner_membrane )
{
	StepperID ODE;
	
	Name "mitochondrial inner membrane";

	Variable Variable( SIZE ){ Value 1.0; }

	Process ExpressionFluxProcess( pyruvate_carrier )
	{
		Name "pyruvate carrier";

		VariableReferenceList
			## Species ##
			[PYR_cyt :/cytoplasm:pyruvate            -1]
			[Pyr     :/mitochondrial_matrix:pyruvate  1];

		Expression "V * PYR_cyt.Value * PYC / ( K + PYR_cyt.Value )";

		V  1.0E-8;
		K  1.5E-7;
		PYC  3.3211E-4;
	}

	Process ExpressionFluxProcess( aspartate_glutamate_carrier )
	{
		Name "aspartate/glutamate carrier";

		VariableReferenceList
			## Species ##
			[Glu_cyt :/cytoplasm:glutamate            -1]
			[Asp     :/mitochondrial_matrix:aspartate -1]
			[Asp_cyt :/cytoplasm:aspartate             1]
			[Glu     :/mitochondrial_matrix:glutamate  1];

		Expression "( Asp.Value * Glu_cyt.Value / alpha / KiS1 / KiS2 * KcF - Glu.Value * Asp_cyt.Value / beta / KiP1 / KiP2 * KcR ) * AGC / ( 1 + Asp.Value / KiS1 + Glu_cyt.Value / KiS2 + Glu.Value / KiP1 + Asp_cyt.Value / KiP2 + Asp.Value * Glu_cyt.Value / alpha / KiS1 / KiS2 + Glu.Value * Asp_cyt.Value / beta / KiP1 / KiP2 + Glu_cyt.Value * Asp_cyt.Value / gamma / KiS2 / KiP2 + Asp.Value * Glu.Value / delta / KiS1 / KiP1 )";

		KiS1  8.0E-5;
		KiS2  0.0032;
		KiP1  1.8E-4;
		KiP2  0.0028;
		KcF  10.0;
		KcR  10.0;
		alpha  1.0;
		beta  1.0;
		gamma  1.0;
		delta  1.0;
		AGC  3.3211E-4;
	}

	Process ExpressionFluxProcess( oxoglutarate_carrier )
	{
		Name "oxoglutarate carrier";

		VariableReferenceList
			## Species ##
			[Mal_cyt :/cytoplasm:malate                  -1]
			[OG      :/mitochondrial_matrix:oxoglutarate -1]
			[OG_cyt  :/cytoplasm:oxoglutarate             1]
			[Mal     :/mitochondrial_matrix:malate        1];

		Expression "( OG.Value * Mal_cyt.Value / alpha / KiS1 / KiS2 * KcF - Mal.Value * OG_cyt.Value / beta / KiP1 / KiP2 * KcR ) * OGC / ( 1 + OG.Value / KiS1 + Mal_cyt.Value / KiS2 + Mal.Value / KiP1 + OG_cyt.Value / KiP2 + OG.Value * Mal_cyt.Value / alpha / KiS1 / KiS2 + Mal.Value * OG_cyt.Value / beta / KiP1 / KiP2 + Mal_cyt.Value * OG_cyt.Value / gamma / KiS2 / KiP2 + OG.Value * Mal.Value / delta / KiS1 / KiP1 )";

		KiS1  3.0E-4;
		KiS2  7.0E-4;
		KiP1  0.0014;
		KiP2  1.7E-4;
		KcF  3.675;
		KcR  4.83;
		alpha  1.0;
		beta  1.0;
		gamma  1.0;
		delta  1.0;
		OGC  3.3211E-4;
	}

	Process ExpressionFluxProcess( citrate_carrier )
	{
		Name "citrate carrier";

		VariableReferenceList
			## Species ##
			[Cit_cyt :/cytoplasm:citrate           -1]
			[Mal     :/mitochondrial_matrix:malate -1]
			[Mal_cyt :/cytoplasm:malate             1]
			[Cit     :/mitochondrial_matrix:citrate 1];

		Expression "( Cit_cyt.Value * Mal.Value / alpha / KiS1 / KiS2 * KcF - Mal_cyt.Value * Cit.Value / beta / KiP1 / KiP2 * KcR ) * CIC / ( 1 + Cit_cyt.Value / KiS1 + Mal.Value / KiS2 + Mal_cyt.Value / KiP1 + Cit.Value / KiP2 + Cit_cyt.Value * Mal.Value / alpha / KiS1 / KiS2 + Mal_cyt.Value * Cit.Value / beta / KiP1 / KiP2 + Mal.Value * Cit.Value / gamma / KiS2 / KiP2 + Cit_cyt.Value * Mal_cyt.Value / delta / KiS1 / KiP1 )";

		KiS1  1.3E-4;
		KiS2  4.4E-4;
		KiP1  3.3E-4;
		KiP2  4.18E-5;
		KcF  5.6;
		KcR  3.5;
		alpha  1.0;
		beta  1.0;
		gamma  1.0;
		delta  1.0;
		CIC  3.3211E-4;
	}

	Process ExpressionFluxProcess( ATP_ADP_carrier )
	{
		Name "ATP/ADP carrier";

		VariableReferenceList
			## Species ##
			[ADP_cyt :/cytoplasm:adenine_diphosphate            -1]
			[ADP     :/mitochondrial_matrix:adenine_diphosphate  1];

		Expression "V * AAC * ADP_cyt.Value / ( K + ADP_cyt.Value )";

		V  0.1667;
		K  0.012;
		AAC  3.3211E-4;
	}

	Process ExpressionFluxProcess( citrate_carrier_2 )
	{
		Name "citrate carrier";

		VariableReferenceList
			## Species ##
			[IsoCitcyt :/cytoplasm:isocitrate            -1]
			[Mal       :/mitochondrial_matrix:malate     -1]
			[Mal_cyt   :/cytoplasm:malate                 1]
			[IsoCit    :/mitochondrial_matrix:isocitrate  1];

		Expression "( IsoCitcyt.Value * Mal.Value / alpha / KiS1 / KiS2 * KcF - Mal_cyt.Value * IsoCit.Value / beta / KiP1 / KiP2 * KcR ) * CIC / ( 1 + IsoCitcyt.Value / KiS1 + Mal.Value / KiS2 + Mal_cyt.Value / KiP1 + IsoCit.Value / KiP2 + IsoCitcyt.Value * Mal.Value / alpha / KiS1 / KiS2 + Mal_cyt.Value * IsoCit.Value / beta / KiP1 / KiP2 + Mal.Value * IsoCit.Value / gamma / KiS2 / KiP2 + IsoCitcyt.Value * Mal_cyt.Value / delta / KiS1 / KiP1 )";

		KiS1  1.3E-4;
		KiS2  4.4E-4;
		KiP1  3.3E-4;
		KiP2  4.18E-5;
		KcF  5.6;
		KcR  3.5;
		alpha  1.0;
		beta  1.0;
		gamma  1.0;
		delta  1.0;
		CIC  3.3211E-4;
	}

	Process ExpressionFluxProcess( ATP_ADP_carrier_2 )
	{
		Name "ATP/ADP carrier";

		VariableReferenceList
			## Species ##
			[ATP     :/mitochondrial_matrix:adenine_triphosphate -1]
			[ATP_cyt :/cytoplasm:adenine_triphosphate             1];

		Expression "V * AAC * ATP.Value / ( K + ATP.Value )";

		V  1.11667;
		K  0.0050;
		AAC  3.3211E-4;
	}

}

System System( /mitochondrial_matrix )
{
	StepperID ODE;
	
	Name "mitochondrial matrix";

	Variable Variable( SIZE ){ Value 1.0; }

	##### Physical entities (29) #####

	Variable Variable( pyruvate )
	{
		Name "pyruvate";
		Value 0.001025;
	}

	Variable Variable( carbon_dioxide )
	{
		Name "carbon dioxide";
		Value 0.00163;
	}

	Variable Variable( coenzyme_A )
	{
		Name "coenzyme A";
		Value 2.72E-4;
	}

	Variable Variable( acetyl_CoA )
	{
		Name "acetyl CoA";
		Value 3.0E-5;
	}

	Variable Variable( phosphate )
	{
		Name "phosphate";
		Value 0.0040;
	}

	Variable Variable( fumarate )
	{
		Name "fumarate";
		Value 6.5E-5;
	}

	Variable Variable( succinyl_CoA )
	{
		Name "succinyl-CoA";
		Value 2.941E-4;
	}

	Variable Variable( succinate )
	{
		Name "succinate";
		Value 0.00295;
	}

	Variable Variable( guanosine_triphosphate )
	{
		Name "guanosine triphosphate";
		Value 0.0045;
	}

	Variable Variable( guanosine_diphosphate )
	{
		Name "guanosine diphosphate";
		Value 4.5E-4;
	}

	Variable Variable( slanine )
	{
		Name "slanine";
		Value 0.00344;
	}

	Variable Variable( aspartate )
	{
		Name "aspartate";
		Value 0.00114;
	}

	Variable Variable( glutamate )
	{
		Name "glutamate";
		Value 0.00303;
	}

	Variable Variable( water )
	{
		Name "water";
		Value 0.0010;
	}

	Variable Variable( electron_transfer_flavoprotein__reduced_form )
	{
		Name "electron transfer flavoprotein (reduced form)";
		Value 3.1E-4;
	}

	Variable Variable( electron_transfer_flavoprotein__oxidised_form )
	{
		Name "electron transfer flavoprotein (oxidised form)";
		Value 3.2E-4;
	}

	Variable Variable( FADH2 )
	{
		Name "FADH2";
		Value 7.2E-5;
	}

	Variable Variable( FAD )
	{
		Name "FAD";
		Value 0.00101;
	}

	Variable Variable( oxoglutarate )
	{
		Name "oxoglutarate";
		Value 2.1E-5;
	}

	Variable Variable( malate )
	{
		Name "malate";
		Value 5.0E-4;
	}

	Variable Variable( oxaloacetate )
	{
		Name "oxaloacetate";
		Value 4.0E-6;
	}

	Variable Variable( citrate )
	{
		Name "citrate";
		Value 4.2E-4;
	}

	Variable Variable( isocitrate )
	{
		Name "isocitrate";
		Value 4.2E-4;
	}

	Variable Variable( adenine_triphosphate )
	{
		Name "adenine triphosphate";
		Value 0.0045;
	}

	Variable Variable( adenine_diphosphate )
	{
		Name "adenine diphosphate";
		Value 4.5E-4;
	}

	Variable Variable( NADP_plus )
	{
		Name "NADP+";
		Value 0.0101;
	}

	Variable Variable( NADPH )
	{
		Name "NADPH";
		Value 7.2E-5;
	}

	Variable Variable( NAD_plus )
	{
		Name "NAD+";
		Value 0.0101;
	}

	Variable Variable( NADH )
	{
		Name "NADH";
		Value 7.2E-4;
	}

	Process ExpressionFluxProcess( pyruvate_dehydrogenase_complex )
	{
		Name "pyruvate dehydrogenase complex";

		VariableReferenceList
			## Species ##
			[Pyr        :/mitochondrial_matrix:pyruvate       -1]
			[CoA        :/mitochondrial_matrix:coenzyme_A     -1]
			[NAD_p      :/mitochondrial_matrix:NAD_plus       -1]
			[CO2        :/mitochondrial_matrix:carbon_dioxide  1]
			[Acetyl_CoA :/mitochondrial_matrix:acetyl_CoA      1]
			[NADH       :/mitochondrial_matrix:NADH            1];

		Expression "KcF * PDC * Pyr.Value * CoA.Value * NAD_p.Value / ( KmC * Pyr.Value * CoA.Value + KmB * Pyr.Value * NAD_p.Value + KmA * CoA.Value * NAD_p.Value + Pyr.Value * CoA.Value * NAD_p.Value + KmA * KmP * Kib * Kic / KmR / Kip / Kiq * Acetyl_CoA.Value * NADH.Value + KmC / Kir * Pyr.Value * CoA.Value * NADH.Value + KmB / Kiq * Pyr.Value * NAD_p.Value * Acetyl_CoA.Value + KmA * KmP * Kib * Kic / KmR / Kip / Kia / Kiq * Pyr.Value * Acetyl_CoA.Value * NADH.Value )";

		KmA  2.5E-5;
		KmB  1.3E-5;
		KmC  5.0E-5;
		KmP  5.9E-7;
		KmR  6.9E-7;
		Kia  5.5E-4;
		Kib  3.0E-4;
		Kic  1.8E-4;
		Kip  6.0E-5;
		Kiq  3.5E-5;
		Kir  3.6E-5;
		KcF  856.0;
		PDC  3.8617E-7;
	}

	Process ExpressionFluxProcess( citrate_synthase )
	{
		Name "citrate synthase";

		VariableReferenceList
			## Species ##
			[OXA        :/mitochondrial_matrix:oxaloacetate -1]
			[Acetyl_CoA :/mitochondrial_matrix:acetyl_CoA   -1]
			[Cit        :/mitochondrial_matrix:citrate       1]
			[CoA        :/mitochondrial_matrix:coenzyme_A    1];

		Expression "V * Acetyl_CoA.Value * OXA.Value * CS / ( Acetyl_CoA.Value * OXA.Value + Ka * OXA.Value + Kb * Acetyl_CoA.Value + Kia * Kib )";

		V  0.005267;
		Ka  1.18E-5;
		Kb  4.8E-6;
		Kia  1.0E-5;
		Kib  4.0E-6;
		CS  3.8617E-7;
	}

	Process ExpressionFluxProcess( aconitase )
	{
		Name "aconitase";

		VariableReferenceList
			## Species ##
			[Cit    :/mitochondrial_matrix:citrate    -1]
			[IsoCit :/mitochondrial_matrix:isocitrate  1];

		Expression "( KcF * Kp * Cit.Value - KcR * Ks * IsoCit.Value ) * ACO / ( Ks * IsoCit.Value + Kp * Cit.Value + Ks * Kp )";

		Ks  5.0E-4;
		Kp  1.1E-4;
		KcF  20.47;
		KcR  31.44;
		ACO  3.8617E-7;
	}

	Process ExpressionFluxProcess( isocitrate_dehydrogenase_NAD_plus_alpha_beta_gamma )
	{
		Name "isocitrate dehydrogenase (NAD+) (alpha/beta/gamma)";

		VariableReferenceList
			## Species ##
			[IsoCit :/mitochondrial_matrix:isocitrate          -1]
			[NAD_p  :/mitochondrial_matrix:NAD_plus            -1]
			[OG     :/mitochondrial_matrix:oxoglutarate         1]
			[NADH   :/mitochondrial_matrix:NADH                 1]
			[ADP    :/mitochondrial_matrix:adenine_diphosphate  0];

		Expression "KcF * IDHa * ( IsoCit.Value * IsoCit.Value + b * ADP.Value * IsoCit.Value ) / ( IsoCit.Value * IsoCit.Value + c * IsoCit.Value + d * ADP.Value + e * ADP.Value * IsoCit.Value + f )";

		KcF  105.0;
		b  29.6;
		c  2.3E-4;
		d  7.8E-5;
		e  6.4E-4;
		f  3.6E-4;
		IDHa  3.8617E-7;
	}

	Process ExpressionFluxProcess( oxoglutarate_dehydrogenase_complex )
	{
		Name "oxoglutarate dehydrogenase complex";

		VariableReferenceList
			## Species ##
			[OG    :/mitochondrial_matrix:oxoglutarate   -1]
			[CoA   :/mitochondrial_matrix:coenzyme_A     -1]
			[NAD_p :/mitochondrial_matrix:NAD_plus       -1]
			[CO2   :/mitochondrial_matrix:carbon_dioxide  1]
			[SCoA  :/mitochondrial_matrix:succinyl_CoA    1]
			[NADH  :/mitochondrial_matrix:NADH            1];

		Expression "KcF * OGDC * OG.Value * CoA.Value * NAD_p.Value / ( KmC * OG.Value * CoA.Value + KmB * OG.Value * NAD_p.Value + KmA * CoA.Value * NAD_p.Value + OG.Value * CoA.Value * NAD_p.Value + KmA * KmP * Kib * Kic / KmR / Kip / Kiq * SCoA.Value * NADH.Value + KmC / Kir * OG.Value * CoA.Value * NADH.Value + KmB / Kiq * OG.Value * NAD_p.Value * SCoA.Value + KmA * KmP * Kib * Kic / KmR / Kip / Kia / Kiq * OG.Value * SCoA.Value * NADH.Value )";

		KmA  2.2E-4;
		KmB  2.5E-5;
		KmC  5.0E-5;
		KmP  3.0E-4;
		KmR  6.0E-4;
		Kia  7.2E-4;
		Kib  7.4E-4;
		Kic  1.0E-4;
		Kip  1.1E-6;
		Kiq  8.1E-5;
		Kir  2.5E-5;
		KcF  177.0;
		OGDC  3.8617E-7;
	}

	Process ExpressionFluxProcess( succinyl_CoA_synthetase )
	{
		Name "succinyl-CoA synthetase";

		VariableReferenceList
			## Species ##
			[GDP  :/mitochondrial_matrix:guanosine_diphosphate  -1]
			[SCoA :/mitochondrial_matrix:succinyl_CoA           -1]
			[Pi   :/mitochondrial_matrix:phosphate              -1]
			[Suc  :/mitochondrial_matrix:succinate               1]
			[GTP  :/mitochondrial_matrix:guanosine_triphosphate  1]
			[CoA  :/mitochondrial_matrix:coenzyme_A              1];

		Expression "( GDP.Value * SCoA.Value * pi - Suc.Value * GTP.Value * CoA.Value / Keq ) * ( Kc1 * SCS + Kc2 * SCS * ( KmC * Suc.Value / KmC2 * Kip + pi / KmC2 )) / ( Kia * KmB * pi + KmB * GDP.Value * pi + KmA * SCoA.Value * pi + KmC * GDP.Value * SCoA.Value + GDP.Value * SCoA.Value * pi + GDP.Value * SCoA.Value * pi * pi / KmC2 + Kia * KmB * KmC * Suc.Value / Kip + Kia * KmB * KmC * Suc.Value * GTP.Value / Kip / Kiq + Kia * KmB * KmC * Suc.Value * CoA.Value / Kip / Kir + Kia * KmB * Kic * GTP.Value * CoA.Value / KmQ / Kir + Kia * KmB * KmC * Suc.Value * GTP.Value * CoA.Value / Kip / KmQ / Kir + Kia * KmB * KmC * Suc.Value * Suc.Value * GTP.Value * CoA.Value / Kip / KmP2 / KmQ / Kir + Kia * KmB * pi * GTP.Value / Kiq + Kia * KmB * pi * CoA.Value / Kir + Kia * KmB * pi * GTP.Value * CoA.Value / KmQ / Kir + Kia * KmB * pi * Suc.Value * GTP.Value * CoA.Value / KmP2 / KmQ / Kir + KmB * KmC * GDP.Value * Suc.Value / Kip + KmA * KmC * SCoA.Value * Suc.Value / Kip + KmC * GDP.Value * SCoA.Value * Suc.Value / Kip + KmC * GDP.Value * SCoA.Value * pi * Suc.Value / KmC2 / Kip + KmA * SCoA.Value * pi * GTP.Value / Kiq + KmB * GDP.Value * pi * CoA.Value / Kir + KmA * KmC * SCoA.Value * Suc.Value * GTP.Value / Kip / Kiq + KmB * KmC * GDP.Value * Suc.Value * CoA.Value / Kip / Kir )";

		KmA  5.0E-6;
		KmB  3.5E-5;
		KmC  4.5E-4;
		KmP  6.0E-4;
		KmQ  7.5E-6;
		KmC2  4.5E-4;
		KmP2  6.0E-4;
		Keq  8.375;
		Kia  4.0E-4;
		Kib  2.0E-5;
		Kic  3.0E-5;
		Kip  0.07;
		Kiq  5.0E-6;
		Kir  6.7E-6;
		Kc1  100.0;
		Kc2  100.0;
		SCS  3.8617E-7;
	}

	Process ExpressionFluxProcess( succinate_dehydrogenase )
	{
		Name "succinate dehydrogenase";

		VariableReferenceList
			## Species ##
			[Suc :/mitochondrial_matrix:succinate               -1]
			[Q   :/mitochondrial_intermembrane_space:ubiquinone -1]
			[Fum :/mitochondrial_matrix:fumarate                 1]
			[QH2 :/mitochondrial_intermembrane_space:ubiquinol   1];

		Expression "KcF * KcR * SDH * ( Suc.Value * Q.Value - Fum.Value * QH2.Value / Keq ) / ( KcR * KmS2 * Suc.Value + KcR * KmS1 * Q.Value + KcF * KmP2 * Fum.Value / Keq + KcF * KmP1 * QH2.Value / Keq + KcR * Suc.Value * Q.Value + KcF * KmP2 * Suc.Value * Fum.Value / ( Keq * KiS1 ) + KcF * Fum.Value * QH2.Value / Keq + KcR * KmS1 * Q.Value * QH2.Value / KiP2 )";

		KmS1  3.0E-5;
		KmS2  6.9E-5;
		KmP1  3.0E-7;
		KmP2  1.5E-6;
		KiS1  4.1E-6;
		KiP2  5.6E-6;
		Keq  0.037;
		KcF  69.3;
		KcR  1.73;
		SDH  9.9211E-5;
	}

	Process ExpressionFluxProcess( fumarase )
	{
		Name "fumarase";

		VariableReferenceList
			## Species ##
			[Fum :/mitochondrial_matrix:fumarate -1]
			[Mal :/mitochondrial_matrix:malate    1];

		Expression "( KcF * Kp * Fum.Value - KcR * Ks * Mal.Value ) * FM / ( Ks * Mal.Value + Kp * Fum.Value + Ks * Kp )";

		Kp  2.5E-5;
		Ks  5.0E-6;
		KcF  800.0;
		KcR  900.0;
		FM  3.8617E-7;
	}

	Process ExpressionFluxProcess( malate_dehydrogenase_mitochondrion )
	{
		Name "malate dehydrogenase (mitochondrion)";

		VariableReferenceList
			## Species ##
			[Mal   :/mitochondrial_matrix:malate       -1]
			[NAD_p :/mitochondrial_matrix:NAD_plus     -1]
			[NADH  :/mitochondrial_matrix:NADH          1]
			[OXA   :/mitochondrial_matrix:oxaloacetate  1];

		Expression "( KcF * Mal.Value * NAD_p.Value / KiS1 / KmS2 - KcR * OXA.Value * NADH.Value / KmP1 / KiP2 ) * MDH / ( 1 + Mal.Value / KiS1 + KmS1 * NAD_p.Value / KiS1 / KmS2 + KmP2 * OXA.Value / KmP1 / KiP2 + NADH.Value / KiP2 + Mal.Value * NAD_p.Value / KiS1 / KmS2 + KmP2 * Mal.Value * OXA.Value / KiS1 / KmP1 / KiP2 + KmS1 * NAD_p.Value * NADH.Value / KiS1 / KmS2 / KiP2 + OXA.Value * NADH.Value / KmP1 * KiP2 + Mal.Value * NAD_p.Value * OXA.Value / KiS1 / KmS2 / KiP1 + NAD_p.Value * OXA.Value * NADH.Value / KiS2 / KmP1 / KiP2 )";

		KmS1  7.2E-5;
		KmS2  1.1E-4;
		KmP1  0.0016;
		KmP2  1.7E-4;
		KiS1  1.1E-5;
		KiS2  1.0E-4;
		KiP1  0.0071;
		KiP2  0.0019;
		KcF  0.39;
		KcR  0.04;
		MDH  3.8617E-7;
	}

	Process ExpressionFluxProcess( alanine_transaminase )
	{
		Name "alanine transaminase";

		VariableReferenceList
			## Species ##
			[Ala :/mitochondrial_matrix:slanine      -1]
			[OG  :/mitochondrial_matrix:oxoglutarate -1]
			[Glu :/mitochondrial_matrix:glutamate     1]
			[Pyr :/mitochondrial_matrix:pyruvate      1];

		Expression "KcF * KcR * AlaTA * ( Ala.Value * OG.Value - Glu.Value * Pyr.Value / Keq ) / ( KcR * KmS2 * Ala.Value + KcR * KmS1 * OG.Value + KcF * KmP2 * Glu.Value / Keq + KcF * KmP1 * Pyr.Value / Keq + KcR * Ala.Value * OG.Value + KcF * KmP2 * Ala.Value * Glu.Value / ( Keq * KiS1 ) + KcF * Glu.Value * Pyr.Value / Keq + KcR * KmS1 * OG.Value * Pyr.Value / KiP2 )";

		KmS1  0.0020;
		KmS2  4.0E-4;
		KmP1  0.032;
		KmP2  4.0E-4;
		KiS1  0.0087;
		KiP2  0.012;
		Keq  0.69;
		KcF  337.0;
		KcR  0.15;
		AlaTA  3.8617E-7;
	}

	Process ExpressionFluxProcess( aspartate_transaminase )
	{
		Name "aspartate transaminase";

		VariableReferenceList
			## Species ##
			[OXA :/mitochondrial_matrix:oxaloacetate -1]
			[Glu :/mitochondrial_matrix:glutamate    -1]
			[Asp :/mitochondrial_matrix:aspartate     1]
			[OG  :/mitochondrial_matrix:oxoglutarate  1];

		Expression "KcF * KcR * AspTA * ( OXA.Value * Glu.Value - Asp.Value * OG.Value / Keq ) / ( KcR * KmS2 * OXA.Value + KcR * KmS1 * Glu.Value + KcF * KmP2 * Asp.Value / Keq + KcF * KmP1 * OG.Value / Keq + KcR * OXA.Value * Glu.Value + KcF * KmP2 * OXA.Value * Asp.Value / ( Keq * KiS1 ) + KcF * Asp.Value * OG.Value / Keq + KcR * KmS1 * Glu.Value * OG.Value / KiP2 )";

		KmS1  9.0E-4;
		KmS2  1.0E-4;
		KmP1  4.0E-5;
		KmP2  0.0040;
		KiS1  0.0020;
		KiP2  0.0083;
		Keq  6.2;
		KcF  300.0;
		KcR  1000.0;
		AspTA  3.8617E-7;
	}

	Process ExpressionFluxProcess( NADH_ubiquinone_oxidoreductase )
	{
		Name "NADH:ubiquinone oxidoreductase";

		VariableReferenceList
			## Species ##
			[NADH  :/mitochondrial_matrix:NADH                    -1]
			[Q     :/mitochondrial_intermembrane_space:ubiquinone -1]
			[NAD_p :/mitochondrial_matrix:NAD_plus                 1]
			[QH2   :/mitochondrial_intermembrane_space:ubiquinol   1];

		Expression "KcF * KcR * Complex_I * ( NADH.Value * Q.Value - NAD_p.Value * QH2.Value / Keq ) / ( KcR * KmS2 * NADH.Value + KcR * KmS1 * Q.Value + KcF * KmP2 * NAD_p.Value / Keq + KcF * KmP1 * QH2.Value / Keq + KcR * NADH.Value * Q.Value + KcF * KmP2 * NADH.Value * NAD_p.Value / ( Keq * KiS1 ) + KcF * NAD_p.Value * QH2.Value / Keq + KcR * KmS1 * Q.Value * QH2.Value / KiP2 )";

		KmS1  9.2E-6;
		KmS2  2.6E-4;
		KmP1  9.9E-6;
		KmP2  5.9E-5;
		KiS1  2.1E-8;
		KiP2  9.8E-8;
		Keq  407.9;
		KcF  498.0;
		KcR  229.0;
		Complex_I  3.3211E-4;
	}

	Process ExpressionFluxProcess( ATPase_complex )
	{
		Name "ATPase complex";

		VariableReferenceList
			## Species ##
			[ADP :/mitochondrial_matrix:adenine_diphosphate  -1]
			[Pi :/mitochondrial_matrix:phosphate             -1]
			[ATP :/mitochondrial_matrix:adenine_triphosphate  1]
			[H2O :/mitochondrial_matrix:water                 1];

		Expression "Complex_V * V * ADP.Value / ( Km + ADP.Value + ADP.Value * ADP.Value / Ki )";

		V  0.075;
		Km  0.0045;
		Ki  0.047;
		Complex_V  0.0033211;
	}

	Process ExpressionFluxProcess( ETF_Q_oxidoreductase )
	{
		Name "ETF:Q oxidoreductase";

		VariableReferenceList
			## Species ##
			[ETFred :/mitochondrial_matrix:electron_transfer_flavoprotein__reduced_form  -1]
			[Q      :/mitochondrial_intermembrane_space:ubiquinone                       -1]
			[ETFox  :/mitochondrial_matrix:electron_transfer_flavoprotein__oxidised_form  1]
			[QH2    :/mitochondrial_intermembrane_space:ubiquinol                         1];

		Expression "KcF * KcR * ETF_QO * ( ETFred.Value * Q.Value - ETFox.Value * QH2.Value / Keq ) / ( KcR * KmS2 * ETFred.Value + KcR * KmS1 * Q.Value + KcF * KmP2 * ETFox.Value / Keq + KcF * KmP1 * QH2.Value / Keq + KcR * ETFred.Value * Q.Value + KcF * KmP2 * ETFred.Value * ETFox.Value / ( Keq * KiS1 ) + KcF * ETFox.Value * QH2.Value / Keq + KcR * KmS1 * Q.Value * QH2.Value / KiP2 )";

		KmS1  3.1E-7;
		KmS2  3.9E-7;
		KmP1  3.2E-7;
		KmP2  4.2E-9;
		KiS1  3.1E-7;
		KiP2  3.0E-7;
		Keq  0.66;
		KcF  78.0;
		KcR  101.0;
		ETF_QO  3.3211E-5;
	}

	Process ExpressionFluxProcess( glutathione_reductase )
	{
		Name "glutathione reductase";

		VariableReferenceList
			## Species ##
			[FADH2  :/mitochondrial_matrix:FADH2                                         -1]
			[ETFox  :/mitochondrial_matrix:electron_transfer_flavoprotein__oxidised_form -1]
			[ETFred :/mitochondrial_matrix:electron_transfer_flavoprotein__reduced_form   1]
			[FAD    :/mitochondrial_matrix:FAD                                            1];

		Expression "KcF * KcR * ACD * ( FADH2.Value * ETFox.Value - ETFred.Value * FAD.Value / Keq ) / ( KcR * KiS1 * KmS2 + KcR * KmS2 * FADH2.Value + KcR * KmS1 * ETFox.Value + KcF * KmP2 * ETFred.Value / Keq + KcF * KmP1 * FAD.Value / Keq + KcR * FADH2.Value * ETFox.Value + KcF * KmP2 * FADH2.Value * ETFred.Value / ( Keq * KiS1 ) + KcF * ETFred.Value * FAD.Value / Keq + KcR * KmS1 * ETFox.Value * FAD.Value / KiP2 + KcR * FADH2.Value * ETFox.Value * ETFred.Value / KiP1 + KcF * ETFox.Value * ETFred.Value * FAD.Value / ( KiS2 * Keq ))";

		KmS1  3.9E-5;
		KmS2  1.2E-7;
		KmP1  1.08E-6;
		KmP2  2.42E-5;
		KiS1  7.6E-5;
		KiS2  2.4E-7;
		KiP1  7.53E-5;
		KiP2  1.19E-5;
		Keq  8.99;
		KcF  2.18;
		KcR  0.3;
		ACD  3.3211E-5;
	}

	Process ExpressionFluxProcess( pyruvate_decarboxylase )
	{
		Name "pyruvate decarboxylase";

		VariableReferenceList
			## Species ##
			[ATP :/mitochondrial_matrix:adenine_triphosphate -1]
			[CO2 :/mitochondrial_matrix:carbon_dioxide       -1]
			[Pyr :/mitochondrial_matrix:pyruvate             -1]
			[Pi  :/mitochondrial_matrix:phosphate             1]
			[ADP :/mitochondrial_matrix:adenine_diphosphate   1]
			[OXA :/mitochondrial_matrix:oxaloacetate          1];

		Expression "KcF * KcR * PC * ( ATP.Value * CO2.Value * Pyr.Value - pi * ADP.Value * OXA.Value / Keq ) / ( Kia * KmB * KcR * Pyr.Value + KmC * KcR * ATP.Value * CO2.Value + KmA * KcR * CO2.Value * Pyr.Value + KmB * KcR * ATP.Value * Pyr.Value + KcR * ATP.Value * CO2.Value * Pyr.Value + Kip * KmQ * KcF * OXA.Value / Keq + KmQ * KcF * pi * OXA.Value / Keq + KmP * KcF * ADP.Value * OXA.Value / Keq + KmR * KcF * pi * ADP.Value / Keq + KcF * pi * ADP.Value * OXA.Value / Keq + Kia * KmB * KcR * Pyr.Value * pi / Kip + Kia * KmB * KcR * Pyr.Value * ADP.Value / Kia + Kiq * KmP * KcF * CO2.Value * OXA.Value / Kib / Keq + Kia * KmP * KcF * ATP.Value * OXA.Value / Kia / Keq + KmA * KcR * ATP.Value * CO2.Value * OXA.Value / Kir + KmR * KcF * Pyr.Value * pi * ADP.Value / Kic / Keq + KmA * KcR * CO2.Value * Pyr.Value * ADP.Value / Kiq + KmA * KcR * CO2.Value * Pyr.Value * pi / Kip + KmP * KcF * CO2.Value * ADP.Value * OXA.Value / Kib / Keq + KmQ * KcF * CO2.Value * pi * OXA.Value / Kib / Keq )";

		KmA  1.1E-4;
		KmB  0.00163;
		KmC  3.7E-4;
		KmP  0.016;
		KmQ  2.4E-4;
		KmR  5.1E-5;
		Keq  9.0;
		Kia  1.5E-4;
		Kib  0.0016;
		Kic  1.3E-4;
		Kip  0.0079;
		Kiq  1.9E-4;
		Kir  2.4E-4;
		KcF  200.0;
		KcR  20.0;
		PC  3.8617E-7;
	}

	Process ExpressionFluxProcess( malate_dehydrogenase_oxaloacetate_decarboxylating_NADP_plus )
	{
		Name "malate dehydrogenase (oxaloacetate-decarboxylating) (NADP+)";

		VariableReferenceList
			## Species ##
			[Mal    :/mitochondrial_matrix:malate    -1]
			[NADP_p :/mitochondrial_matrix:NADP_plus -1]
			[NADPH  :/mitochondrial_matrix:NADPH      1]
			[Pyr    :/mitochondrial_matrix:pyruvate   1];

		Expression "MDH * Kcat * Mal.Value / ( Km + Mal.Value )";

		Kcat  130.5;
		Km  0.01295;
		MDH  3.8617E-7;
	}

}

# Originally Ported by Yasuhiro Naito 2013/12/14
