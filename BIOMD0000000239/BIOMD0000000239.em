
# created by eml2em program
# from file: BIOMD0000000239.eml, date: Sun Dec 15 02:34:57 2013
#
# BIOMD0000000239 - Jiang2007 - GSIS system, Pancreatic Beta Cells
# 
# Jiang N, Cox RD, Hancock JM. 
# A kinetic core model of the glucose-stimulated insulin secretion network of pancreatic beta cells. 
# Mamm. Genome 2007 Jul; 18(6-7): 508-520 
# Bioinformatics Group, MRC Mammalian Genetics Unit, Harwell, Oxfordshire, OX11 0RD, UK.

##### Steppers #####

Stepper FixedODE1Stepper( DE ) {}

##### Model Entities #####

System System( / )
{
	StepperID	DE;
	Name	Default;

	Process ExpressionFluxProcess( GLCflow )
	{
		Glc_F	64.941;
		Expression	"CYTOPLASM.Value * (Glc_F * pow(10, -3) - P0.Value / CYTOPLASM.Value) * Param0.Value";
		VariableReferenceList	[ P0 Variable:/CYTOPLASM:GLC 1 ] [ CYTOPLASM Variable:/CYTOPLASM:SIZE 0 ] [ Param0 Variable:/SBMLParameter:flow 0 ];
	}
	
	Process ExpressionFluxProcess( LACflow )
	{
		Expression	"CYTOPLASM.Value * (S0.Value / CYTOPLASM.Value) * Param0.Value";
		VariableReferenceList	[ S0 Variable:/CYTOPLASM:LAC -1 ] [ CYTOPLASM Variable:/CYTOPLASM:SIZE 0 ] [ Param0 Variable:/SBMLParameter:flow 0 ];
	}
	
	Process ExpressionFluxProcess( GAPflow )
	{
		Expression	"CYTOPLASM.Value * (S0.Value / CYTOPLASM.Value) * Param0.Value";
		VariableReferenceList	[ S0 Variable:/CYTOPLASM:GAP -1 ] [ CYTOPLASM Variable:/CYTOPLASM:SIZE 0 ] [ Param0 Variable:/SBMLParameter:flow 0 ];
	}
	
	Process ExpressionFluxProcess( v1 )
	{
		Name	glucokinase;
		V1	0.0005;
		K1GLC	0.0001;
		K1ATP	6.3e-05;
		Expression	"CYTOPLASM.Value * (V1 * (S1.Value / CYTOPLASM.Value) * (S0.Value / CYTOPLASM.Value) / ((K1GLC + S0.Value / CYTOPLASM.Value) * (K1ATP + S1.Value / CYTOPLASM.Value)))";
		VariableReferenceList	[ S0 Variable:/CYTOPLASM:GLC -1 ] [ S1 Variable:/CYTOPLASM:ATP_cyt -1 ] [ P0 Variable:/CYTOPLASM:F6P 1 ] [ P1 Variable:/CYTOPLASM:ADP_cyt 1 ] [ CYTOPLASM Variable:/CYTOPLASM:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( v2 )
	{
		Name	"6-phosphofructokinase";
		V2	0.0015;
		K2	1.6e-09;
		k2	0.017;
		K2ATP	1e-05;
		Expression	"CYTOPLASM.Value * (V2 * (S1.Value / CYTOPLASM.Value) * pow(S0.Value / CYTOPLASM.Value, 2) / ((K2 * (1 + k2 * pow(S1.Value / CYTOPLASM.Value / (C0.Value / CYTOPLASM.Value), 2)) + pow(S0.Value / CYTOPLASM.Value, 2)) * (K2ATP + S1.Value / CYTOPLASM.Value)))";
		VariableReferenceList	[ S0 Variable:/CYTOPLASM:F6P -1 ] [ S1 Variable:/CYTOPLASM:ATP_cyt -1 ] [ P0 Variable:/CYTOPLASM:FBP 1 ] [ P1 Variable:/CYTOPLASM:ADP_cyt 1 ] [ C0 Variable:/CYTOPLASM:AMP 0 ] [ CYTOPLASM Variable:/CYTOPLASM:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( v3 )
	{
		Name	"fructose-bisphosphate aldolase";
		k3f	1.0;
		k3b	0.05;
		Expression	"CYTOPLASM.Value * (k3f * (S0.Value / CYTOPLASM.Value) - k3b * pow(P0.Value / CYTOPLASM.Value, 2))";
		VariableReferenceList	[ S0 Variable:/CYTOPLASM:FBP -1 ] [ P0 Variable:/CYTOPLASM:GAP 2 ] [ CYTOPLASM Variable:/CYTOPLASM:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( v4 )
	{
		Name	"glyceraldehyde 3-phosphate dehydrogenase";
		V4	0.01;
		K4GAP	0.001;
		K4NAD	0.001;
		Expression	"CYTOPLASM.Value * (V4 * (S1.Value / CYTOPLASM.Value) * (S0.Value / CYTOPLASM.Value) / ((K4GAP + S0.Value / CYTOPLASM.Value) * (K4NAD + S1.Value / CYTOPLASM.Value)))";
		VariableReferenceList	[ S0 Variable:/CYTOPLASM:GAP -1 ] [ S1 Variable:/CYTOPLASM:NAD -1 ] [ P0 Variable:/CYTOPLASM:DPG 1 ] [ P1 Variable:/CYTOPLASM:NADH_cyt 1 ] [ CYTOPLASM Variable:/CYTOPLASM:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( v5 )
	{
		Name	"bisphosphoglycerate phosphotase (1/2)";
		k5f	1000.0;
		k5b	500.0;
		Expression	"CYTOPLASM.Value * (k5f * (S0.Value / CYTOPLASM.Value) * (S1.Value / CYTOPLASM.Value) - k5b * (P0.Value / CYTOPLASM.Value) * (P1.Value / CYTOPLASM.Value))";
		VariableReferenceList	[ S0 Variable:/CYTOPLASM:DPG -1 ] [ S1 Variable:/CYTOPLASM:ADP_cyt -1 ] [ P0 Variable:/CYTOPLASM:PEP 1 ] [ P1 Variable:/CYTOPLASM:ATP_cyt 1 ] [ CYTOPLASM Variable:/CYTOPLASM:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( v6 )
	{
		Name	"pyruvate kinase";
		V6	0.01;
		K6PEP	0.0002;
		K6ADP	0.0003;
		Expression	"CYTOPLASM.Value * (V6 * (S1.Value / CYTOPLASM.Value) * (S0.Value / CYTOPLASM.Value) / ((K6PEP + S0.Value / CYTOPLASM.Value) * (K6ADP + S1.Value / CYTOPLASM.Value)))";
		VariableReferenceList	[ S0 Variable:/CYTOPLASM:PEP -1 ] [ S1 Variable:/CYTOPLASM:ADP_cyt -1 ] [ P0 Variable:/CYTOPLASM:PYR_cyt 1 ] [ P1 Variable:/CYTOPLASM:ATP_cyt 1 ] [ CYTOPLASM Variable:/CYTOPLASM:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( v7 )
	{
		Name	"lactate dehydrogenase";
		k8f	1000.0;
		k8b	0.143;
		Expression	"CYTOPLASM.Value * (k8f * (S1.Value / CYTOPLASM.Value) * (S0.Value / CYTOPLASM.Value) - k8b * (P1.Value / CYTOPLASM.Value) * (P0.Value / CYTOPLASM.Value))";
		VariableReferenceList	[ S0 Variable:/CYTOPLASM:PYR_cyt -1 ] [ S1 Variable:/CYTOPLASM:NADH_cyt -1 ] [ P0 Variable:/CYTOPLASM:LAC 1 ] [ P1 Variable:/CYTOPLASM:NAD 1 ] [ CYTOPLASM Variable:/CYTOPLASM:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( hidden_1 )
	{
		k9f	10000.0;
		k9b	10000.0;
		Expression	"CYTOPLASM.Value * (k9f * (S0.Value / CYTOPLASM.Value) * (S1.Value / CYTOPLASM.Value) - k9b * pow(P0.Value / CYTOPLASM.Value, 2))";
		VariableReferenceList	[ S0 Variable:/CYTOPLASM:AMP -1 ] [ S1 Variable:/CYTOPLASM:ATP_cyt -1 ] [ P0 Variable:/CYTOPLASM:ADP_cyt 2 ] [ CYTOPLASM Variable:/CYTOPLASM:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( v8 )
	{
		Name	"pyruvate carrier";
		V	1e-08;
		K	1.5e-07;
		v8_PYC	0.00033211;
		Expression	"MATRIX.Value * (V * (S0.Value / MATRIX.Value) * v8_PYC / (K + S0.Value / MATRIX.Value))";
		VariableReferenceList	[ S0 Variable:/CYTOPLASM:PYR_cyt -1 ] [ P0 Variable:/MATRIX:Pyr 1 ] [ MATRIX Variable:/MATRIX:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( v9 )
	{
		Name	"pyruvate dehydrogenase complex";
		KmA	2.5e-05;
		KmB	1.3e-05;
		KmC	5e-05;
		KmP	5.9e-07;
		KmR	6.9e-07;
		Kia	0.00055;
		Kib	0.0003;
		Kic	0.00018;
		Kip	6e-05;
		Kiq	3.5e-05;
		Kir	3.6e-05;
		KcF	856.0;
		v9_PDC	3.8617e-07;
		Expression	"MATRIX.Value * (KcF * v9_PDC * (S0.Value / MATRIX.Value) * (S1.Value / MATRIX.Value) * (S2.Value / MATRIX.Value) / (KmC * (S0.Value / MATRIX.Value) * (S1.Value / MATRIX.Value) + KmB * (S0.Value / MATRIX.Value) * (S2.Value / MATRIX.Value) + KmA * (S1.Value / MATRIX.Value) * (S2.Value / MATRIX.Value) + S0.Value / MATRIX.Value * (S1.Value / MATRIX.Value) * (S2.Value / MATRIX.Value) + KmA * KmP * Kib * Kic / KmR / Kip / Kiq * (P1.Value / MATRIX.Value) * (P2.Value / MATRIX.Value) + KmC / Kir * (S0.Value / MATRIX.Value) * (S1.Value / MATRIX.Value) * (P2.Value / MATRIX.Value) + KmB / Kiq * (S0.Value / MATRIX.Value) * (S2.Value / MATRIX.Value) * (P1.Value / MATRIX.Value) + KmA * KmP * Kib * Kic / KmR / Kip / Kia / Kiq * (S0.Value / MATRIX.Value) * (P1.Value / MATRIX.Value) * (P2.Value / MATRIX.Value)))";
		VariableReferenceList	[ S0 Variable:/MATRIX:Pyr -1 ] [ S1 Variable:/MATRIX:CoA -1 ] [ S2 Variable:/MATRIX:NAD_p -1 ] [ P0 Variable:/MATRIX:CO2 1 ] [ P1 Variable:/MATRIX:Acetyl_CoA 1 ] [ P2 Variable:/MATRIX:NADH 1 ] [ MATRIX Variable:/MATRIX:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( v10 )
	{
		Name	"citrate synthase";
		V	0.005267;
		Ka	1.18e-05;
		Kb	4.8e-06;
		Kia	1e-05;
		Kib	4e-06;
		v10_CS	3.8617e-07;
		Expression	"MATRIX.Value * (V * (S1.Value / MATRIX.Value) * (S0.Value / MATRIX.Value) * v10_CS / (S1.Value / MATRIX.Value * (S0.Value / MATRIX.Value) + Ka * (S0.Value / MATRIX.Value) + Kb * (S1.Value / MATRIX.Value) + Kia * Kib))";
		VariableReferenceList	[ S0 Variable:/MATRIX:OXA -1 ] [ S1 Variable:/MATRIX:Acetyl_CoA -1 ] [ P0 Variable:/MATRIX:Cit 1 ] [ P1 Variable:/MATRIX:CoA 1 ] [ MATRIX Variable:/MATRIX:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( v11 )
	{
		Name	aconitase;
		Ks	0.0005;
		Kp	0.00011;
		KcF	20.47;
		KcR	31.44;
		v11_ACO	3.8617e-07;
		Expression	"MATRIX.Value * ((KcF * Kp * (S0.Value / MATRIX.Value) - KcR * Ks * (P0.Value / MATRIX.Value)) * v11_ACO / (Ks * (P0.Value / MATRIX.Value) + Kp * (S0.Value / MATRIX.Value) + Ks * Kp))";
		VariableReferenceList	[ S0 Variable:/MATRIX:Cit -1 ] [ P0 Variable:/MATRIX:IsoCit 1 ] [ MATRIX Variable:/MATRIX:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( v12 )
	{
		Name	"isocitrate dehydrogenase (NAD+) (alpha/beta/gamma)";
		KcF	105.0;
		b	29.6;
		c	0.00023;
		d	7.8e-05;
		e	0.00064;
		f	0.00036;
		v12_IDHa	3.8617e-07;
		Expression	"MATRIX.Value * (KcF * v12_IDHa * (S0.Value / MATRIX.Value * (S0.Value / MATRIX.Value) + b * (C0.Value / MATRIX.Value) * (S0.Value / MATRIX.Value)) / (S0.Value / MATRIX.Value * (S0.Value / MATRIX.Value) + c * (S0.Value / MATRIX.Value) + d * (C0.Value / MATRIX.Value) + e * (C0.Value / MATRIX.Value) * (S0.Value / MATRIX.Value) + f))";
		VariableReferenceList	[ S0 Variable:/MATRIX:IsoCit -1 ] [ S1 Variable:/MATRIX:NAD_p -1 ] [ P0 Variable:/MATRIX:OG 1 ] [ P1 Variable:/MATRIX:NADH 1 ] [ C0 Variable:/MATRIX:ADP 0 ] [ MATRIX Variable:/MATRIX:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( v14 )
	{
		Name	"oxoglutarate dehydrogenase complex";
		KmA	0.00022;
		KmB	2.5e-05;
		KmC	5e-05;
		KmP	0.0003;
		KmR	0.0006;
		Kia	0.00072;
		Kib	0.00074;
		Kic	0.0001;
		Kip	1.1e-06;
		Kiq	8.1e-05;
		Kir	2.5e-05;
		KcF	177.0;
		v14_OGDC	3.8617e-07;
		Expression	"MATRIX.Value * (KcF * v14_OGDC * (S0.Value / MATRIX.Value) * (S1.Value / MATRIX.Value) * (S2.Value / MATRIX.Value) / (KmC * (S0.Value / MATRIX.Value) * (S1.Value / MATRIX.Value) + KmB * (S0.Value / MATRIX.Value) * (S2.Value / MATRIX.Value) + KmA * (S1.Value / MATRIX.Value) * (S2.Value / MATRIX.Value) + S0.Value / MATRIX.Value * (S1.Value / MATRIX.Value) * (S2.Value / MATRIX.Value) + KmA * KmP * Kib * Kic / KmR / Kip / Kiq * (P1.Value / MATRIX.Value) * (P2.Value / MATRIX.Value) + KmC / Kir * (S0.Value / MATRIX.Value) * (S1.Value / MATRIX.Value) * (P2.Value / MATRIX.Value) + KmB / Kiq * (S0.Value / MATRIX.Value) * (S2.Value / MATRIX.Value) * (P1.Value / MATRIX.Value) + KmA * KmP * Kib * Kic / KmR / Kip / Kia / Kiq * (S0.Value / MATRIX.Value) * (P1.Value / MATRIX.Value) * (P2.Value / MATRIX.Value)))";
		VariableReferenceList	[ S0 Variable:/MATRIX:OG -1 ] [ S1 Variable:/MATRIX:CoA -1 ] [ S2 Variable:/MATRIX:NAD_p -1 ] [ P0 Variable:/MATRIX:CO2 1 ] [ P1 Variable:/MATRIX:SCoA 1 ] [ P2 Variable:/MATRIX:NADH 1 ] [ MATRIX Variable:/MATRIX:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( v15 )
	{
		Name	"succinyl-CoA synthetase";
		KmA	5e-06;
		KmB	3.5e-05;
		KmC	0.00045;
		KmP	0.0006;
		KmQ	7.5e-06;
		KmC2	0.00045;
		KmP2	0.0006;
		Keq	8.375;
		Kia	0.0004;
		Kib	2e-05;
		Kic	3e-05;
		Kip	0.07;
		Kiq	5e-06;
		Kir	6.7e-06;
		Kc1	100.0;
		Kc2	100.0;
		v15_SCS	3.8617e-07;
		Expression	"MATRIX.Value * ((S0.Value / MATRIX.Value * (S1.Value / MATRIX.Value) * pi - P0.Value / MATRIX.Value * (P1.Value / MATRIX.Value) * (P2.Value / MATRIX.Value) / Keq) * (Kc1 * v15_SCS + Kc2 * v15_SCS * (KmC * (P0.Value / MATRIX.Value) / KmC2 * Kip + pi / KmC2)) / (Kia * KmB * pi + KmB * (S0.Value / MATRIX.Value) * pi + KmA * (S1.Value / MATRIX.Value) * pi + KmC * (S0.Value / MATRIX.Value) * (S1.Value / MATRIX.Value) + S0.Value / MATRIX.Value * (S1.Value / MATRIX.Value) * pi + S0.Value / MATRIX.Value * (S1.Value / MATRIX.Value) * pi * pi / KmC2 + Kia * KmB * KmC * (P0.Value / MATRIX.Value) / Kip + Kia * KmB * KmC * (P0.Value / MATRIX.Value) * (P1.Value / MATRIX.Value) / Kip / Kiq + Kia * KmB * KmC * (P0.Value / MATRIX.Value) * (P2.Value / MATRIX.Value) / Kip / Kir + Kia * KmB * Kic * (P1.Value / MATRIX.Value) * (P2.Value / MATRIX.Value) / KmQ / Kir + Kia * KmB * KmC * (P0.Value / MATRIX.Value) * (P1.Value / MATRIX.Value) * (P2.Value / MATRIX.Value) / Kip / KmQ / Kir + Kia * KmB * KmC * (P0.Value / MATRIX.Value) * (P0.Value / MATRIX.Value) * (P1.Value / MATRIX.Value) * (P2.Value / MATRIX.Value) / Kip / KmP2 / KmQ / Kir + Kia * KmB * pi * (P1.Value / MATRIX.Value) / Kiq + Kia * KmB * pi * (P2.Value / MATRIX.Value) / Kir + Kia * KmB * pi * (P1.Value / MATRIX.Value) * (P2.Value / MATRIX.Value) / KmQ / Kir + Kia * KmB * pi * (P0.Value / MATRIX.Value) * (P1.Value / MATRIX.Value) * (P2.Value / MATRIX.Value) / KmP2 / KmQ / Kir + KmB * KmC * (S0.Value / MATRIX.Value) * (P0.Value / MATRIX.Value) / Kip + KmA * KmC * (S1.Value / MATRIX.Value) * (P0.Value / MATRIX.Value) / Kip + KmC * (S0.Value / MATRIX.Value) * (S1.Value / MATRIX.Value) * (P0.Value / MATRIX.Value) / Kip + KmC * (S0.Value / MATRIX.Value) * (S1.Value / MATRIX.Value) * pi * (P0.Value / MATRIX.Value) / KmC2 / Kip + KmA * (S1.Value / MATRIX.Value) * pi * (P1.Value / MATRIX.Value) / Kiq + KmB * (S0.Value / MATRIX.Value) * pi * (P2.Value / MATRIX.Value) / Kir + KmA * KmC * (S1.Value / MATRIX.Value) * (P0.Value / MATRIX.Value) * (P1.Value / MATRIX.Value) / Kip / Kiq + KmB * KmC * (S0.Value / MATRIX.Value) * (P0.Value / MATRIX.Value) * (P2.Value / MATRIX.Value) / Kip / Kir))";
		VariableReferenceList	[ S0 Variable:/MATRIX:GDP -1 ] [ S1 Variable:/MATRIX:SCoA -1 ] [ S2 Variable:/MATRIX:Pi -1 ] [ P0 Variable:/MATRIX:Suc 1 ] [ P1 Variable:/MATRIX:GTP 1 ] [ P2 Variable:/MATRIX:CoA 1 ] [ MATRIX Variable:/MATRIX:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( v16 )
	{
		Name	"succinate dehydrogenase";
		KmS1	3e-05;
		KmS2	6.9e-05;
		KmP1	3e-07;
		KmP2	1.5e-06;
		KiS1	4.1e-06;
		KiP2	5.6e-06;
		Keq	0.037;
		KcF	69.3;
		KcR	1.73;
		v16_SDH	9.9211e-05;
		Expression	"MATRIX.Value * (KcF * KcR * v16_SDH * (S0.Value / MATRIX.Value * (S1.Value / MATRIX.Value) - P0.Value / MATRIX.Value * (P1.Value / MATRIX.Value) / Keq) / (KcR * KmS2 * (S0.Value / MATRIX.Value) + KcR * KmS1 * (S1.Value / MATRIX.Value) + KcF * KmP2 * (P0.Value / MATRIX.Value) / Keq + KcF * KmP1 * (P1.Value / MATRIX.Value) / Keq + KcR * (S0.Value / MATRIX.Value) * (S1.Value / MATRIX.Value) + KcF * KmP2 * (S0.Value / MATRIX.Value) * (P0.Value / MATRIX.Value) / (Keq * KiS1) + KcF * (P0.Value / MATRIX.Value) * (P1.Value / MATRIX.Value) / Keq + KcR * KmS1 * (S1.Value / MATRIX.Value) * (P1.Value / MATRIX.Value) / KiP2))";
		VariableReferenceList	[ S0 Variable:/MATRIX:Suc -1 ] [ S1 Variable:/MT_IMS:Q -1 ] [ P0 Variable:/MATRIX:Fum 1 ] [ P1 Variable:/MT_IMS:QH2 1 ] [ MATRIX Variable:/MATRIX:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( v17 )
	{
		Name	fumarase;
		Kp	2.5e-05;
		Ks	5e-06;
		KcF	800.0;
		KcR	900.0;
		v17_FM	3.8617e-07;
		Expression	"MATRIX.Value * ((KcF * Kp * (S0.Value / MATRIX.Value) - KcR * Ks * (P0.Value / MATRIX.Value)) * v17_FM / (Ks * (P0.Value / MATRIX.Value) + Kp * (S0.Value / MATRIX.Value) + Ks * Kp))";
		VariableReferenceList	[ S0 Variable:/MATRIX:Fum -1 ] [ P0 Variable:/MATRIX:Mal 1 ] [ MATRIX Variable:/MATRIX:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( v18 )
	{
		Name	"malate dehydrogenase (mitochondrion)";
		KmS1	7.2e-05;
		KmS2	0.00011;
		KmP1	0.0016;
		KmP2	0.00017;
		KiS1	1.1e-05;
		KiS2	0.0001;
		KiP1	0.0071;
		KiP2	0.0019;
		KcF	0.39;
		KcR	0.04;
		v18_MDH	3.8617e-07;
		Expression	"MATRIX.Value * ((KcF * (S0.Value / MATRIX.Value) * (S1.Value / MATRIX.Value) / KiS1 / KmS2 - KcR * (P1.Value / MATRIX.Value) * (P0.Value / MATRIX.Value) / KmP1 / KiP2) * v18_MDH / (1 + S0.Value / MATRIX.Value / KiS1 + KmS1 * (S1.Value / MATRIX.Value) / KiS1 / KmS2 + KmP2 * (P1.Value / MATRIX.Value) / KmP1 / KiP2 + P0.Value / MATRIX.Value / KiP2 + S0.Value / MATRIX.Value * (S1.Value / MATRIX.Value) / KiS1 / KmS2 + KmP2 * (S0.Value / MATRIX.Value) * (P1.Value / MATRIX.Value) / KiS1 / KmP1 / KiP2 + KmS1 * (S1.Value / MATRIX.Value) * (P0.Value / MATRIX.Value) / KiS1 / KmS2 / KiP2 + P1.Value / MATRIX.Value * (P0.Value / MATRIX.Value) / KmP1 * KiP2 + S0.Value / MATRIX.Value * (S1.Value / MATRIX.Value) * (P1.Value / MATRIX.Value) / KiS1 / KmS2 / KiP1 + S1.Value / MATRIX.Value * (P1.Value / MATRIX.Value) * (P0.Value / MATRIX.Value) / KiS2 / KmP1 / KiP2))";
		VariableReferenceList	[ S0 Variable:/MATRIX:Mal -1 ] [ S1 Variable:/MATRIX:NAD_p -1 ] [ P0 Variable:/MATRIX:NADH 1 ] [ P1 Variable:/MATRIX:OXA 1 ] [ MATRIX Variable:/MATRIX:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( v20 )
	{
		Name	"alanine transaminase";
		KmS1	0.002;
		KmS2	0.0004;
		KmP1	0.032;
		KmP2	0.0004;
		KiS1	0.0087;
		KiP2	0.012;
		Keq	0.69;
		KcF	337.0;
		KcR	0.15;
		v20_AlaTA	3.8617e-07;
		Expression	"MATRIX.Value * (KcF * KcR * v20_AlaTA * (S0.Value / MATRIX.Value * (S1.Value / MATRIX.Value) - P0.Value / MATRIX.Value * (P1.Value / MATRIX.Value) / Keq) / (KcR * KmS2 * (S0.Value / MATRIX.Value) + KcR * KmS1 * (S1.Value / MATRIX.Value) + KcF * KmP2 * (P0.Value / MATRIX.Value) / Keq + KcF * KmP1 * (P1.Value / MATRIX.Value) / Keq + KcR * (S0.Value / MATRIX.Value) * (S1.Value / MATRIX.Value) + KcF * KmP2 * (S0.Value / MATRIX.Value) * (P0.Value / MATRIX.Value) / (Keq * KiS1) + KcF * (P0.Value / MATRIX.Value) * (P1.Value / MATRIX.Value) / Keq + KcR * KmS1 * (S1.Value / MATRIX.Value) * (P1.Value / MATRIX.Value) / KiP2))";
		VariableReferenceList	[ S0 Variable:/MATRIX:Ala -1 ] [ S1 Variable:/MATRIX:OG -1 ] [ P0 Variable:/MATRIX:Glu 1 ] [ P1 Variable:/MATRIX:Pyr 1 ] [ MATRIX Variable:/MATRIX:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( v21 )
	{
		Name	"aspartate transaminase";
		KmS1	0.0009;
		KmS2	0.0001;
		KmP1	4e-05;
		KmP2	0.004;
		KiS1	0.002;
		KiP2	0.0083;
		Keq	6.2;
		KcF	300.0;
		KcR	1000.0;
		v21_AspTA	3.8617e-07;
		Expression	"MATRIX.Value * (KcF * KcR * v21_AspTA * (S0.Value / MATRIX.Value * (S1.Value / MATRIX.Value) - P0.Value / MATRIX.Value * (P1.Value / MATRIX.Value) / Keq) / (KcR * KmS2 * (S0.Value / MATRIX.Value) + KcR * KmS1 * (S1.Value / MATRIX.Value) + KcF * KmP2 * (P0.Value / MATRIX.Value) / Keq + KcF * KmP1 * (P1.Value / MATRIX.Value) / Keq + KcR * (S0.Value / MATRIX.Value) * (S1.Value / MATRIX.Value) + KcF * KmP2 * (S0.Value / MATRIX.Value) * (P0.Value / MATRIX.Value) / (Keq * KiS1) + KcF * (P0.Value / MATRIX.Value) * (P1.Value / MATRIX.Value) / Keq + KcR * KmS1 * (S1.Value / MATRIX.Value) * (P1.Value / MATRIX.Value) / KiP2))";
		VariableReferenceList	[ S0 Variable:/MATRIX:OXA -1 ] [ S1 Variable:/MATRIX:Glu -1 ] [ P0 Variable:/MATRIX:Asp 1 ] [ P1 Variable:/MATRIX:OG 1 ] [ MATRIX Variable:/MATRIX:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( v22 )
	{
		Name	"aspartate/glutamate carrier";
		KiS1	8e-05;
		KiS2	0.0032;
		KiP1	0.00018;
		KiP2	0.0028;
		KcF	10.0;
		KcR	10.0;
		alpha	1.0;
		beta	1.0;
		gamma	1.0;
		delta	1.0;
		v22_AGC	0.00033211;
		Expression	"MATRIX.Value * ((S1.Value / MATRIX.Value * (S0.Value / MATRIX.Value) / alpha / KiS1 / KiS2 * KcF - P1.Value / MATRIX.Value * (P0.Value / MATRIX.Value) / beta / KiP1 / KiP2 * KcR) * v22_AGC / (1 + S1.Value / MATRIX.Value / KiS1 + S0.Value / MATRIX.Value / KiS2 + P1.Value / MATRIX.Value / KiP1 + P0.Value / MATRIX.Value / KiP2 + S1.Value / MATRIX.Value * (S0.Value / MATRIX.Value) / alpha / KiS1 / KiS2 + P1.Value / MATRIX.Value * (P0.Value / MATRIX.Value) / beta / KiP1 / KiP2 + S0.Value / MATRIX.Value * (P0.Value / MATRIX.Value) / gamma / KiS2 / KiP2 + S1.Value / MATRIX.Value * (P1.Value / MATRIX.Value) / delta / KiS1 / KiP1))";
		VariableReferenceList	[ S0 Variable:/CYTOPLASM:Glu_cyt -1 ] [ S1 Variable:/MATRIX:Asp -1 ] [ P0 Variable:/CYTOPLASM:Asp_cyt 1 ] [ P1 Variable:/MATRIX:Glu 1 ] [ MATRIX Variable:/MATRIX:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( v24 )
	{
		Name	"NADH:ubiquinone oxidoreductase";
		KmS1	9.2e-06;
		KmS2	0.00026;
		KmP1	9.9e-06;
		KmP2	5.9e-05;
		KiS1	2.1e-08;
		KiP2	9.8e-08;
		Keq	407.9;
		KcF	498.0;
		KcR	229.0;
		v24_Complex_I	0.00033211;
		Expression	"MATRIX.Value * (KcF * KcR * v24_Complex_I * (S0.Value / MATRIX.Value * (S1.Value / MATRIX.Value) - P0.Value / MATRIX.Value * (P1.Value / MATRIX.Value) / Keq) / (KcR * KmS2 * (S0.Value / MATRIX.Value) + KcR * KmS1 * (S1.Value / MATRIX.Value) + KcF * KmP2 * (P0.Value / MATRIX.Value) / Keq + KcF * KmP1 * (P1.Value / MATRIX.Value) / Keq + KcR * (S0.Value / MATRIX.Value) * (S1.Value / MATRIX.Value) + KcF * KmP2 * (S0.Value / MATRIX.Value) * (P0.Value / MATRIX.Value) / (Keq * KiS1) + KcF * (P0.Value / MATRIX.Value) * (P1.Value / MATRIX.Value) / Keq + KcR * KmS1 * (S1.Value / MATRIX.Value) * (P1.Value / MATRIX.Value) / KiP2))";
		VariableReferenceList	[ S0 Variable:/MATRIX:NADH -1 ] [ S1 Variable:/MT_IMS:Q -1 ] [ P0 Variable:/MATRIX:NAD_p 1 ] [ P1 Variable:/MT_IMS:QH2 1 ] [ MATRIX Variable:/MATRIX:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( v25 )
	{
		Name	"ubiquinol:cytochrome c oxidoreductase";
		KmA	2.8e-05;
		KmB	3e-06;
		Kb1	5.4e-06;
		Kb2	5.7e-06;
		Kq1	2.8e-06;
		Kq2	1.9e-06;
		k8	622.1;
		KcF	426.8;
		v25_Complex_III	9.963e-09;
		Expression	"MT_IMS.Value * (KcF * v25_Complex_III * (S0.Value / MT_IMS.Value) * (S1.Value / MT_IMS.Value) / ((KmA * Kq2 * Kb2 + KmA * Kq2 * (S1.Value / MT_IMS.Value) + KcF / k8 * Kq1 * (S0.Value / MT_IMS.Value) * Kb1 + KcF / k8 * Kq1 * (S0.Value / MT_IMS.Value) * (S1.Value / MT_IMS.Value)) * (P1.Value / MT_IMS.Value) + KmA * (S1.Value / MT_IMS.Value) + KmB * (S0.Value / MT_IMS.Value) + S0.Value / MT_IMS.Value * (S1.Value / MT_IMS.Value)))";
		VariableReferenceList	[ S0 Variable:/MT_IMS:QH2 -1 ] [ S1 Variable:/MT_IMS:Cytc3p -2 ] [ P0 Variable:/MT_IMS:Q 1 ] [ P1 Variable:/MT_IMS:Cytc2p 2 ] [ MT_IMS Variable:/MT_IMS:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( v26 )
	{
		Name	"cytochrome c oxidase";
		Ks	0.00011;
		KcF	0.000935;
		v26_Complex_IV	0.002325;
		Expression	"MT_IMS.Value * (KcF * v26_Complex_IV * (S0.Value / MT_IMS.Value) / (Ks + S0.Value / MT_IMS.Value))";
		VariableReferenceList	[ S0 Variable:/MT_IMS:Cytc2p -1 ] [ P0 Variable:/MT_IMS:Cytc3p 1 ] [ MT_IMS Variable:/MT_IMS:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( v27 )
	{
		Name	"citrate synthase";
		V	0.004833;
		Ka	5e-06;
		Kb	4.5e-06;
		Kc	3.9e-05;
		Kia	5e-06;
		Kib	4.5e-06;
		Kid	0.0043;
		Keq	18000000.0;
		v10_CS	3.8617e-07;
		Expression	"CYTOPLASM.Value * Kid * Kc * (V * (P1.Value / CYTOPLASM.Value) * (P0.Value / CYTOPLASM.Value) * v10_CS / (P1.Value / CYTOPLASM.Value * (P0.Value / CYTOPLASM.Value) + Ka * (P0.Value / CYTOPLASM.Value) + Kb * (P1.Value / CYTOPLASM.Value) + Kia * Kib)) / (Keq * Kia * Kb)";
		VariableReferenceList	[ S0 Variable:/CYTOPLASM:Cit_cyt -1 ] [ S1 Variable:/CYTOPLASM:CoA_cyt -1 ] [ P0 Variable:/CYTOPLASM:OXA_cyt 1 ] [ P1 Variable:/CYTOPLASM:Acetyl_CoA_cyt 1 ] [ CYTOPLASM Variable:/CYTOPLASM:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( v28 )
	{
		Name	"ATPase complex";
		V	0.075;
		Km	0.0045;
		Ki	0.047;
		v28_Complex_V	0.0033211;
		Expression	"MATRIX.Value * v28_Complex_V * V * (S0.Value / MATRIX.Value) / (Km + S0.Value / MATRIX.Value + S0.Value / MATRIX.Value * (S0.Value / MATRIX.Value) / Ki)";
		VariableReferenceList	[ S0 Variable:/MATRIX:ADP -1 ] [ S1 Variable:/MATRIX:Pi -1 ] [ P0 Variable:/MATRIX:ATP 1 ] [ P1 Variable:/MATRIX:H2O 1 ] [ MATRIX Variable:/MATRIX:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( v29 )
	{
		Name	aconitase;
		Ks	0.0005;
		Kp	0.00011;
		KcF	20.47;
		KcR	31.44;
		v29_ACO	3.8617e-07;
		Expression	"CYTOPLASM.Value * ((KcF * Kp * (S0.Value / CYTOPLASM.Value) - KcR * Ks * (P0.Value / CYTOPLASM.Value)) * v29_ACO / (Ks * (P0.Value / CYTOPLASM.Value) + Kp * (S0.Value / CYTOPLASM.Value) + Ks * Kp))";
		VariableReferenceList	[ S0 Variable:/CYTOPLASM:Cit_cyt -1 ] [ P0 Variable:/CYTOPLASM:IsoCitcyt 1 ] [ CYTOPLASM Variable:/CYTOPLASM:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( v30 )
	{
		Name	"oxoglutarate carrier";
		KiS1	0.0003;
		KiS2	0.0007;
		KiP1	0.0014;
		KiP2	0.00017;
		KcF	3.675;
		KcR	4.83;
		alpha	1.0;
		beta	1.0;
		gamma	1.0;
		delta	1.0;
		v30_OGC	0.00033211;
		Expression	"MATRIX.Value * ((S1.Value / MATRIX.Value * (S0.Value / MATRIX.Value) / alpha / KiS1 / KiS2 * KcF - P1.Value / MATRIX.Value * (P0.Value / MATRIX.Value) / beta / KiP1 / KiP2 * KcR) * v30_OGC / (1 + S1.Value / MATRIX.Value / KiS1 + S0.Value / MATRIX.Value / KiS2 + P1.Value / MATRIX.Value / KiP1 + P0.Value / MATRIX.Value / KiP2 + S1.Value / MATRIX.Value * (S0.Value / MATRIX.Value) / alpha / KiS1 / KiS2 + P1.Value / MATRIX.Value * (P0.Value / MATRIX.Value) / beta / KiP1 / KiP2 + S0.Value / MATRIX.Value * (P0.Value / MATRIX.Value) / gamma / KiS2 / KiP2 + S1.Value / MATRIX.Value * (P1.Value / MATRIX.Value) / delta / KiS1 / KiP1))";
		VariableReferenceList	[ S0 Variable:/CYTOPLASM:Mal_cyt -1 ] [ S1 Variable:/MATRIX:OG -1 ] [ P0 Variable:/CYTOPLASM:OG_cyt 1 ] [ P1 Variable:/MATRIX:Mal 1 ] [ MATRIX Variable:/MATRIX:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( v31 )
	{
		Name	"malate dehydrogenase (cytosol)";
		k1	34000000.0;
		k2	35000000.0;
		k3	4650.0;
		k4	214.0;
		kminus1	26.0;
		kminus2	1400.0;
		kminus3	570000.0;
		kminus4	260000.0;
		v31_MDH	3.8617e-07;
		Expression	"CYTOPLASM.Value * (v31_MDH * (k1 * k2 * k3 * k4 * (S0.Value / CYTOPLASM.Value) * (S1.Value / CYTOPLASM.Value) - kminus1 * kminus2 * kminus3 * kminus4 * (P0.Value / CYTOPLASM.Value) * (P1.Value / CYTOPLASM.Value)) / (kminus1 * (kminus2 + k3) * k4 + k1 * (kminus2 + k3) * k4 * (S0.Value / CYTOPLASM.Value) + kminus1 * (kminus2 + k3) * kminus4 * (P1.Value / CYTOPLASM.Value) + k2 * k3 * k4 * (S1.Value / CYTOPLASM.Value) + kminus1 * kminus2 * kminus3 * (P0.Value / CYTOPLASM.Value) + k1 * k2 * (k3 + k4) * (S0.Value / CYTOPLASM.Value) * (S1.Value / CYTOPLASM.Value) + (kminus1 + kminus2) * kminus3 * kminus4 * (P0.Value / CYTOPLASM.Value) * (P1.Value / CYTOPLASM.Value) + k1 + kminus2 + kminus3 * (S0.Value / CYTOPLASM.Value) * (P0.Value / CYTOPLASM.Value) + k1 * k2 * kminus3 * (S0.Value / CYTOPLASM.Value) * (S1.Value / CYTOPLASM.Value) * (P0.Value / CYTOPLASM.Value) + k2 * k3 * kminus4 * (S1.Value / CYTOPLASM.Value) * (P1.Value / CYTOPLASM.Value) + k2 * kminus3 * kminus4 * (S1.Value / CYTOPLASM.Value) * (P0.Value / CYTOPLASM.Value) * (P1.Value / CYTOPLASM.Value)))";
		VariableReferenceList	[ S0 Variable:/CYTOPLASM:NADH_cyt -1 ] [ S1 Variable:/CYTOPLASM:OXA_cyt -1 ] [ P0 Variable:/CYTOPLASM:Mal_cyt 1 ] [ P1 Variable:/CYTOPLASM:NAD 1 ] [ CYTOPLASM Variable:/CYTOPLASM:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( v32 )
	{
		Name	"aspartate transaminase";
		KmS1	0.0009;
		KmS2	0.0001;
		KmP1	4e-05;
		KmP2	0.004;
		KiS1	0.002;
		KiP2	0.0083;
		Keq	6.2;
		KcF	300.0;
		KcR	1000.0;
		v32_AspTA	3.8617e-07;
		Expression	"CYTOPLASM.Value * (KcF * KcR * v32_AspTA * (S0.Value / CYTOPLASM.Value * (S1.Value / CYTOPLASM.Value) - P0.Value / CYTOPLASM.Value * (P1.Value / CYTOPLASM.Value) / Keq) / (KcR * KmS2 * (S0.Value / CYTOPLASM.Value) + KcR * KmS1 * (S1.Value / CYTOPLASM.Value) + KcF * KmP2 * (P0.Value / CYTOPLASM.Value) / Keq + KcF * KmP1 * (P1.Value / CYTOPLASM.Value) / Keq + KcR * (S0.Value / CYTOPLASM.Value) * (S1.Value / CYTOPLASM.Value) + KcF * KmP2 * (S0.Value / CYTOPLASM.Value) * (P0.Value / CYTOPLASM.Value) / (Keq * KiS1) + KcF * (P0.Value / CYTOPLASM.Value) * (P1.Value / CYTOPLASM.Value) / Keq + KcR * KmS1 * (S1.Value / CYTOPLASM.Value) * (P1.Value / CYTOPLASM.Value) / KiP2))";
		VariableReferenceList	[ S0 Variable:/CYTOPLASM:Asp_cyt -1 ] [ S1 Variable:/CYTOPLASM:OG_cyt -1 ] [ P0 Variable:/CYTOPLASM:OXA_cyt 1 ] [ P1 Variable:/CYTOPLASM:Glu_cyt 1 ] [ CYTOPLASM Variable:/CYTOPLASM:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( v33 )
	{
		Name	"citrate carrier";
		KiS1	0.00013;
		KiS2	0.00044;
		KiP1	0.00033;
		KiP2	4.18e-05;
		KcF	5.6;
		KcR	3.5;
		alpha	1.0;
		beta	1.0;
		gamma	1.0;
		delta	1.0;
		v33_CIC	0.00033211;
		Expression	"MATRIX.Value * ((S0.Value / MATRIX.Value * (S1.Value / MATRIX.Value) / alpha / KiS1 / KiS2 * KcF - P0.Value / MATRIX.Value * (P1.Value / MATRIX.Value) / beta / KiP1 / KiP2 * KcR) * v33_CIC / (1 + S0.Value / MATRIX.Value / KiS1 + S1.Value / MATRIX.Value / KiS2 + P0.Value / MATRIX.Value / KiP1 + P1.Value / MATRIX.Value / KiP2 + S0.Value / MATRIX.Value * (S1.Value / MATRIX.Value) / alpha / KiS1 / KiS2 + P0.Value / MATRIX.Value * (P1.Value / MATRIX.Value) / beta / KiP1 / KiP2 + S1.Value / MATRIX.Value * (P1.Value / MATRIX.Value) / gamma / KiS2 / KiP2 + S0.Value / MATRIX.Value * (P0.Value / MATRIX.Value) / delta / KiS1 / KiP1))";
		VariableReferenceList	[ S0 Variable:/CYTOPLASM:Cit_cyt -1 ] [ S1 Variable:/MATRIX:Mal -1 ] [ P0 Variable:/CYTOPLASM:Mal_cyt 1 ] [ P1 Variable:/MATRIX:Cit 1 ] [ MATRIX Variable:/MATRIX:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( v34 )
	{
		Name	"ETF:Q oxidoreductase";
		KmS1	3.1e-07;
		KmS2	3.9e-07;
		KmP1	3.2e-07;
		KmP2	4.2e-09;
		KiS1	3.1e-07;
		KiP2	3e-07;
		Keq	0.66;
		KcF	78.0;
		KcR	101.0;
		v34_ETF_QO	3.3211e-05;
		Expression	"MATRIX.Value * (KcF * KcR * v34_ETF_QO * (S0.Value / MATRIX.Value * (S1.Value / MATRIX.Value) - P0.Value / MATRIX.Value * (P1.Value / MATRIX.Value) / Keq) / (KcR * KmS2 * (S0.Value / MATRIX.Value) + KcR * KmS1 * (S1.Value / MATRIX.Value) + KcF * KmP2 * (P0.Value / MATRIX.Value) / Keq + KcF * KmP1 * (P1.Value / MATRIX.Value) / Keq + KcR * (S0.Value / MATRIX.Value) * (S1.Value / MATRIX.Value) + KcF * KmP2 * (S0.Value / MATRIX.Value) * (P0.Value / MATRIX.Value) / (Keq * KiS1) + KcF * (P0.Value / MATRIX.Value) * (P1.Value / MATRIX.Value) / Keq + KcR * KmS1 * (S1.Value / MATRIX.Value) * (P1.Value / MATRIX.Value) / KiP2))";
		VariableReferenceList	[ S0 Variable:/MATRIX:ETFred -1 ] [ S1 Variable:/MT_IMS:Q -1 ] [ P0 Variable:/MATRIX:ETFox 1 ] [ P1 Variable:/MT_IMS:QH2 1 ] [ MATRIX Variable:/MATRIX:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( v35 )
	{
		Name	"glutathione reductase";
		KmS1	3.9e-05;
		KmS2	1.2e-07;
		KmP1	1.08e-06;
		KmP2	2.42e-05;
		KiS1	7.6e-05;
		KiS2	2.4e-07;
		KiP1	7.53e-05;
		KiP2	1.19e-05;
		Keq	8.99;
		KcF	2.18;
		KcR	0.3;
		v35_ACD	3.3211e-05;
		Expression	"MATRIX.Value * (KcF * KcR * v35_ACD * (S0.Value / MATRIX.Value * (S1.Value / MATRIX.Value) - P0.Value / MATRIX.Value * (P1.Value / MATRIX.Value) / Keq) / (KcR * KiS1 * KmS2 + KcR * KmS2 * (S0.Value / MATRIX.Value) + KcR * KmS1 * (S1.Value / MATRIX.Value) + KcF * KmP2 * (P0.Value / MATRIX.Value) / Keq + KcF * KmP1 * (P1.Value / MATRIX.Value) / Keq + KcR * (S0.Value / MATRIX.Value) * (S1.Value / MATRIX.Value) + KcF * KmP2 * (S0.Value / MATRIX.Value) * (P0.Value / MATRIX.Value) / (Keq * KiS1) + KcF * (P0.Value / MATRIX.Value) * (P1.Value / MATRIX.Value) / Keq + KcR * KmS1 * (S1.Value / MATRIX.Value) * (P1.Value / MATRIX.Value) / KiP2 + KcR * (S0.Value / MATRIX.Value) * (S1.Value / MATRIX.Value) * (P0.Value / MATRIX.Value) / KiP1 + KcF * (S1.Value / MATRIX.Value) * (P0.Value / MATRIX.Value) * (P1.Value / MATRIX.Value) / (KiS2 * Keq)))";
		VariableReferenceList	[ S0 Variable:/MATRIX:FADH2 -1 ] [ S1 Variable:/MATRIX:ETFox -1 ] [ P0 Variable:/MATRIX:ETFred 1 ] [ P1 Variable:/MATRIX:FAD 1 ] [ MATRIX Variable:/MATRIX:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( v36 )
	{
		Name	"pyruvate decarboxylase";
		KmA	0.00011;
		KmB	0.00163;
		KmC	0.00037;
		KmP	0.016;
		KmQ	0.00024;
		KmR	5.1e-05;
		Keq	9.0;
		Kia	0.00015;
		Kib	0.0016;
		Kic	0.00013;
		Kip	0.0079;
		Kiq	0.00019;
		Kir	0.00024;
		KcF	200.0;
		KcR	20.0;
		v36_PC	3.8617e-07;
		Expression	"MATRIX.Value * (KcF * KcR * v36_PC * (S0.Value / MATRIX.Value * (S1.Value / MATRIX.Value) * (S2.Value / MATRIX.Value) - pi * (P1.Value / MATRIX.Value) * (P2.Value / MATRIX.Value) / Keq) / (Kia * KmB * KcR * (S2.Value / MATRIX.Value) + KmC * KcR * (S0.Value / MATRIX.Value) * (S1.Value / MATRIX.Value) + KmA * KcR * (S1.Value / MATRIX.Value) * (S2.Value / MATRIX.Value) + KmB * KcR * (S0.Value / MATRIX.Value) * (S2.Value / MATRIX.Value) + KcR * (S0.Value / MATRIX.Value) * (S1.Value / MATRIX.Value) * (S2.Value / MATRIX.Value) + Kip * KmQ * KcF * (P2.Value / MATRIX.Value) / Keq + KmQ * KcF * pi * (P2.Value / MATRIX.Value) / Keq + KmP * KcF * (P1.Value / MATRIX.Value) * (P2.Value / MATRIX.Value) / Keq + KmR * KcF * pi * (P1.Value / MATRIX.Value) / Keq + KcF * pi * (P1.Value / MATRIX.Value) * (P2.Value / MATRIX.Value) / Keq + Kia * KmB * KcR * (S2.Value / MATRIX.Value) * pi / Kip + Kia * KmB * KcR * (S2.Value / MATRIX.Value) * (P1.Value / MATRIX.Value) / Kia + Kiq * KmP * KcF * (S1.Value / MATRIX.Value) * (P2.Value / MATRIX.Value) / Kib / Keq + Kia * KmP * KcF * (S0.Value / MATRIX.Value) * (P2.Value / MATRIX.Value) / Kia / Keq + KmA * KcR * (S0.Value / MATRIX.Value) * (S1.Value / MATRIX.Value) * (P2.Value / MATRIX.Value) / Kir + KmR * KcF * (S2.Value / MATRIX.Value) * pi * (P1.Value / MATRIX.Value) / Kic / Keq + KmA * KcR * (S1.Value / MATRIX.Value) * (S2.Value / MATRIX.Value) * (P1.Value / MATRIX.Value) / Kiq + KmA * KcR * (S1.Value / MATRIX.Value) * (S2.Value / MATRIX.Value) * pi / Kip + KmP * KcF * (S1.Value / MATRIX.Value) * (P1.Value / MATRIX.Value) * (P2.Value / MATRIX.Value) / Kib / Keq + KmQ * KcF * (S1.Value / MATRIX.Value) * pi * (P2.Value / MATRIX.Value) / Kib / Keq))";
		VariableReferenceList	[ S0 Variable:/MATRIX:ATP -1 ] [ S1 Variable:/MATRIX:CO2 -1 ] [ S2 Variable:/MATRIX:Pyr -1 ] [ P0 Variable:/MATRIX:Pi 1 ] [ P1 Variable:/MATRIX:ADP 1 ] [ P2 Variable:/MATRIX:OXA 1 ] [ MATRIX Variable:/MATRIX:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( v37 )
	{
		Name	"glycerol-3-phosphate dehydrogenase (FAD dependent)";
		K	3.4e-05;
		V	3.99e-08;
		v37_GUT2P	0.001;
		Expression	"CYTOPLASM.Value * (V * v37_GUT2P * (S0.Value / CYTOPLASM.Value) / (K + S0.Value / CYTOPLASM.Value))";
		VariableReferenceList	[ S0 Variable:/CYTOPLASM:G3P -1 ] [ S1 Variable:/MATRIX:FAD -1 ] [ P0 Variable:/MATRIX:FADH2 1 ] [ P1 Variable:/CYTOPLASM:DHAP 1 ] [ CYTOPLASM Variable:/CYTOPLASM:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( v38 )
	{
		Name	"glycerol-3-phosphate dehydrogenase (NAD+ dependent)";
		K	34.0;
		V	0.0399;
		v38_GUT2P	0.001;
		Expression	"CYTOPLASM.Value * (V * v38_GUT2P * (S0.Value / CYTOPLASM.Value) / (K + S0.Value / CYTOPLASM.Value))";
		VariableReferenceList	[ S0 Variable:/CYTOPLASM:NADH_cyt -1 ] [ S1 Variable:/CYTOPLASM:DHAP -1 ] [ P0 Variable:/CYTOPLASM:G3P 1 ] [ P1 Variable:/CYTOPLASM:NAD 1 ] [ CYTOPLASM Variable:/CYTOPLASM:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( v40 )
	{
		Name	"ATP/ADP carrier";
		V	0.1667;
		K	0.012;
		v40_AAC	0.00033211;
		Expression	"MATRIX.Value * (V * v40_AAC * (S0.Value / MATRIX.Value) / (K + S0.Value / MATRIX.Value))";
		VariableReferenceList	[ S0 Variable:/CYTOPLASM:ADP_cyt -1 ] [ P0 Variable:/MATRIX:ADP 1 ] [ MATRIX Variable:/MATRIX:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( v41 )
	{
		Name	"cytosolic isocitrate dehydrogenase";
		phi0	0.051;
		phi1	9.5e-08;
		phi2	9.6e-07;
		phi12	9e-08;
		phir0	0.066;
		phir1	3.7e-07;
		phir2	2.9e-05;
		phir3	0.00025;
		phir12	6e-12;
		phir13	1.3e-10;
		phir23	9.4e-08;
		phir123	4.6e-14;
		v41_IDHc	3.8617e-07;
		Expression	"CYTOPLASM.Value * v41_IDHc * (S0.Value / CYTOPLASM.Value * (S1.Value / CYTOPLASM.Value) / (phi0 * (S0.Value / CYTOPLASM.Value) * (S1.Value / CYTOPLASM.Value) + phi1 * (S1.Value / CYTOPLASM.Value) + phi2 * (S0.Value / CYTOPLASM.Value) + phi12) - P0.Value / CYTOPLASM.Value * (P1.Value / CYTOPLASM.Value) * (C0.Value / CYTOPLASM.Value) / (phir0 * (P0.Value / CYTOPLASM.Value) * (P1.Value / CYTOPLASM.Value) * (C0.Value / CYTOPLASM.Value) + phir1 * (P1.Value / CYTOPLASM.Value) * (C0.Value / CYTOPLASM.Value) + phir2 * (P0.Value / CYTOPLASM.Value) * (C0.Value / CYTOPLASM.Value) + phir3 * (P0.Value / CYTOPLASM.Value) * (P1.Value / CYTOPLASM.Value) + phir12 * (C0.Value / CYTOPLASM.Value) + phir13 * (P1.Value / CYTOPLASM.Value) + phir23 * (P0.Value / CYTOPLASM.Value) + phir123))";
		VariableReferenceList	[ S0 Variable:/CYTOPLASM:IsoCitcyt -1 ] [ S1 Variable:/CYTOPLASM:NADP_cyt -1 ] [ P0 Variable:/CYTOPLASM:OG_cyt 1 ] [ P1 Variable:/CYTOPLASM:NADPH_cyt 1 ] [ C0 Variable:/MATRIX:CO2 0 ] [ CYTOPLASM Variable:/CYTOPLASM:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( v42 )
	{
		Name	"citrate carrier";
		KiS1	0.00013;
		KiS2	0.00044;
		KiP1	0.00033;
		KiP2	4.18e-05;
		KcF	5.6;
		KcR	3.5;
		alpha	1.0;
		beta	1.0;
		gamma	1.0;
		delta	1.0;
		v42_CIC	0.00033211;
		Expression	"MATRIX.Value * ((S0.Value / MATRIX.Value * (S1.Value / MATRIX.Value) / alpha / KiS1 / KiS2 * KcF - P0.Value / MATRIX.Value * (P1.Value / MATRIX.Value) / beta / KiP1 / KiP2 * KcR) * v42_CIC / (1 + S0.Value / MATRIX.Value / KiS1 + S1.Value / MATRIX.Value / KiS2 + P0.Value / MATRIX.Value / KiP1 + P1.Value / MATRIX.Value / KiP2 + S0.Value / MATRIX.Value * (S1.Value / MATRIX.Value) / alpha / KiS1 / KiS2 + P0.Value / MATRIX.Value * (P1.Value / MATRIX.Value) / beta / KiP1 / KiP2 + S1.Value / MATRIX.Value * (P1.Value / MATRIX.Value) / gamma / KiS2 / KiP2 + S0.Value / MATRIX.Value * (P0.Value / MATRIX.Value) / delta / KiS1 / KiP1))";
		VariableReferenceList	[ S0 Variable:/CYTOPLASM:IsoCitcyt -1 ] [ S1 Variable:/MATRIX:Mal -1 ] [ P0 Variable:/CYTOPLASM:Mal_cyt 1 ] [ P1 Variable:/MATRIX:IsoCit 1 ] [ MATRIX Variable:/MATRIX:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( v43 )
	{
		Name	"ATP/ADP carrier";
		V	1.11667;
		K	0.005;
		v43_AAC	0.00033211;
		Expression	"MATRIX.Value * (V * v43_AAC * (S0.Value / MATRIX.Value) / (K + S0.Value / MATRIX.Value))";
		VariableReferenceList	[ S0 Variable:/MATRIX:ATP -1 ] [ P0 Variable:/CYTOPLASM:ATP_cyt 1 ] [ MATRIX Variable:/MATRIX:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( v39 )
	{
		Name	"malate dehydrogenase (oxaloacetate-decarboxylating) (NADP+)";
		Kcat	0.333;
		Kmal	0.000125;
		Knadp	0.011;
		v39_MDH	3.8617e-07;
		Expression	"CYTOPLASM.Value * (v39_MDH * Kcat * (S0.Value / CYTOPLASM.Value) * (S1.Value / CYTOPLASM.Value) / ((Kmal + S0.Value / CYTOPLASM.Value) * (Knadp + S1.Value / CYTOPLASM.Value)))";
		VariableReferenceList	[ S0 Variable:/CYTOPLASM:Mal_cyt -1 ] [ S1 Variable:/CYTOPLASM:NADP_cyt -1 ] [ P0 Variable:/CYTOPLASM:NADPH_cyt 1 ] [ P1 Variable:/CYTOPLASM:PYR_cyt 1 ] [ CYTOPLASM Variable:/CYTOPLASM:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( v44 )
	{
		Name	"malate dehydrogenase (oxaloacetate-decarboxylating) (NADP+)";
		Kcat	130.5;
		Km	0.01295;
		v44_MDH	3.8617e-07;
		Expression	"MATRIX.Value * (v44_MDH * Kcat * (S0.Value / MATRIX.Value) / (Km + S0.Value / MATRIX.Value))";
		VariableReferenceList	[ S0 Variable:/MATRIX:Mal -1 ] [ S1 Variable:/MATRIX:NADP_p -1 ] [ P0 Variable:/MATRIX:NADPH 1 ] [ P1 Variable:/MATRIX:Pyr 1 ] [ MATRIX Variable:/MATRIX:SIZE 0 ];
	}
	
	
}

System System( /CYTOPLASM )
{
	StepperID	DE;
	Name	cytoplasm;

	Variable Variable( Dimensions )
	{
		Value	3;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Fixed	1;
	}
	
	Variable Variable( GLC )
	{
		Name	glucose;
		Value	1.12817e-05;
		Fixed	0;
	}
	
	Variable Variable( F6P )
	{
		Name	"fructose-6-phosphate";
		Value	0.00065939;
		Fixed	0;
	}
	
	Variable Variable( FBP )
	{
		Name	"fructose-1,6-bisphosphate";
		Value	7.70135e-06;
		Fixed	0;
	}
	
	Variable Variable( GAP )
	{
		Name	"glyceraldehyde 3-phosphate";
		Value	1.90919e-06;
		Fixed	0;
	}
	
	Variable Variable( DPG )
	{
		Name	"1,2-bisphospho-D-glycerate";
		Value	0.000299109;
		Fixed	0;
	}
	
	Variable Variable( PEP )
	{
		Name	phosphoenolpyruvate;
		Value	2.1125e-06;
		Fixed	0;
	}
	
	Variable Variable( PYR_cyt )
	{
		Name	pyruvate;
		Value	4.22702e-06;
		Fixed	0;
	}
	
	Variable Variable( AMP )
	{
		Name	"adenine monophosphate";
		Value	2.61149e-06;
		Fixed	0;
	}
	
	Variable Variable( LAC )
	{
		Name	lactate;
		Value	0.00033981;
		Fixed	0;
	}
	
	Variable Variable( G3P )
	{
		Name	"glycerol-3-phosphate";
		Value	0.0076925;
		Fixed	0;
	}
	
	Variable Variable( DHAP )
	{
		Name	"dihydrohxyacetone-phosphate";
		Value	0.0076925;
		Fixed	0;
	}
	
	Variable Variable( OXA_cyt )
	{
		Name	oxaloacetate;
		Value	4e-06;
		Fixed	0;
	}
	
	Variable Variable( Asp_cyt )
	{
		Name	aspartate;
		Value	0.00114;
		Fixed	0;
	}
	
	Variable Variable( Glu_cyt )
	{
		Name	glutamate;
		Value	0.00303;
		Fixed	0;
	}
	
	Variable Variable( OG_cyt )
	{
		Name	oxoglutarate;
		Value	2.1e-05;
		Fixed	0;
	}
	
	Variable Variable( Mal_cyt )
	{
		Name	malate;
		Value	0.0005;
		Fixed	0;
	}
	
	Variable Variable( Acetyl_CoA_cyt )
	{
		Name	"acetyl CoA";
		Value	3e-05;
		Fixed	0;
	}
	
	Variable Variable( CoA_cyt )
	{
		Name	"coenzyme A";
		Value	0.000272;
		Fixed	0;
	}
	
	Variable Variable( IsoCitcyt )
	{
		Name	isocitrate;
		Value	0.00042;
		Fixed	0;
	}
	
	Variable Variable( Cit_cyt )
	{
		Name	citrate;
		Value	0.00042;
		Fixed	0;
	}
	
	Variable Variable( ATP_cyt )
	{
		Name	"adenine triphosphate";
		Value	0.00449064;
		Fixed	0;
	}
	
	Variable Variable( ADP_cyt )
	{
		Name	"adenine diphosphate";
		Value	0.000108367;
		Fixed	0;
	}
	
	Variable Variable( NAD )
	{
		Name	NAD;
		Value	0.00362057;
		Fixed	0;
	}
	
	Variable Variable( NADH_cyt )
	{
		Name	NADH;
		Value	0.000616118;
		Fixed	0;
	}
	
	Variable Variable( NADP_cyt )
	{
		Name	NADP;
		Value	0.00362057;
		Fixed	0;
	}
	
	Variable Variable( NADPH_cyt )
	{
		Name	NADPH;
		Value	0.000616118;
		Fixed	0;
	}
	
	
}

System System( /MT_IMS )
{
	StepperID	DE;
	Name	"mitochondrial intermembrane space";

	Variable Variable( Dimensions )
	{
		Value	3;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Fixed	1;
	}
	
	Variable Variable( Q )
	{
		Name	ubiquinone;
		Value	0.026;
		Fixed	0;
	}
	
	Variable Variable( QH2 )
	{
		Name	ubiquinol;
		Value	0.028;
		Fixed	0;
	}
	
	Variable Variable( Cytc3p )
	{
		Name	"ferrocytochrome c";
		Value	0.003;
		Fixed	0;
	}
	
	Variable Variable( Cytc2p )
	{
		Name	"ferricytochrome c";
		Value	0.00011;
		Fixed	0;
	}
	
	
}

System System( /MT_IM )
{
	StepperID	DE;
	Name	"mitochondrial inner membrane";

	Variable Variable( Dimensions )
	{
		Value	3;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Fixed	1;
	}
	
	
}

System System( /MATRIX )
{
	StepperID	DE;
	Name	"mitochondrial matrix";

	Variable Variable( Dimensions )
	{
		Value	3;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Fixed	1;
	}
	
	Variable Variable( Pyr )
	{
		Name	pyruvate;
		Value	0.001025;
		Fixed	0;
	}
	
	Variable Variable( CO2 )
	{
		Name	"carbon dioxide";
		Value	0.00163;
		Fixed	0;
	}
	
	Variable Variable( CoA )
	{
		Name	"coenzyme A";
		Value	0.000272;
		Fixed	0;
	}
	
	Variable Variable( Acetyl_CoA )
	{
		Name	"acetyl CoA";
		Value	3e-05;
		Fixed	0;
	}
	
	Variable Variable( Pi )
	{
		Name	phosphate;
		Value	0.004;
		Fixed	0;
	}
	
	Variable Variable( Fum )
	{
		Name	fumarate;
		Value	6.5e-05;
		Fixed	0;
	}
	
	Variable Variable( SCoA )
	{
		Name	"succinyl-CoA";
		Value	0.0002941;
		Fixed	0;
	}
	
	Variable Variable( Suc )
	{
		Name	succinate;
		Value	0.00295;
		Fixed	0;
	}
	
	Variable Variable( GTP )
	{
		Name	"guanosine triphosphate";
		Value	0.0045;
		Fixed	0;
	}
	
	Variable Variable( GDP )
	{
		Name	"guanosine diphosphate";
		Value	0.00045;
		Fixed	0;
	}
	
	Variable Variable( Ala )
	{
		Name	slanine;
		Value	0.00344;
		Fixed	0;
	}
	
	Variable Variable( Asp )
	{
		Name	aspartate;
		Value	0.00114;
		Fixed	0;
	}
	
	Variable Variable( Glu )
	{
		Name	glutamate;
		Value	0.00303;
		Fixed	0;
	}
	
	Variable Variable( H2O )
	{
		Name	water;
		Value	0.001;
		Fixed	0;
	}
	
	Variable Variable( ETFred )
	{
		Name	"electron transfer flavoprotein (reduced form)";
		Value	0.00031;
		Fixed	0;
	}
	
	Variable Variable( ETFox )
	{
		Name	"electron transfer flavoprotein (oxidised form)";
		Value	0.00032;
		Fixed	0;
	}
	
	Variable Variable( FADH2 )
	{
		Name	FADH2;
		Value	7.2e-05;
		Fixed	0;
	}
	
	Variable Variable( FAD )
	{
		Name	FAD;
		Value	0.00101;
		Fixed	0;
	}
	
	Variable Variable( OG )
	{
		Name	oxoglutarate;
		Value	2.1e-05;
		Fixed	0;
	}
	
	Variable Variable( Mal )
	{
		Name	malate;
		Value	0.0005;
		Fixed	0;
	}
	
	Variable Variable( OXA )
	{
		Name	oxaloacetate;
		Value	4e-06;
		Fixed	0;
	}
	
	Variable Variable( Cit )
	{
		Name	citrate;
		Value	0.00042;
		Fixed	0;
	}
	
	Variable Variable( IsoCit )
	{
		Name	isocitrate;
		Value	0.00042;
		Fixed	0;
	}
	
	Variable Variable( ATP )
	{
		Name	"adenine triphosphate";
		Value	0.0045;
		Fixed	0;
	}
	
	Variable Variable( ADP )
	{
		Name	"adenine diphosphate";
		Value	0.00045;
		Fixed	0;
	}
	
	Variable Variable( NADP_p )
	{
		Name	"NADP+";
		Value	0.0101;
		Fixed	0;
	}
	
	Variable Variable( NADPH )
	{
		Name	NADPH;
		Value	7.2e-05;
		Fixed	0;
	}
	
	Variable Variable( NAD_p )
	{
		Name	"NAD+";
		Value	0.0101;
		Fixed	0;
	}
	
	Variable Variable( NADH )
	{
		Name	NADH;
		Value	0.00072;
		Fixed	0;
	}
	
	
}

System System( /SBMLParameter )
{
	StepperID	DE;
	Name	"Global Parameter";

	Variable Variable( flow )
	{
		Value	0.011;
		Fixed	1;
	}
	
	
}

