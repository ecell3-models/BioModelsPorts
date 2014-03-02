
# created by eml2em program
# from file: BIOMD0000000239.eml, date: Sun Mar  2 20:52:28 2014
#

Stepper ODEStepper( Default )
{
	# no property
}

System System( / )
{
	StepperID	Default;
	Name	default;

	Process ExpressionFluxProcess( GLCflow )
	{
		Name	"<-> [GLC];";
		Glc_F	64.941;
		Expression	"CYTOPLASM.Value * (Glc_F * pow(10, -3) - GLC.NumberConc) * flow.Value";
		VariableReferenceList
			[ GLC       Variable:/CYTOPLASM:GLC      1 ]
			[ CYTOPLASM Variable:/CYTOPLASM:SIZE     0 ]
			[ flow      Variable:/SBMLParameter:flow 0 ];
	}
	
	Process ExpressionFluxProcess( LACflow )
	{
		Name	"[LAC] -> ;";
		Expression	"CYTOPLASM.Value * LAC.NumberConc * flow.Value";
		VariableReferenceList
			[ LAC       Variable:/CYTOPLASM:LAC      -1 ]
			[ CYTOPLASM Variable:/CYTOPLASM:SIZE     0  ]
			[ flow      Variable:/SBMLParameter:flow 0  ];
	}
	
	Process ExpressionFluxProcess( GAPflow )
	{
		Name	"[GAP] -> ;";
		Expression	"CYTOPLASM.Value * GAP.NumberConc * flow.Value";
		VariableReferenceList
			[ GAP       Variable:/CYTOPLASM:GAP      -1 ]
			[ CYTOPLASM Variable:/CYTOPLASM:SIZE     0  ]
			[ flow      Variable:/SBMLParameter:flow 0  ];
	}
	
	Process ExpressionFluxProcess( v1 )
	{
		Name	glucokinase;
		V1	0.0005;
		K1GLC	0.0001;
		K1ATP	6.3e-05;
		Expression	"CYTOPLASM.Value * (V1 * ATP_cyt.NumberConc * GLC.NumberConc / ((K1GLC + GLC.NumberConc) * (K1ATP + ATP_cyt.NumberConc)))";
		VariableReferenceList
			[ GLC       Variable:/CYTOPLASM:GLC     -1 ]
			[ ATP_cyt   Variable:/CYTOPLASM:ATP_cyt -1 ]
			[ F6P       Variable:/CYTOPLASM:F6P     1  ]
			[ ADP_cyt   Variable:/CYTOPLASM:ADP_cyt 1  ]
			[ CYTOPLASM Variable:/CYTOPLASM:SIZE    0  ];
	}
	
	Process ExpressionFluxProcess( v2 )
	{
		Name	"6-phosphofructokinase";
		V2	0.0015;
		K2	1.6e-09;
		k2	0.017;
		K2ATP	1e-05;
		Expression	"CYTOPLASM.Value * (V2 * ATP_cyt.NumberConc * pow(F6P.NumberConc, 2) / ((K2 * (1 + k2 * pow(ATP_cyt.NumberConc / AMP.NumberConc, 2)) + pow(F6P.NumberConc, 2)) * (K2ATP + ATP_cyt.NumberConc)))";
		VariableReferenceList
			[ F6P       Variable:/CYTOPLASM:F6P     -1 ]
			[ ATP_cyt   Variable:/CYTOPLASM:ATP_cyt -1 ]
			[ FBP       Variable:/CYTOPLASM:FBP     1  ]
			[ ADP_cyt   Variable:/CYTOPLASM:ADP_cyt 1  ]
			[ AMP       Variable:/CYTOPLASM:AMP     0  ]
			[ CYTOPLASM Variable:/CYTOPLASM:SIZE    0  ];
	}
	
	Process ExpressionFluxProcess( v3 )
	{
		Name	"fructose-bisphosphate aldolase";
		k3f	1.0;
		k3b	0.05;
		Expression	"CYTOPLASM.Value * (k3f * FBP.NumberConc - k3b * pow(GAP.NumberConc, 2))";
		VariableReferenceList
			[ FBP       Variable:/CYTOPLASM:FBP  -1 ]
			[ GAP       Variable:/CYTOPLASM:GAP  2  ]
			[ CYTOPLASM Variable:/CYTOPLASM:SIZE 0  ];
	}
	
	Process ExpressionFluxProcess( v4 )
	{
		Name	"glyceraldehyde 3-phosphate dehydrogenase";
		V4	0.01;
		K4GAP	0.001;
		K4NAD	0.001;
		Expression	"CYTOPLASM.Value * (V4 * NAD.NumberConc * GAP.NumberConc / ((K4GAP + GAP.NumberConc) * (K4NAD + NAD.NumberConc)))";
		VariableReferenceList
			[ GAP       Variable:/CYTOPLASM:GAP      -1 ]
			[ NAD       Variable:/CYTOPLASM:NAD      -1 ]
			[ DPG       Variable:/CYTOPLASM:DPG      1  ]
			[ NADH_cyt  Variable:/CYTOPLASM:NADH_cyt 1  ]
			[ CYTOPLASM Variable:/CYTOPLASM:SIZE     0  ];
	}
	
	Process ExpressionFluxProcess( v5 )
	{
		Name	"bisphosphoglycerate phosphotase (1/2)";
		k5f	1000.0;
		k5b	500.0;
		Expression	"CYTOPLASM.Value * (k5f * DPG.NumberConc * ADP_cyt.NumberConc - k5b * PEP.NumberConc * ATP_cyt.NumberConc)";
		VariableReferenceList
			[ DPG       Variable:/CYTOPLASM:DPG     -1 ]
			[ ADP_cyt   Variable:/CYTOPLASM:ADP_cyt -1 ]
			[ PEP       Variable:/CYTOPLASM:PEP     1  ]
			[ ATP_cyt   Variable:/CYTOPLASM:ATP_cyt 1  ]
			[ CYTOPLASM Variable:/CYTOPLASM:SIZE    0  ];
	}
	
	Process ExpressionFluxProcess( v6 )
	{
		Name	"pyruvate kinase";
		V6	0.01;
		K6PEP	0.0002;
		K6ADP	0.0003;
		Expression	"CYTOPLASM.Value * (V6 * ADP_cyt.NumberConc * PEP.NumberConc / ((K6PEP + PEP.NumberConc) * (K6ADP + ADP_cyt.NumberConc)))";
		VariableReferenceList
			[ PEP       Variable:/CYTOPLASM:PEP     -1 ]
			[ ADP_cyt   Variable:/CYTOPLASM:ADP_cyt -1 ]
			[ PYR_cyt   Variable:/CYTOPLASM:PYR_cyt 1  ]
			[ ATP_cyt   Variable:/CYTOPLASM:ATP_cyt 1  ]
			[ CYTOPLASM Variable:/CYTOPLASM:SIZE    0  ];
	}
	
	Process ExpressionFluxProcess( v7 )
	{
		Name	"lactate dehydrogenase";
		k8f	1000.0;
		k8b	0.143;
		Expression	"CYTOPLASM.Value * (k8f * NADH_cyt.NumberConc * PYR_cyt.NumberConc - k8b * NAD.NumberConc * LAC.NumberConc)";
		VariableReferenceList
			[ PYR_cyt   Variable:/CYTOPLASM:PYR_cyt  -1 ]
			[ NADH_cyt  Variable:/CYTOPLASM:NADH_cyt -1 ]
			[ LAC       Variable:/CYTOPLASM:LAC      1  ]
			[ NAD       Variable:/CYTOPLASM:NAD      1  ]
			[ CYTOPLASM Variable:/CYTOPLASM:SIZE     0  ];
	}
	
	Process ExpressionFluxProcess( hidden_1 )
	{
		Name	"[AMP] + [ATP_cyt] <-> 2 x [ADP_cyt];";
		k9f	10000.0;
		k9b	10000.0;
		Expression	"CYTOPLASM.Value * (k9f * AMP.NumberConc * ATP_cyt.NumberConc - k9b * pow(ADP_cyt.NumberConc, 2))";
		VariableReferenceList
			[ AMP       Variable:/CYTOPLASM:AMP     -1 ]
			[ ATP_cyt   Variable:/CYTOPLASM:ATP_cyt -1 ]
			[ ADP_cyt   Variable:/CYTOPLASM:ADP_cyt 2  ]
			[ CYTOPLASM Variable:/CYTOPLASM:SIZE    0  ];
	}
	
	Process ExpressionFluxProcess( v8 )
	{
		Name	"pyruvate carrier";
		V	1e-08;
		K	1.5e-07;
		v8_PYC	0.00033211;
		Expression	"MATRIX.Value * (V * PYR_cyt.NumberConc * v8_PYC / (K + PYR_cyt.NumberConc))";
		VariableReferenceList
			[ PYR_cyt Variable:/CYTOPLASM:PYR_cyt -1 ]
			[ Pyr     Variable:/MATRIX:Pyr        1  ]
			[ MATRIX  Variable:/MATRIX:SIZE       0  ];
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
		Expression	"MATRIX.Value * (KcF * v9_PDC * Pyr.NumberConc * CoA.NumberConc * NAD_p.NumberConc / (KmC * Pyr.NumberConc * CoA.NumberConc + KmB * Pyr.NumberConc * NAD_p.NumberConc + KmA * CoA.NumberConc * NAD_p.NumberConc + Pyr.NumberConc * CoA.NumberConc * NAD_p.NumberConc + KmA * KmP * Kib * Kic / KmR / Kip / Kiq * Acetyl_CoA.NumberConc * NADH.NumberConc + KmC / Kir * Pyr.NumberConc * CoA.NumberConc * NADH.NumberConc + KmB / Kiq * Pyr.NumberConc * NAD_p.NumberConc * Acetyl_CoA.NumberConc + KmA * KmP * Kib * Kic / KmR / Kip / Kia / Kiq * Pyr.NumberConc * Acetyl_CoA.NumberConc * NADH.NumberConc))";
		VariableReferenceList
			[ Pyr        Variable:/MATRIX:Pyr        -1 ]
			[ CoA        Variable:/MATRIX:CoA        -1 ]
			[ NAD_p      Variable:/MATRIX:NAD_p      -1 ]
			[ CO2        Variable:/MATRIX:CO2        1  ]
			[ Acetyl_CoA Variable:/MATRIX:Acetyl_CoA 1  ]
			[ NADH       Variable:/MATRIX:NADH       1  ]
			[ MATRIX     Variable:/MATRIX:SIZE       0  ];
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
		Expression	"MATRIX.Value * (V * Acetyl_CoA.NumberConc * OXA.NumberConc * v10_CS / (Acetyl_CoA.NumberConc * OXA.NumberConc + Ka * OXA.NumberConc + Kb * Acetyl_CoA.NumberConc + Kia * Kib))";
		VariableReferenceList
			[ OXA        Variable:/MATRIX:OXA        -1 ]
			[ Acetyl_CoA Variable:/MATRIX:Acetyl_CoA -1 ]
			[ Cit        Variable:/MATRIX:Cit        1  ]
			[ CoA        Variable:/MATRIX:CoA        1  ]
			[ MATRIX     Variable:/MATRIX:SIZE       0  ];
	}
	
	Process ExpressionFluxProcess( v11 )
	{
		Name	aconitase;
		Ks	0.0005;
		Kp	0.00011;
		KcF	20.47;
		KcR	31.44;
		v11_ACO	3.8617e-07;
		Expression	"MATRIX.Value * ((KcF * Kp * Cit.NumberConc - KcR * Ks * IsoCit.NumberConc) * v11_ACO / (Ks * IsoCit.NumberConc + Kp * Cit.NumberConc + Ks * Kp))";
		VariableReferenceList
			[ Cit    Variable:/MATRIX:Cit    -1 ]
			[ IsoCit Variable:/MATRIX:IsoCit 1  ]
			[ MATRIX Variable:/MATRIX:SIZE   0  ];
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
		Expression	"MATRIX.Value * (KcF * v12_IDHa * (IsoCit.NumberConc * IsoCit.NumberConc + b * ADP.NumberConc * IsoCit.NumberConc) / (IsoCit.NumberConc * IsoCit.NumberConc + c * IsoCit.NumberConc + d * ADP.NumberConc + e * ADP.NumberConc * IsoCit.NumberConc + f))";
		VariableReferenceList
			[ IsoCit Variable:/MATRIX:IsoCit -1 ]
			[ NAD_p  Variable:/MATRIX:NAD_p  -1 ]
			[ OG     Variable:/MATRIX:OG     1  ]
			[ NADH   Variable:/MATRIX:NADH   1  ]
			[ ADP    Variable:/MATRIX:ADP    0  ]
			[ MATRIX Variable:/MATRIX:SIZE   0  ];
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
		Expression	"MATRIX.Value * (KcF * v14_OGDC * OG.NumberConc * CoA.NumberConc * NAD_p.NumberConc / (KmC * OG.NumberConc * CoA.NumberConc + KmB * OG.NumberConc * NAD_p.NumberConc + KmA * CoA.NumberConc * NAD_p.NumberConc + OG.NumberConc * CoA.NumberConc * NAD_p.NumberConc + KmA * KmP * Kib * Kic / KmR / Kip / Kiq * SCoA.NumberConc * NADH.NumberConc + KmC / Kir * OG.NumberConc * CoA.NumberConc * NADH.NumberConc + KmB / Kiq * OG.NumberConc * NAD_p.NumberConc * SCoA.NumberConc + KmA * KmP * Kib * Kic / KmR / Kip / Kia / Kiq * OG.NumberConc * SCoA.NumberConc * NADH.NumberConc))";
		VariableReferenceList
			[ OG     Variable:/MATRIX:OG    -1 ]
			[ CoA    Variable:/MATRIX:CoA   -1 ]
			[ NAD_p  Variable:/MATRIX:NAD_p -1 ]
			[ CO2    Variable:/MATRIX:CO2   1  ]
			[ SCoA   Variable:/MATRIX:SCoA  1  ]
			[ NADH   Variable:/MATRIX:NADH  1  ]
			[ MATRIX Variable:/MATRIX:SIZE  0  ];
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
		Expression	"MATRIX.Value * ((GDP.NumberConc * SCoA.NumberConc * 3.14159265358979 - Suc.NumberConc * GTP.NumberConc * CoA.NumberConc / Keq) * (Kc1 * v15_SCS + Kc2 * v15_SCS * (KmC * Suc.NumberConc / KmC2 * Kip + 3.14159265358979 / KmC2)) / (Kia * KmB * 3.14159265358979 + KmB * GDP.NumberConc * 3.14159265358979 + KmA * SCoA.NumberConc * 3.14159265358979 + KmC * GDP.NumberConc * SCoA.NumberConc + GDP.NumberConc * SCoA.NumberConc * 3.14159265358979 + GDP.NumberConc * SCoA.NumberConc * 3.14159265358979 * 3.14159265358979 / KmC2 + Kia * KmB * KmC * Suc.NumberConc / Kip + Kia * KmB * KmC * Suc.NumberConc * GTP.NumberConc / Kip / Kiq + Kia * KmB * KmC * Suc.NumberConc * CoA.NumberConc / Kip / Kir + Kia * KmB * Kic * GTP.NumberConc * CoA.NumberConc / KmQ / Kir + Kia * KmB * KmC * Suc.NumberConc * GTP.NumberConc * CoA.NumberConc / Kip / KmQ / Kir + Kia * KmB * KmC * Suc.NumberConc * Suc.NumberConc * GTP.NumberConc * CoA.NumberConc / Kip / KmP2 / KmQ / Kir + Kia * KmB * 3.14159265358979 * GTP.NumberConc / Kiq + Kia * KmB * 3.14159265358979 * CoA.NumberConc / Kir + Kia * KmB * 3.14159265358979 * GTP.NumberConc * CoA.NumberConc / KmQ / Kir + Kia * KmB * 3.14159265358979 * Suc.NumberConc * GTP.NumberConc * CoA.NumberConc / KmP2 / KmQ / Kir + KmB * KmC * GDP.NumberConc * Suc.NumberConc / Kip + KmA * KmC * SCoA.NumberConc * Suc.NumberConc / Kip + KmC * GDP.NumberConc * SCoA.NumberConc * Suc.NumberConc / Kip + KmC * GDP.NumberConc * SCoA.NumberConc * 3.14159265358979 * Suc.NumberConc / KmC2 / Kip + KmA * SCoA.NumberConc * 3.14159265358979 * GTP.NumberConc / Kiq + KmB * GDP.NumberConc * 3.14159265358979 * CoA.NumberConc / Kir + KmA * KmC * SCoA.NumberConc * Suc.NumberConc * GTP.NumberConc / Kip / Kiq + KmB * KmC * GDP.NumberConc * Suc.NumberConc * CoA.NumberConc / Kip / Kir))";
		VariableReferenceList
			[ GDP    Variable:/MATRIX:GDP  -1 ]
			[ SCoA   Variable:/MATRIX:SCoA -1 ]
			[ Pi     Variable:/MATRIX:Pi   -1 ]
			[ Suc    Variable:/MATRIX:Suc  1  ]
			[ GTP    Variable:/MATRIX:GTP  1  ]
			[ CoA    Variable:/MATRIX:CoA  1  ]
			[ MATRIX Variable:/MATRIX:SIZE 0  ];
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
		Expression	"MATRIX.Value * (KcF * KcR * v16_SDH * (Suc.NumberConc * Q.NumberConc - Fum.NumberConc * QH2.NumberConc / Keq) / (KcR * KmS2 * Suc.NumberConc + KcR * KmS1 * Q.NumberConc + KcF * KmP2 * Fum.NumberConc / Keq + KcF * KmP1 * QH2.NumberConc / Keq + KcR * Suc.NumberConc * Q.NumberConc + KcF * KmP2 * Suc.NumberConc * Fum.NumberConc / (Keq * KiS1) + KcF * Fum.NumberConc * QH2.NumberConc / Keq + KcR * KmS1 * Q.NumberConc * QH2.NumberConc / KiP2))";
		VariableReferenceList
			[ Suc    Variable:/MATRIX:Suc  -1 ]
			[ Q      Variable:/MT_IMS:Q    -1 ]
			[ Fum    Variable:/MATRIX:Fum  1  ]
			[ QH2    Variable:/MT_IMS:QH2  1  ]
			[ MATRIX Variable:/MATRIX:SIZE 0  ];
	}
	
	Process ExpressionFluxProcess( v17 )
	{
		Name	fumarase;
		Kp	2.5e-05;
		Ks	5e-06;
		KcF	800.0;
		KcR	900.0;
		v17_FM	3.8617e-07;
		Expression	"MATRIX.Value * ((KcF * Kp * Fum.NumberConc - KcR * Ks * Mal.NumberConc) * v17_FM / (Ks * Mal.NumberConc + Kp * Fum.NumberConc + Ks * Kp))";
		VariableReferenceList
			[ Fum    Variable:/MATRIX:Fum  -1 ]
			[ Mal    Variable:/MATRIX:Mal  1  ]
			[ MATRIX Variable:/MATRIX:SIZE 0  ];
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
		Expression	"MATRIX.Value * ((KcF * Mal.NumberConc * NAD_p.NumberConc / KiS1 / KmS2 - KcR * OXA.NumberConc * NADH.NumberConc / KmP1 / KiP2) * v18_MDH / (1 + Mal.NumberConc / KiS1 + KmS1 * NAD_p.NumberConc / KiS1 / KmS2 + KmP2 * OXA.NumberConc / KmP1 / KiP2 + NADH.NumberConc / KiP2 + Mal.NumberConc * NAD_p.NumberConc / KiS1 / KmS2 + KmP2 * Mal.NumberConc * OXA.NumberConc / KiS1 / KmP1 / KiP2 + KmS1 * NAD_p.NumberConc * NADH.NumberConc / KiS1 / KmS2 / KiP2 + OXA.NumberConc * NADH.NumberConc / KmP1 * KiP2 + Mal.NumberConc * NAD_p.NumberConc * OXA.NumberConc / KiS1 / KmS2 / KiP1 + NAD_p.NumberConc * OXA.NumberConc * NADH.NumberConc / KiS2 / KmP1 / KiP2))";
		VariableReferenceList
			[ Mal    Variable:/MATRIX:Mal   -1 ]
			[ NAD_p  Variable:/MATRIX:NAD_p -1 ]
			[ NADH   Variable:/MATRIX:NADH  1  ]
			[ OXA    Variable:/MATRIX:OXA   1  ]
			[ MATRIX Variable:/MATRIX:SIZE  0  ];
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
		Expression	"MATRIX.Value * (KcF * KcR * v20_AlaTA * (Ala.NumberConc * OG.NumberConc - Glu.NumberConc * Pyr.NumberConc / Keq) / (KcR * KmS2 * Ala.NumberConc + KcR * KmS1 * OG.NumberConc + KcF * KmP2 * Glu.NumberConc / Keq + KcF * KmP1 * Pyr.NumberConc / Keq + KcR * Ala.NumberConc * OG.NumberConc + KcF * KmP2 * Ala.NumberConc * Glu.NumberConc / (Keq * KiS1) + KcF * Glu.NumberConc * Pyr.NumberConc / Keq + KcR * KmS1 * OG.NumberConc * Pyr.NumberConc / KiP2))";
		VariableReferenceList
			[ Ala    Variable:/MATRIX:Ala  -1 ]
			[ OG     Variable:/MATRIX:OG   -1 ]
			[ Glu    Variable:/MATRIX:Glu  1  ]
			[ Pyr    Variable:/MATRIX:Pyr  1  ]
			[ MATRIX Variable:/MATRIX:SIZE 0  ];
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
		Expression	"MATRIX.Value * (KcF * KcR * v21_AspTA * (OXA.NumberConc * Glu.NumberConc - Asp.NumberConc * OG.NumberConc / Keq) / (KcR * KmS2 * OXA.NumberConc + KcR * KmS1 * Glu.NumberConc + KcF * KmP2 * Asp.NumberConc / Keq + KcF * KmP1 * OG.NumberConc / Keq + KcR * OXA.NumberConc * Glu.NumberConc + KcF * KmP2 * OXA.NumberConc * Asp.NumberConc / (Keq * KiS1) + KcF * Asp.NumberConc * OG.NumberConc / Keq + KcR * KmS1 * Glu.NumberConc * OG.NumberConc / KiP2))";
		VariableReferenceList
			[ OXA    Variable:/MATRIX:OXA  -1 ]
			[ Glu    Variable:/MATRIX:Glu  -1 ]
			[ Asp    Variable:/MATRIX:Asp  1  ]
			[ OG     Variable:/MATRIX:OG   1  ]
			[ MATRIX Variable:/MATRIX:SIZE 0  ];
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
		Expression	"MATRIX.Value * ((Asp.NumberConc * Glu_cyt.NumberConc / alpha / KiS1 / KiS2 * KcF - Glu.NumberConc * Asp_cyt.NumberConc / beta / KiP1 / KiP2 * KcR) * v22_AGC / (1 + Asp.NumberConc / KiS1 + Glu_cyt.NumberConc / KiS2 + Glu.NumberConc / KiP1 + Asp_cyt.NumberConc / KiP2 + Asp.NumberConc * Glu_cyt.NumberConc / alpha / KiS1 / KiS2 + Glu.NumberConc * Asp_cyt.NumberConc / beta / KiP1 / KiP2 + Glu_cyt.NumberConc * Asp_cyt.NumberConc / gamma / KiS2 / KiP2 + Asp.NumberConc * Glu.NumberConc / delta / KiS1 / KiP1))";
		VariableReferenceList
			[ Glu_cyt Variable:/CYTOPLASM:Glu_cyt -1 ]
			[ Asp     Variable:/MATRIX:Asp        -1 ]
			[ Asp_cyt Variable:/CYTOPLASM:Asp_cyt 1  ]
			[ Glu     Variable:/MATRIX:Glu        1  ]
			[ MATRIX  Variable:/MATRIX:SIZE       0  ];
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
		Expression	"MATRIX.Value * (KcF * KcR * v24_Complex_I * (NADH.NumberConc * Q.NumberConc - NAD_p.NumberConc * QH2.NumberConc / Keq) / (KcR * KmS2 * NADH.NumberConc + KcR * KmS1 * Q.NumberConc + KcF * KmP2 * NAD_p.NumberConc / Keq + KcF * KmP1 * QH2.NumberConc / Keq + KcR * NADH.NumberConc * Q.NumberConc + KcF * KmP2 * NADH.NumberConc * NAD_p.NumberConc / (Keq * KiS1) + KcF * NAD_p.NumberConc * QH2.NumberConc / Keq + KcR * KmS1 * Q.NumberConc * QH2.NumberConc / KiP2))";
		VariableReferenceList
			[ NADH   Variable:/MATRIX:NADH  -1 ]
			[ Q      Variable:/MT_IMS:Q     -1 ]
			[ NAD_p  Variable:/MATRIX:NAD_p 1  ]
			[ QH2    Variable:/MT_IMS:QH2   1  ]
			[ MATRIX Variable:/MATRIX:SIZE  0  ];
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
		Expression	"MT_IMS.Value * (KcF * v25_Complex_III * QH2.NumberConc * Cytc3p.NumberConc / ((KmA * Kq2 * Kb2 + KmA * Kq2 * Cytc3p.NumberConc + KcF / k8 * Kq1 * QH2.NumberConc * Kb1 + KcF / k8 * Kq1 * QH2.NumberConc * Cytc3p.NumberConc) * Cytc2p.NumberConc + KmA * Cytc3p.NumberConc + KmB * QH2.NumberConc + QH2.NumberConc * Cytc3p.NumberConc))";
		VariableReferenceList
			[ QH2    Variable:/MT_IMS:QH2    -1 ]
			[ Cytc3p Variable:/MT_IMS:Cytc3p -2 ]
			[ Q      Variable:/MT_IMS:Q      1  ]
			[ Cytc2p Variable:/MT_IMS:Cytc2p 2  ]
			[ MT_IMS Variable:/MT_IMS:SIZE   0  ];
	}
	
	Process ExpressionFluxProcess( v26 )
	{
		Name	"cytochrome c oxidase";
		Ks	0.00011;
		KcF	0.000935;
		v26_Complex_IV	0.002325;
		Expression	"MT_IMS.Value * (KcF * v26_Complex_IV * Cytc2p.NumberConc / (Ks + Cytc2p.NumberConc))";
		VariableReferenceList
			[ Cytc2p Variable:/MT_IMS:Cytc2p -1 ]
			[ Cytc3p Variable:/MT_IMS:Cytc3p 1  ]
			[ MT_IMS Variable:/MT_IMS:SIZE   0  ];
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
		Expression	"CYTOPLASM.Value * Kid * Kc * (V * Acetyl_CoA_cyt.NumberConc * OXA_cyt.NumberConc * v10_CS / (Acetyl_CoA_cyt.NumberConc * OXA_cyt.NumberConc + Ka * OXA_cyt.NumberConc + Kb * Acetyl_CoA_cyt.NumberConc + Kia * Kib)) / (Keq * Kia * Kb)";
		VariableReferenceList
			[ Cit_cyt        Variable:/CYTOPLASM:Cit_cyt        -1 ]
			[ CoA_cyt        Variable:/CYTOPLASM:CoA_cyt        -1 ]
			[ OXA_cyt        Variable:/CYTOPLASM:OXA_cyt        1  ]
			[ Acetyl_CoA_cyt Variable:/CYTOPLASM:Acetyl_CoA_cyt 1  ]
			[ CYTOPLASM      Variable:/CYTOPLASM:SIZE           0  ];
	}
	
	Process ExpressionFluxProcess( v28 )
	{
		Name	"ATPase complex";
		V	0.075;
		Km	0.0045;
		Ki	0.047;
		v28_Complex_V	0.0033211;
		Expression	"MATRIX.Value * v28_Complex_V * V * ADP.NumberConc / (Km + ADP.NumberConc + ADP.NumberConc * ADP.NumberConc / Ki)";
		VariableReferenceList
			[ ADP    Variable:/MATRIX:ADP  -1 ]
			[ Pi     Variable:/MATRIX:Pi   -1 ]
			[ ATP    Variable:/MATRIX:ATP  1  ]
			[ H2O    Variable:/MATRIX:H2O  1  ]
			[ MATRIX Variable:/MATRIX:SIZE 0  ];
	}
	
	Process ExpressionFluxProcess( v29 )
	{
		Name	aconitase;
		Ks	0.0005;
		Kp	0.00011;
		KcF	20.47;
		KcR	31.44;
		v29_ACO	3.8617e-07;
		Expression	"CYTOPLASM.Value * ((KcF * Kp * Cit_cyt.NumberConc - KcR * Ks * IsoCitcyt.NumberConc) * v29_ACO / (Ks * IsoCitcyt.NumberConc + Kp * Cit_cyt.NumberConc + Ks * Kp))";
		VariableReferenceList
			[ Cit_cyt   Variable:/CYTOPLASM:Cit_cyt   -1 ]
			[ IsoCitcyt Variable:/CYTOPLASM:IsoCitcyt 1  ]
			[ CYTOPLASM Variable:/CYTOPLASM:SIZE      0  ];
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
		Expression	"MATRIX.Value * ((OG.NumberConc * Mal_cyt.NumberConc / alpha / KiS1 / KiS2 * KcF - Mal.NumberConc * OG_cyt.NumberConc / beta / KiP1 / KiP2 * KcR) * v30_OGC / (1 + OG.NumberConc / KiS1 + Mal_cyt.NumberConc / KiS2 + Mal.NumberConc / KiP1 + OG_cyt.NumberConc / KiP2 + OG.NumberConc * Mal_cyt.NumberConc / alpha / KiS1 / KiS2 + Mal.NumberConc * OG_cyt.NumberConc / beta / KiP1 / KiP2 + Mal_cyt.NumberConc * OG_cyt.NumberConc / gamma / KiS2 / KiP2 + OG.NumberConc * Mal.NumberConc / delta / KiS1 / KiP1))";
		VariableReferenceList
			[ Mal_cyt Variable:/CYTOPLASM:Mal_cyt -1 ]
			[ OG      Variable:/MATRIX:OG         -1 ]
			[ OG_cyt  Variable:/CYTOPLASM:OG_cyt  1  ]
			[ Mal     Variable:/MATRIX:Mal        1  ]
			[ MATRIX  Variable:/MATRIX:SIZE       0  ];
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
		Expression	"CYTOPLASM.Value * (v31_MDH * (k1 * k2 * k3 * k4 * NADH_cyt.NumberConc * OXA_cyt.NumberConc - kminus1 * kminus2 * kminus3 * kminus4 * Mal_cyt.NumberConc * NAD.NumberConc) / (kminus1 * (kminus2 + k3) * k4 + k1 * (kminus2 + k3) * k4 * NADH_cyt.NumberConc + kminus1 * (kminus2 + k3) * kminus4 * NAD.NumberConc + k2 * k3 * k4 * OXA_cyt.NumberConc + kminus1 * kminus2 * kminus3 * Mal_cyt.NumberConc + k1 * k2 * (k3 + k4) * NADH_cyt.NumberConc * OXA_cyt.NumberConc + (kminus1 + kminus2) * kminus3 * kminus4 * Mal_cyt.NumberConc * NAD.NumberConc + k1 + kminus2 + kminus3 * NADH_cyt.NumberConc * Mal_cyt.NumberConc + k1 * k2 * kminus3 * NADH_cyt.NumberConc * OXA_cyt.NumberConc * Mal_cyt.NumberConc + k2 * k3 * kminus4 * OXA_cyt.NumberConc * NAD.NumberConc + k2 * kminus3 * kminus4 * OXA_cyt.NumberConc * Mal_cyt.NumberConc * NAD.NumberConc))";
		VariableReferenceList
			[ NADH_cyt  Variable:/CYTOPLASM:NADH_cyt -1 ]
			[ OXA_cyt   Variable:/CYTOPLASM:OXA_cyt  -1 ]
			[ Mal_cyt   Variable:/CYTOPLASM:Mal_cyt  1  ]
			[ NAD       Variable:/CYTOPLASM:NAD      1  ]
			[ CYTOPLASM Variable:/CYTOPLASM:SIZE     0  ];
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
		Expression	"CYTOPLASM.Value * (KcF * KcR * v32_AspTA * (Asp_cyt.NumberConc * OG_cyt.NumberConc - OXA_cyt.NumberConc * Glu_cyt.NumberConc / Keq) / (KcR * KmS2 * Asp_cyt.NumberConc + KcR * KmS1 * OG_cyt.NumberConc + KcF * KmP2 * OXA_cyt.NumberConc / Keq + KcF * KmP1 * Glu_cyt.NumberConc / Keq + KcR * Asp_cyt.NumberConc * OG_cyt.NumberConc + KcF * KmP2 * Asp_cyt.NumberConc * OXA_cyt.NumberConc / (Keq * KiS1) + KcF * OXA_cyt.NumberConc * Glu_cyt.NumberConc / Keq + KcR * KmS1 * OG_cyt.NumberConc * Glu_cyt.NumberConc / KiP2))";
		VariableReferenceList
			[ Asp_cyt   Variable:/CYTOPLASM:Asp_cyt -1 ]
			[ OG_cyt    Variable:/CYTOPLASM:OG_cyt  -1 ]
			[ OXA_cyt   Variable:/CYTOPLASM:OXA_cyt 1  ]
			[ Glu_cyt   Variable:/CYTOPLASM:Glu_cyt 1  ]
			[ CYTOPLASM Variable:/CYTOPLASM:SIZE    0  ];
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
		Expression	"MATRIX.Value * ((Cit_cyt.NumberConc * Mal.NumberConc / alpha / KiS1 / KiS2 * KcF - Mal_cyt.NumberConc * Cit.NumberConc / beta / KiP1 / KiP2 * KcR) * v33_CIC / (1 + Cit_cyt.NumberConc / KiS1 + Mal.NumberConc / KiS2 + Mal_cyt.NumberConc / KiP1 + Cit.NumberConc / KiP2 + Cit_cyt.NumberConc * Mal.NumberConc / alpha / KiS1 / KiS2 + Mal_cyt.NumberConc * Cit.NumberConc / beta / KiP1 / KiP2 + Mal.NumberConc * Cit.NumberConc / gamma / KiS2 / KiP2 + Cit_cyt.NumberConc * Mal_cyt.NumberConc / delta / KiS1 / KiP1))";
		VariableReferenceList
			[ Cit_cyt Variable:/CYTOPLASM:Cit_cyt -1 ]
			[ Mal     Variable:/MATRIX:Mal        -1 ]
			[ Mal_cyt Variable:/CYTOPLASM:Mal_cyt 1  ]
			[ Cit     Variable:/MATRIX:Cit        1  ]
			[ MATRIX  Variable:/MATRIX:SIZE       0  ];
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
		Expression	"MATRIX.Value * (KcF * KcR * v34_ETF_QO * (ETFred.NumberConc * Q.NumberConc - ETFox.NumberConc * QH2.NumberConc / Keq) / (KcR * KmS2 * ETFred.NumberConc + KcR * KmS1 * Q.NumberConc + KcF * KmP2 * ETFox.NumberConc / Keq + KcF * KmP1 * QH2.NumberConc / Keq + KcR * ETFred.NumberConc * Q.NumberConc + KcF * KmP2 * ETFred.NumberConc * ETFox.NumberConc / (Keq * KiS1) + KcF * ETFox.NumberConc * QH2.NumberConc / Keq + KcR * KmS1 * Q.NumberConc * QH2.NumberConc / KiP2))";
		VariableReferenceList
			[ ETFred Variable:/MATRIX:ETFred -1 ]
			[ Q      Variable:/MT_IMS:Q      -1 ]
			[ ETFox  Variable:/MATRIX:ETFox  1  ]
			[ QH2    Variable:/MT_IMS:QH2    1  ]
			[ MATRIX Variable:/MATRIX:SIZE   0  ];
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
		Expression	"MATRIX.Value * (KcF * KcR * v35_ACD * (FADH2.NumberConc * ETFox.NumberConc - ETFred.NumberConc * FAD.NumberConc / Keq) / (KcR * KiS1 * KmS2 + KcR * KmS2 * FADH2.NumberConc + KcR * KmS1 * ETFox.NumberConc + KcF * KmP2 * ETFred.NumberConc / Keq + KcF * KmP1 * FAD.NumberConc / Keq + KcR * FADH2.NumberConc * ETFox.NumberConc + KcF * KmP2 * FADH2.NumberConc * ETFred.NumberConc / (Keq * KiS1) + KcF * ETFred.NumberConc * FAD.NumberConc / Keq + KcR * KmS1 * ETFox.NumberConc * FAD.NumberConc / KiP2 + KcR * FADH2.NumberConc * ETFox.NumberConc * ETFred.NumberConc / KiP1 + KcF * ETFox.NumberConc * ETFred.NumberConc * FAD.NumberConc / (KiS2 * Keq)))";
		VariableReferenceList
			[ FADH2  Variable:/MATRIX:FADH2  -1 ]
			[ ETFox  Variable:/MATRIX:ETFox  -1 ]
			[ ETFred Variable:/MATRIX:ETFred 1  ]
			[ FAD    Variable:/MATRIX:FAD    1  ]
			[ MATRIX Variable:/MATRIX:SIZE   0  ];
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
		Expression	"MATRIX.Value * (KcF * KcR * v36_PC * (ATP.NumberConc * CO2.NumberConc * Pyr.NumberConc - 3.14159265358979 * ADP.NumberConc * OXA.NumberConc / Keq) / (Kia * KmB * KcR * Pyr.NumberConc + KmC * KcR * ATP.NumberConc * CO2.NumberConc + KmA * KcR * CO2.NumberConc * Pyr.NumberConc + KmB * KcR * ATP.NumberConc * Pyr.NumberConc + KcR * ATP.NumberConc * CO2.NumberConc * Pyr.NumberConc + Kip * KmQ * KcF * OXA.NumberConc / Keq + KmQ * KcF * 3.14159265358979 * OXA.NumberConc / Keq + KmP * KcF * ADP.NumberConc * OXA.NumberConc / Keq + KmR * KcF * 3.14159265358979 * ADP.NumberConc / Keq + KcF * 3.14159265358979 * ADP.NumberConc * OXA.NumberConc / Keq + Kia * KmB * KcR * Pyr.NumberConc * 3.14159265358979 / Kip + Kia * KmB * KcR * Pyr.NumberConc * ADP.NumberConc / Kia + Kiq * KmP * KcF * CO2.NumberConc * OXA.NumberConc / Kib / Keq + Kia * KmP * KcF * ATP.NumberConc * OXA.NumberConc / Kia / Keq + KmA * KcR * ATP.NumberConc * CO2.NumberConc * OXA.NumberConc / Kir + KmR * KcF * Pyr.NumberConc * 3.14159265358979 * ADP.NumberConc / Kic / Keq + KmA * KcR * CO2.NumberConc * Pyr.NumberConc * ADP.NumberConc / Kiq + KmA * KcR * CO2.NumberConc * Pyr.NumberConc * 3.14159265358979 / Kip + KmP * KcF * CO2.NumberConc * ADP.NumberConc * OXA.NumberConc / Kib / Keq + KmQ * KcF * CO2.NumberConc * 3.14159265358979 * OXA.NumberConc / Kib / Keq))";
		VariableReferenceList
			[ ATP    Variable:/MATRIX:ATP  -1 ]
			[ CO2    Variable:/MATRIX:CO2  -1 ]
			[ Pyr    Variable:/MATRIX:Pyr  -1 ]
			[ Pi     Variable:/MATRIX:Pi   1  ]
			[ ADP    Variable:/MATRIX:ADP  1  ]
			[ OXA    Variable:/MATRIX:OXA  1  ]
			[ MATRIX Variable:/MATRIX:SIZE 0  ];
	}
	
	Process ExpressionFluxProcess( v37 )
	{
		Name	"glycerol-3-phosphate dehydrogenase (FAD dependent)";
		K	3.4e-05;
		V	3.99e-08;
		v37_GUT2P	0.001;
		Expression	"CYTOPLASM.Value * (V * v37_GUT2P * G3P.NumberConc / (K + G3P.NumberConc))";
		VariableReferenceList
			[ G3P       Variable:/CYTOPLASM:G3P  -1 ]
			[ FAD       Variable:/MATRIX:FAD     -1 ]
			[ FADH2     Variable:/MATRIX:FADH2   1  ]
			[ DHAP      Variable:/CYTOPLASM:DHAP 1  ]
			[ CYTOPLASM Variable:/CYTOPLASM:SIZE 0  ];
	}
	
	Process ExpressionFluxProcess( v38 )
	{
		Name	"glycerol-3-phosphate dehydrogenase (NAD+ dependent)";
		K	34.0;
		V	0.0399;
		v38_GUT2P	0.001;
		Expression	"CYTOPLASM.Value * (V * v38_GUT2P * NADH_cyt.NumberConc / (K + NADH_cyt.NumberConc))";
		VariableReferenceList
			[ NADH_cyt  Variable:/CYTOPLASM:NADH_cyt -1 ]
			[ DHAP      Variable:/CYTOPLASM:DHAP     -1 ]
			[ G3P       Variable:/CYTOPLASM:G3P      1  ]
			[ NAD       Variable:/CYTOPLASM:NAD      1  ]
			[ CYTOPLASM Variable:/CYTOPLASM:SIZE     0  ];
	}
	
	Process ExpressionFluxProcess( v40 )
	{
		Name	"ATP/ADP carrier";
		V	0.1667;
		K	0.012;
		v40_AAC	0.00033211;
		Expression	"MATRIX.Value * (V * v40_AAC * ADP_cyt.NumberConc / (K + ADP_cyt.NumberConc))";
		VariableReferenceList
			[ ADP_cyt Variable:/CYTOPLASM:ADP_cyt -1 ]
			[ ADP     Variable:/MATRIX:ADP        1  ]
			[ MATRIX  Variable:/MATRIX:SIZE       0  ];
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
		Expression	"CYTOPLASM.Value * v41_IDHc * (IsoCitcyt.NumberConc * NADP_cyt.NumberConc / (phi0 * IsoCitcyt.NumberConc * NADP_cyt.NumberConc + phi1 * NADP_cyt.NumberConc + phi2 * IsoCitcyt.NumberConc + phi12) - OG_cyt.NumberConc * NADPH_cyt.NumberConc * CO2.NumberConc / (phir0 * OG_cyt.NumberConc * NADPH_cyt.NumberConc * CO2.NumberConc + phir1 * NADPH_cyt.NumberConc * CO2.NumberConc + phir2 * OG_cyt.NumberConc * CO2.NumberConc + phir3 * OG_cyt.NumberConc * NADPH_cyt.NumberConc + phir12 * CO2.NumberConc + phir13 * NADPH_cyt.NumberConc + phir23 * OG_cyt.NumberConc + phir123))";
		VariableReferenceList
			[ IsoCitcyt Variable:/CYTOPLASM:IsoCitcyt -1 ]
			[ NADP_cyt  Variable:/CYTOPLASM:NADP_cyt  -1 ]
			[ OG_cyt    Variable:/CYTOPLASM:OG_cyt    1  ]
			[ NADPH_cyt Variable:/CYTOPLASM:NADPH_cyt 1  ]
			[ CO2       Variable:/MATRIX:CO2          0  ]
			[ CYTOPLASM Variable:/CYTOPLASM:SIZE      0  ];
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
		Expression	"MATRIX.Value * ((IsoCitcyt.NumberConc * Mal.NumberConc / alpha / KiS1 / KiS2 * KcF - Mal_cyt.NumberConc * IsoCit.NumberConc / beta / KiP1 / KiP2 * KcR) * v42_CIC / (1 + IsoCitcyt.NumberConc / KiS1 + Mal.NumberConc / KiS2 + Mal_cyt.NumberConc / KiP1 + IsoCit.NumberConc / KiP2 + IsoCitcyt.NumberConc * Mal.NumberConc / alpha / KiS1 / KiS2 + Mal_cyt.NumberConc * IsoCit.NumberConc / beta / KiP1 / KiP2 + Mal.NumberConc * IsoCit.NumberConc / gamma / KiS2 / KiP2 + IsoCitcyt.NumberConc * Mal_cyt.NumberConc / delta / KiS1 / KiP1))";
		VariableReferenceList
			[ IsoCitcyt Variable:/CYTOPLASM:IsoCitcyt -1 ]
			[ Mal       Variable:/MATRIX:Mal          -1 ]
			[ Mal_cyt   Variable:/CYTOPLASM:Mal_cyt   1  ]
			[ IsoCit    Variable:/MATRIX:IsoCit       1  ]
			[ MATRIX    Variable:/MATRIX:SIZE         0  ];
	}
	
	Process ExpressionFluxProcess( v43 )
	{
		Name	"ATP/ADP carrier";
		V	1.11667;
		K	0.005;
		v43_AAC	0.00033211;
		Expression	"MATRIX.Value * (V * v43_AAC * ATP.NumberConc / (K + ATP.NumberConc))";
		VariableReferenceList
			[ ATP     Variable:/MATRIX:ATP        -1 ]
			[ ATP_cyt Variable:/CYTOPLASM:ATP_cyt 1  ]
			[ MATRIX  Variable:/MATRIX:SIZE       0  ];
	}
	
	Process ExpressionFluxProcess( v39 )
	{
		Name	"malate dehydrogenase (oxaloacetate-decarboxylating) (NADP+)";
		Kcat	0.333;
		Kmal	0.000125;
		Knadp	0.011;
		v39_MDH	3.8617e-07;
		Expression	"CYTOPLASM.Value * (v39_MDH * Kcat * Mal_cyt.NumberConc * NADP_cyt.NumberConc / ((Kmal + Mal_cyt.NumberConc) * (Knadp + NADP_cyt.NumberConc)))";
		VariableReferenceList
			[ Mal_cyt   Variable:/CYTOPLASM:Mal_cyt   -1 ]
			[ NADP_cyt  Variable:/CYTOPLASM:NADP_cyt  -1 ]
			[ NADPH_cyt Variable:/CYTOPLASM:NADPH_cyt 1  ]
			[ PYR_cyt   Variable:/CYTOPLASM:PYR_cyt   1  ]
			[ CYTOPLASM Variable:/CYTOPLASM:SIZE      0  ];
	}
	
	Process ExpressionFluxProcess( v44 )
	{
		Name	"malate dehydrogenase (oxaloacetate-decarboxylating) (NADP+)";
		Kcat	130.5;
		Km	0.01295;
		v44_MDH	3.8617e-07;
		Expression	"MATRIX.Value * (v44_MDH * Kcat * Mal.NumberConc / (Km + Mal.NumberConc))";
		VariableReferenceList
			[ Mal    Variable:/MATRIX:Mal    -1 ]
			[ NADP_p Variable:/MATRIX:NADP_p -1 ]
			[ NADPH  Variable:/MATRIX:NADPH  1  ]
			[ Pyr    Variable:/MATRIX:Pyr    1  ]
			[ MATRIX Variable:/MATRIX:SIZE   0  ];
	}
	
	
}

System System( /CYTOPLASM )
{
	StepperID	Default;
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
		NumberConc	1.12817e-05;
		Fixed	0;
	}
	
	Variable Variable( F6P )
	{
		Name	"fructose-6-phosphate";
		NumberConc	0.00065939;
		Fixed	0;
	}
	
	Variable Variable( FBP )
	{
		Name	"fructose-1,6-bisphosphate";
		NumberConc	7.70135e-06;
		Fixed	0;
	}
	
	Variable Variable( GAP )
	{
		Name	"glyceraldehyde 3-phosphate";
		NumberConc	1.90919e-06;
		Fixed	0;
	}
	
	Variable Variable( DPG )
	{
		Name	"1,2-bisphospho-D-glycerate";
		NumberConc	0.000299109;
		Fixed	0;
	}
	
	Variable Variable( PEP )
	{
		Name	phosphoenolpyruvate;
		NumberConc	2.1125e-06;
		Fixed	0;
	}
	
	Variable Variable( PYR_cyt )
	{
		Name	pyruvate;
		NumberConc	4.22702e-06;
		Fixed	0;
	}
	
	Variable Variable( AMP )
	{
		Name	"adenine monophosphate";
		NumberConc	2.61149e-06;
		Fixed	0;
	}
	
	Variable Variable( LAC )
	{
		Name	lactate;
		NumberConc	0.00033981;
		Fixed	0;
	}
	
	Variable Variable( G3P )
	{
		Name	"glycerol-3-phosphate";
		NumberConc	0.0076925;
		Fixed	0;
	}
	
	Variable Variable( DHAP )
	{
		Name	"dihydrohxyacetone-phosphate";
		NumberConc	0.0076925;
		Fixed	0;
	}
	
	Variable Variable( OXA_cyt )
	{
		Name	oxaloacetate;
		NumberConc	4e-06;
		Fixed	0;
	}
	
	Variable Variable( Asp_cyt )
	{
		Name	aspartate;
		NumberConc	0.00114;
		Fixed	0;
	}
	
	Variable Variable( Glu_cyt )
	{
		Name	glutamate;
		NumberConc	0.00303;
		Fixed	0;
	}
	
	Variable Variable( OG_cyt )
	{
		Name	oxoglutarate;
		NumberConc	2.1e-05;
		Fixed	0;
	}
	
	Variable Variable( Mal_cyt )
	{
		Name	malate;
		NumberConc	0.0005;
		Fixed	0;
	}
	
	Variable Variable( Acetyl_CoA_cyt )
	{
		Name	"acetyl CoA";
		NumberConc	3e-05;
		Fixed	0;
	}
	
	Variable Variable( CoA_cyt )
	{
		Name	"coenzyme A";
		NumberConc	0.000272;
		Fixed	0;
	}
	
	Variable Variable( IsoCitcyt )
	{
		Name	isocitrate;
		NumberConc	0.00042;
		Fixed	0;
	}
	
	Variable Variable( Cit_cyt )
	{
		Name	citrate;
		NumberConc	0.00042;
		Fixed	0;
	}
	
	Variable Variable( ATP_cyt )
	{
		Name	"adenine triphosphate";
		NumberConc	0.00449064;
		Fixed	0;
	}
	
	Variable Variable( ADP_cyt )
	{
		Name	"adenine diphosphate";
		NumberConc	0.000108367;
		Fixed	0;
	}
	
	Variable Variable( NAD )
	{
		Name	NAD;
		NumberConc	0.00362057;
		Fixed	0;
	}
	
	Variable Variable( NADH_cyt )
	{
		Name	NADH;
		NumberConc	0.000616118;
		Fixed	0;
	}
	
	Variable Variable( NADP_cyt )
	{
		Name	NADP;
		NumberConc	0.00362057;
		Fixed	0;
	}
	
	Variable Variable( NADPH_cyt )
	{
		Name	NADPH;
		NumberConc	0.000616118;
		Fixed	0;
	}
	
	
}

System System( /MT_IMS )
{
	StepperID	Default;
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
		NumberConc	0.026;
		Fixed	0;
	}
	
	Variable Variable( QH2 )
	{
		Name	ubiquinol;
		NumberConc	0.028;
		Fixed	0;
	}
	
	Variable Variable( Cytc3p )
	{
		Name	"ferrocytochrome c";
		NumberConc	0.003;
		Fixed	0;
	}
	
	Variable Variable( Cytc2p )
	{
		Name	"ferricytochrome c";
		NumberConc	0.00011;
		Fixed	0;
	}
	
	
}

System System( /MT_IM )
{
	StepperID	Default;
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
	StepperID	Default;
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
		NumberConc	0.001025;
		Fixed	0;
	}
	
	Variable Variable( CO2 )
	{
		Name	"carbon dioxide";
		NumberConc	0.00163;
		Fixed	0;
	}
	
	Variable Variable( CoA )
	{
		Name	"coenzyme A";
		NumberConc	0.000272;
		Fixed	0;
	}
	
	Variable Variable( Acetyl_CoA )
	{
		Name	"acetyl CoA";
		NumberConc	3e-05;
		Fixed	0;
	}
	
	Variable Variable( Pi )
	{
		Name	phosphate;
		NumberConc	0.004;
		Fixed	0;
	}
	
	Variable Variable( Fum )
	{
		Name	fumarate;
		NumberConc	6.5e-05;
		Fixed	0;
	}
	
	Variable Variable( SCoA )
	{
		Name	"succinyl-CoA";
		NumberConc	0.0002941;
		Fixed	0;
	}
	
	Variable Variable( Suc )
	{
		Name	succinate;
		NumberConc	0.00295;
		Fixed	0;
	}
	
	Variable Variable( GTP )
	{
		Name	"guanosine triphosphate";
		NumberConc	0.0045;
		Fixed	0;
	}
	
	Variable Variable( GDP )
	{
		Name	"guanosine diphosphate";
		NumberConc	0.00045;
		Fixed	0;
	}
	
	Variable Variable( Ala )
	{
		Name	slanine;
		NumberConc	0.00344;
		Fixed	0;
	}
	
	Variable Variable( Asp )
	{
		Name	aspartate;
		NumberConc	0.00114;
		Fixed	0;
	}
	
	Variable Variable( Glu )
	{
		Name	glutamate;
		NumberConc	0.00303;
		Fixed	0;
	}
	
	Variable Variable( H2O )
	{
		Name	water;
		NumberConc	0.001;
		Fixed	0;
	}
	
	Variable Variable( ETFred )
	{
		Name	"electron transfer flavoprotein (reduced form)";
		NumberConc	0.00031;
		Fixed	0;
	}
	
	Variable Variable( ETFox )
	{
		Name	"electron transfer flavoprotein (oxidised form)";
		NumberConc	0.00032;
		Fixed	0;
	}
	
	Variable Variable( FADH2 )
	{
		Name	FADH2;
		NumberConc	7.2e-05;
		Fixed	0;
	}
	
	Variable Variable( FAD )
	{
		Name	FAD;
		NumberConc	0.00101;
		Fixed	0;
	}
	
	Variable Variable( OG )
	{
		Name	oxoglutarate;
		NumberConc	2.1e-05;
		Fixed	0;
	}
	
	Variable Variable( Mal )
	{
		Name	malate;
		NumberConc	0.0005;
		Fixed	0;
	}
	
	Variable Variable( OXA )
	{
		Name	oxaloacetate;
		NumberConc	4e-06;
		Fixed	0;
	}
	
	Variable Variable( Cit )
	{
		Name	citrate;
		NumberConc	0.00042;
		Fixed	0;
	}
	
	Variable Variable( IsoCit )
	{
		Name	isocitrate;
		NumberConc	0.00042;
		Fixed	0;
	}
	
	Variable Variable( ATP )
	{
		Name	"adenine triphosphate";
		NumberConc	0.0045;
		Fixed	0;
	}
	
	Variable Variable( ADP )
	{
		Name	"adenine diphosphate";
		NumberConc	0.00045;
		Fixed	0;
	}
	
	Variable Variable( NADP_p )
	{
		Name	"NADP+";
		NumberConc	0.0101;
		Fixed	0;
	}
	
	Variable Variable( NADPH )
	{
		Name	NADPH;
		NumberConc	7.2e-05;
		Fixed	0;
	}
	
	Variable Variable( NAD_p )
	{
		Name	"NAD+";
		NumberConc	0.0101;
		Fixed	0;
	}
	
	Variable Variable( NADH )
	{
		Name	NADH;
		NumberConc	0.00072;
		Fixed	0;
	}
	
	
}

System System( /SBMLParameter )
{
	StepperID	Default;
	Name	"Global Parameter";

	Variable Variable( flow )
	{
		Value	0.011;
		Fixed	1;
	}
	
	
}

