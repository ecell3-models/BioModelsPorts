
# created by eml2em program
# from file: BIOMD0000000410.eml, date: Sun Mar  2 21:15:21 2014
#

Stepper ODEStepper( Default )
{
	# no property
}

System System( / )
{
	StepperID	Default;
	Name	default;

	Process ExpressionFluxProcess( _29 )
	{
		Name	Smad_dissoc3;
		k1	0.0492;
		Expression	"_3.Value * k1 * species_27.NumberConc";
		VariableReferenceList
			[ species_27 Variable:/_3:species_27 -1 ]
			[ _5         Variable:/_3:_5         1  ]
			[ species_17 Variable:/_3:species_17 2  ]
			[ _3         Variable:/_3:SIZE       0  ];
	}
	
	Process ExpressionFluxProcess( _31 )
	{
		Name	Smad2_dephosphNuc;
		Km	40.0;
		V	2.34;
		Expression	"_3.Value * (V * _9.NumberConc / (Km + _9.NumberConc))";
		VariableReferenceList
			[ _9         Variable:/_3:_9         -1 ]
			[ species_19 Variable:/_3:species_19 1  ]
			[ _3         Variable:/_3:SIZE       0  ];
	}
	
	Process ExpressionFluxProcess( _33 )
	{
		Name	Smad_inhibComp2SnoN;
		k1	1.6;
		k2	1.6;
		Expression	"_3.Value * (k1 * _9.NumberConc * pow(_11.NumberConc, 2) - k2 * _13.NumberConc)";
		VariableReferenceList
			[ _9  Variable:/_3:_9   -1 ]
			[ _11 Variable:/_3:_11  -2 ]
			[ _13 Variable:/_3:_13  1  ]
			[ _3  Variable:/_3:SIZE 0  ];
	}
	
	Process ExpressionFluxProcess( _35 )
	{
		Name	SnoN_degrad2;
		k1	0.232;
		Expression	"k1 * pow(_15.NumberConc, 3) * species_13.NumberConc";
		VariableReferenceList
			[ _15        Variable:/_3:_15        -3 ]
			[ species_13 Variable:/_1:species_13 -1 ]
			[ _19        Variable:/_3:_19        3  ];
	}
	
	Process ExpressionFluxProcess( _37 )
	{
		Name	Smad_compNuc2;
		k1	255.068;
		Expression	"_3.Value * k1 * _5.NumberConc * pow(_19.NumberConc, 2)";
		VariableReferenceList
			[ _5  Variable:/_3:_5   -1 ]
			[ _19 Variable:/_3:_19  -2 ]
			[ _9  Variable:/_3:_9   1  ]
			[ _3  Variable:/_3:SIZE 0  ];
	}
	
	Process ExpressionFluxProcess( _39 )
	{
		Name	Smad2_dephosphNuc2;
		Km	0.53;
		V	3.51;
		Expression	"_3.Value * (V * _19.NumberConc / (Km + _19.NumberConc))";
		VariableReferenceList
			[ _19 Variable:/_3:_19  -1 ]
			[ _21 Variable:/_3:_21  1  ]
			[ _3  Variable:/_3:SIZE 0  ];
	}
	
	Process ExpressionFluxProcess( _41 )
	{
		Name	Smad2_degrad;
		k1	0.2;
		Expression	"_3.Value * k1 * _21.NumberConc * _15.NumberConc";
		VariableReferenceList
			[ _21 Variable:/_3:_21  -1 ]
			[ _15 Variable:/_3:_15  -1 ]
			[ _3  Variable:/_3:SIZE 0  ];
	}
	
	Process ExpressionFluxProcess( _43 )
	{
		Name	"Smad7-Smurf2";
		k1	2.9;
		k2	0.2;
		Expression	"_3.Value * (k1 * _15.NumberConc * _25.NumberConc - k2 * _27.NumberConc)";
		VariableReferenceList
			[ _15 Variable:/_3:_15  -1 ]
			[ _25 Variable:/_3:_25  -1 ]
			[ _27 Variable:/_3:_27  1  ]
			[ _3  Variable:/_3:SIZE 0  ];
	}
	
	Process ExpressionFluxProcess( _77 )
	{
		Name	Rec_comp1;
		k	9.45;
		Expression	"_1.Value * k * _75.NumberConc * _75.NumberConc * parameter_1.Value";
		VariableReferenceList
			[ _75         Variable:/_1:_75                    -2 ]
			[ _79         Variable:/_1:_79                    1  ]
			[ _1          Variable:/_1:SIZE                   0  ]
			[ parameter_1 Variable:/SBMLParameter:parameter_1 0  ];
	}
	
	Process ExpressionFluxProcess( _86 )
	{
		Name	Rec_comp2;
		k1	0.03333;
		k2	0.03333;
		Expression	"_1.Value * (k1 * _79.NumberConc * pow(_84.NumberConc, 2) - k2 * _96.NumberConc)";
		VariableReferenceList
			[ _79 Variable:/_1:_79  -1 ]
			[ _84 Variable:/_1:_84  -2 ]
			[ _96 Variable:/_1:_96  1  ]
			[ _1  Variable:/_1:SIZE 0  ];
	}
	
	Process ExpressionFluxProcess( _103 )
	{
		Name	"SARA-comp2";
		k1	1.0;
		k2	0.1;
		Expression	"_1.Value * (k1 * _101.NumberConc * _99.NumberConc - k2 * _105.NumberConc)";
		VariableReferenceList
			[ _101 Variable:/_1:_101 -1 ]
			[ _99  Variable:/_1:_99  -1 ]
			[ _105 Variable:/_1:_105 1  ]
			[ _1   Variable:/_1:SIZE 0  ];
	}
	
	Process ExpressionFluxProcess( _125 )
	{
		Name	Smad2_phosph;
		k	1000.0;
		km	0.0318;
		Expression	"_1.Value * (k * _96.NumberConc * _99.NumberConc / (km + _99.NumberConc))";
		VariableReferenceList
			[ _99  Variable:/_1:_99  -1 ]
			[ _129 Variable:/_1:_129 1  ]
			[ _96  Variable:/_1:_96  0  ]
			[ _1   Variable:/_1:SIZE 0  ];
	}
	
	Process ExpressionFluxProcess( _132 )
	{
		Name	Smad2_phosphSARA;
		k	3.51;
		km	0.53;
		Expression	"_1.Value * (k * _96.NumberConc * _105.NumberConc / (km + _105.NumberConc))";
		VariableReferenceList
			[ _105 Variable:/_1:_105 -1 ]
			[ _129 Variable:/_1:_129 1  ]
			[ _101 Variable:/_1:_101 1  ]
			[ _96  Variable:/_1:_96  0  ]
			[ _1   Variable:/_1:SIZE 0  ];
	}
	
	Process ExpressionFluxProcess( _139 )
	{
		Name	"Smad2-P_transp";
		k1	16.6;
		Expression	"k1 * _129.NumberConc";
		VariableReferenceList
			[ _129 Variable:/_1:_129 -1 ]
			[ _19  Variable:/_3:_19  1  ];
	}
	
	Process ExpressionFluxProcess( _149 )
	{
		Name	Smad_compCyt2;
		k1	1000.0;
		Expression	"_1.Value * k1 * _147.NumberConc * pow(_129.NumberConc, 2)";
		VariableReferenceList
			[ _147 Variable:/_1:_147 -1 ]
			[ _129 Variable:/_1:_129 -2 ]
			[ _153 Variable:/_1:_153 1  ]
			[ _1   Variable:/_1:SIZE 0  ];
	}
	
	Process ExpressionFluxProcess( _156 )
	{
		Name	Smad4_transp;
		k1	0.156;
		k2	0.156;
		Expression	"k1 * _147.NumberConc - k2 * _5.NumberConc";
		VariableReferenceList
			[ _147 Variable:/_1:_147 -1 ]
			[ _5   Variable:/_3:_5   1  ];
	}
	
	Process ExpressionFluxProcess( _164 )
	{
		Name	Smad_compTransp2;
		k1	0.16;
		Expression	"k1 * _153.NumberConc";
		VariableReferenceList
			[ _153 Variable:/_1:_153 -1 ]
			[ _9   Variable:/_3:_9   1  ];
	}
	
	Process ExpressionFluxProcess( _172 )
	{
		Name	Smad7_transp;
		k1	0.1;
		k2	0.01;
		Expression	"k1 * _25.NumberConc - k2 * _174.NumberConc";
		VariableReferenceList
			[ _25  Variable:/_3:_25  -1 ]
			[ _174 Variable:/_1:_174 1  ];
	}
	
	Process ExpressionFluxProcess( _178 )
	{
		Name	"Smad7-Smurf2_transp";
		k1	1.0;
		k2	0.01;
		Expression	"k1 * _27.NumberConc - k2 * _181.NumberConc";
		VariableReferenceList
			[ _27  Variable:/_3:_27  -1 ]
			[ _181 Variable:/_1:_181 1  ];
	}
	
	Process ExpressionFluxProcess( _192 )
	{
		Name	Rec_degrad1;
		k1	1900.0;
		Expression	"_1.Value * k1 * _181.NumberConc * _96.NumberConc";
		VariableReferenceList
			[ _181 Variable:/_1:_181 -1 ]
			[ _96  Variable:/_1:_96  -1 ]
			[ _1   Variable:/_1:SIZE 0  ];
	}
	
	Process ExpressionFluxProcess( _194 )
	{
		Name	Rec_inhib;
		k1	8.69;
		k2	0.01;
		Expression	"_1.Value * (k1 * _174.NumberConc * _96.NumberConc - k2 * _198.NumberConc)";
		VariableReferenceList
			[ _174 Variable:/_1:_174 -1 ]
			[ _96  Variable:/_1:_96  -1 ]
			[ _198 Variable:/_1:_198 1  ]
			[ _1   Variable:/_1:SIZE 0  ];
	}
	
	Process ExpressionFluxProcess( reaction_1 )
	{
		Name	fluxRecII;
		v	0.00146;
		Expression	"_1.Value * v";
		VariableReferenceList
			[ _75 Variable:/_1:_75  1 ]
			[ _1  Variable:/_1:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( reaction_2 )
	{
		Name	fluxSara;
		k	0.0001;
		k1	0.031;
		Expression	"_1.Value * (k + k1 * species_30.NumberConc)";
		VariableReferenceList
			[ _101       Variable:/_1:_101       1 ]
			[ species_30 Variable:/_3:species_30 0 ]
			[ _1         Variable:/_1:SIZE       0 ];
	}
	
	Process ExpressionFluxProcess( reaction_3 )
	{
		Name	fluxSmad7;
		k	0.0001;
		k1	0.1;
		Expression	"_1.Value * ((k + k1 * species_30.NumberConc) / (1 + species_16.NumberConc + species_23.NumberConc))";
		VariableReferenceList
			[ _174       Variable:/_1:_174       1 ]
			[ species_30 Variable:/_3:species_30 0 ]
			[ species_16 Variable:/_3:species_16 0 ]
			[ species_23 Variable:/_3:species_23 0 ]
			[ _1         Variable:/_1:SIZE       0 ];
	}
	
	Process ExpressionFluxProcess( reaction_4 )
	{
		Name	fluxSmurf2;
		k	0.000228;
		k1	0.0285;
		Expression	"_1.Value * (k + k1 * species_30.NumberConc)";
		VariableReferenceList
			[ species_1  Variable:/_1:species_1  1 ]
			[ species_30 Variable:/_3:species_30 0 ]
			[ _1         Variable:/_1:SIZE       0 ];
	}
	
	Process ExpressionFluxProcess( reaction_5 )
	{
		Name	fluxSnoN;
		k	2e-05;
		k1	0.00055;
		Expression	"_1.Value * (k + k1 * species_30.NumberConc)";
		VariableReferenceList
			[ species_2  Variable:/_1:species_2  1 ]
			[ species_30 Variable:/_3:species_30 0 ]
			[ _1         Variable:/_1:SIZE       0 ];
	}
	
	Process ExpressionFluxProcess( reaction_6 )
	{
		Name	fluxRecI;
		v	0.0125;
		Expression	"_1.Value * v";
		VariableReferenceList
			[ _84 Variable:/_1:_84  1 ]
			[ _1  Variable:/_1:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( reaction_7 )
	{
		Name	"Smad4-SnoN";
		k1	1.0;
		k2	0.05288;
		Expression	"_3.Value * (k1 * _5.NumberConc * _11.NumberConc - k2 * species_16.NumberConc)";
		VariableReferenceList
			[ _5         Variable:/_3:_5         -1 ]
			[ _11        Variable:/_3:_11        -1 ]
			[ species_16 Variable:/_3:species_16 1  ]
			[ _3         Variable:/_3:SIZE       0  ];
	}
	
	Process ExpressionFluxProcess( reaction_8 )
	{
		Name	Smad2_transp;
		k1	0.156;
		k2	0.336;
		Expression	"k1 * _99.NumberConc - k2 * _21.NumberConc";
		VariableReferenceList
			[ _99 Variable:/_1:_99 -1 ]
			[ _21 Variable:/_3:_21 1  ];
	}
	
	Process ExpressionFluxProcess( reaction_9 )
	{
		Name	Rec_degrad;
		k1	0.027778;
		Expression	"_1.Value * k1 * _96.NumberConc";
		VariableReferenceList
			[ _96 Variable:/_1:_96  -1 ]
			[ _1  Variable:/_1:SIZE 0  ];
	}
	
	Process ExpressionFluxProcess( reaction_10 )
	{
		Name	RecI_degrad;
		k1	0.027778;
		Expression	"_1.Value * k1 * _84.NumberConc";
		VariableReferenceList
			[ _84 Variable:/_1:_84  -1 ]
			[ _1  Variable:/_1:SIZE 0  ];
	}
	
	Process ExpressionFluxProcess( reaction_11 )
	{
		Name	RecII_degrad;
		k1	0.027778;
		Expression	"_1.Value * k1 * _75.NumberConc";
		VariableReferenceList
			[ _75 Variable:/_1:_75  -1 ]
			[ _1  Variable:/_1:SIZE 0  ];
	}
	
	Process ExpressionFluxProcess( reaction_12 )
	{
		Name	Rec_recycl;
		k1	0.03333;
		Expression	"_1.Value * k1 * _79.NumberConc";
		VariableReferenceList
			[ _79 Variable:/_1:_79  -1 ]
			[ _75 Variable:/_1:_75  2  ]
			[ _1  Variable:/_1:SIZE 0  ];
	}
	
	Process ExpressionFluxProcess( reaction_13 )
	{
		Name	fluxSmad2;
		v	0.0156;
		Expression	"_1.Value * v";
		VariableReferenceList
			[ _99 Variable:/_1:_99  1 ]
			[ _1  Variable:/_1:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( reaction_14 )
	{
		Name	fluxSmad4;
		v	0.01183;
		Expression	"_1.Value * v";
		VariableReferenceList
			[ _147 Variable:/_1:_147 1 ]
			[ _1   Variable:/_1:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( reaction_15 )
	{
		Name	Smad4_degrad;
		k1	0.1266;
		Expression	"_1.Value * k1 * _147.NumberConc";
		VariableReferenceList
			[ _147 Variable:/_1:_147 -1 ]
			[ _1   Variable:/_1:SIZE 0  ];
	}
	
	Process ExpressionFluxProcess( reaction_16 )
	{
		Name	SARA_degrad;
		k1	0.065;
		Expression	"_1.Value * k1 * _101.NumberConc";
		VariableReferenceList
			[ _101 Variable:/_1:_101 -1 ]
			[ _1   Variable:/_1:SIZE 0  ];
	}
	
	Process ExpressionFluxProcess( reaction_17 )
	{
		Name	Smad2_dephospCyt;
		Km	3.51;
		V	0.53;
		Expression	"_1.Value * (V * _129.NumberConc / (Km + _129.NumberConc))";
		VariableReferenceList
			[ _129 Variable:/_1:_129 -1 ]
			[ _99  Variable:/_1:_99  1  ]
			[ _1   Variable:/_1:SIZE 0  ];
	}
	
	Process ExpressionFluxProcess( reaction_18 )
	{
		Name	SnoN_degrad;
		k1	0.232;
		Expression	"_1.Value * k1 * species_2.NumberConc";
		VariableReferenceList
			[ species_2 Variable:/_1:species_2 -1 ]
			[ _1        Variable:/_1:SIZE      0  ];
	}
	
	Process ExpressionFluxProcess( reaction_19 )
	{
		Name	Smurf2_transp;
		k1	0.2333;
		k2	1.8056;
		Expression	"k1 * _15.NumberConc - k2 * species_1.NumberConc";
		VariableReferenceList
			[ _15       Variable:/_3:_15       -1 ]
			[ species_1 Variable:/_1:species_1 1  ];
	}
	
	Process ExpressionFluxProcess( reaction_20 )
	{
		Name	Smad2_cyt_degrad;
		k1	0.2;
		Expression	"_1.Value * k1 * _99.NumberConc";
		VariableReferenceList
			[ _99 Variable:/_1:_99  -1 ]
			[ _1  Variable:/_1:SIZE 0  ];
	}
	
	Process ExpressionFluxProcess( reaction_21 )
	{
		Name	SnoN_trans;
		k1	0.1;
		k2	0.2;
		Expression	"k1 * species_2.NumberConc - k2 * _11.NumberConc";
		VariableReferenceList
			[ species_2 Variable:/_1:species_2 -1 ]
			[ _11       Variable:/_3:_11       1  ];
	}
	
	Process ExpressionFluxProcess( reaction_22 )
	{
		Name	fluxSmad3;
		v	0.04528;
		Expression	"_1.Value * v";
		VariableReferenceList
			[ species_3 Variable:/_1:species_3 1 ]
			[ _1        Variable:/_1:SIZE      0 ];
	}
	
	Process ExpressionFluxProcess( reaction_23 )
	{
		Name	Smad3_cyt_degrad;
		k1	0.2;
		Expression	"_1.Value * k1 * species_3.NumberConc";
		VariableReferenceList
			[ species_3 Variable:/_1:species_3 -1 ]
			[ _1        Variable:/_1:SIZE      0  ];
	}
	
	Process ExpressionFluxProcess( reaction_24 )
	{
		Name	Smad3_dephospCyt;
		Km	3.51;
		V	0.53;
		Expression	"_1.Value * (V * species_4.NumberConc / (Km + species_4.NumberConc))";
		VariableReferenceList
			[ species_4 Variable:/_1:species_4 -1 ]
			[ species_3 Variable:/_1:species_3 1  ]
			[ _1        Variable:/_1:SIZE      0  ];
	}
	
	Process ExpressionFluxProcess( reaction_25 )
	{
		Name	Smad3_dephospNuc;
		Km	40.0;
		V	2.34;
		Expression	"_3.Value * (V * species_18.NumberConc / (Km + species_18.NumberConc))";
		VariableReferenceList
			[ species_18 Variable:/_3:species_18 -1 ]
			[ species_27 Variable:/_3:species_27 1  ]
			[ _3         Variable:/_3:SIZE       0  ];
	}
	
	Process ExpressionFluxProcess( reaction_26 )
	{
		Name	Smad3_dephospNuc2;
		Km	0.53;
		V	3.51;
		Expression	"_3.Value * (V * species_20.NumberConc / (Km + species_20.NumberConc))";
		VariableReferenceList
			[ species_20 Variable:/_3:species_20 -1 ]
			[ species_17 Variable:/_3:species_17 1  ]
			[ _3         Variable:/_3:SIZE       0  ];
	}
	
	Process ExpressionFluxProcess( reaction_27 )
	{
		Name	Smad3_phosph;
		k	1000.0;
		km	0.0318;
		Expression	"_1.Value * (k * _96.NumberConc * species_3.NumberConc / (km + species_3.NumberConc))";
		VariableReferenceList
			[ species_3 Variable:/_1:species_3 -1 ]
			[ species_4 Variable:/_1:species_4 1  ]
			[ _96       Variable:/_1:_96       0  ]
			[ _1        Variable:/_1:SIZE      0  ];
	}
	
	Process ExpressionFluxProcess( reaction_28 )
	{
		Name	Smad3_phosphSARA;
		k	3.51;
		km	0.53;
		Expression	"_1.Value * (k * _96.NumberConc * species_5.NumberConc / (km + species_5.NumberConc))";
		VariableReferenceList
			[ species_5 Variable:/_1:species_5 -1 ]
			[ species_4 Variable:/_1:species_4 1  ]
			[ _101      Variable:/_1:_101      1  ]
			[ _96       Variable:/_1:_96       0  ]
			[ _1        Variable:/_1:SIZE      0  ];
	}
	
	Process ExpressionFluxProcess( reaction_29 )
	{
		Name	Smad3_degrad;
		k1	0.2;
		Expression	"_3.Value * k1 * species_17.NumberConc";
		VariableReferenceList
			[ species_17 Variable:/_3:species_17 -1 ]
			[ _3         Variable:/_3:SIZE       0  ];
	}
	
	Process ExpressionFluxProcess( reaction_30 )
	{
		Name	Smad3_transp;
		k1	0.156;
		k2	0.336;
		Expression	"k1 * species_3.NumberConc - k2 * species_17.NumberConc";
		VariableReferenceList
			[ species_3  Variable:/_1:species_3  -1 ]
			[ species_17 Variable:/_3:species_17 1  ];
	}
	
	Process ExpressionFluxProcess( reaction_31 )
	{
		Name	"SARA-comp3";
		k1	1.0;
		k2	0.1;
		Expression	"_1.Value * (k1 * _101.NumberConc * species_3.NumberConc - k2 * species_5.NumberConc)";
		VariableReferenceList
			[ _101      Variable:/_1:_101      -1 ]
			[ species_3 Variable:/_1:species_3 -1 ]
			[ species_5 Variable:/_1:species_5 1  ]
			[ _1        Variable:/_1:SIZE      0  ];
	}
	
	Process ExpressionFluxProcess( reaction_32 )
	{
		Name	Smad_dissoc2;
		k1	0.0492;
		Expression	"_3.Value * k1 * species_19.NumberConc";
		VariableReferenceList
			[ species_19 Variable:/_3:species_19 -1 ]
			[ _5         Variable:/_3:_5         1  ]
			[ _21        Variable:/_3:_21        2  ]
			[ _3         Variable:/_3:SIZE       0  ];
	}
	
	Process ExpressionFluxProcess( reaction_33 )
	{
		Name	"Smad3-P-transp";
		k1	16.6;
		Expression	"k1 * species_4.NumberConc";
		VariableReferenceList
			[ species_4  Variable:/_1:species_4  -1 ]
			[ species_20 Variable:/_3:species_20 1  ];
	}
	
	Process ExpressionFluxProcess( reaction_34 )
	{
		Name	Smad_compCyt3;
		k1	1000.0;
		Expression	"_1.Value * k1 * _147.NumberConc * pow(species_4.NumberConc, 2)";
		VariableReferenceList
			[ _147      Variable:/_1:_147      -1 ]
			[ species_4 Variable:/_1:species_4 -2 ]
			[ species_6 Variable:/_1:species_6 1  ]
			[ _1        Variable:/_1:SIZE      0  ];
	}
	
	Process ExpressionFluxProcess( reaction_35 )
	{
		Name	Smad_compNuc3;
		k1	255.068;
		Expression	"_3.Value * k1 * _5.NumberConc * pow(species_20.NumberConc, 2)";
		VariableReferenceList
			[ _5         Variable:/_3:_5         -1 ]
			[ species_20 Variable:/_3:species_20 -2 ]
			[ species_18 Variable:/_3:species_18 1  ]
			[ _3         Variable:/_3:SIZE       0  ];
	}
	
	Process ExpressionFluxProcess( reaction_36 )
	{
		Name	Smad_inhibComp3SnoN;
		k1	1.6;
		k2	1.6;
		Expression	"_3.Value * (k1 * species_18.NumberConc * pow(_11.NumberConc, 2) - k2 * species_21.NumberConc)";
		VariableReferenceList
			[ species_18 Variable:/_3:species_18 -1 ]
			[ _11        Variable:/_3:_11        -2 ]
			[ species_21 Variable:/_3:species_21 1  ]
			[ _3         Variable:/_3:SIZE       0  ];
	}
	
	Process ExpressionFluxProcess( reaction_37 )
	{
		Name	Smad_compTransp3;
		k1	0.16;
		Expression	"k1 * species_6.NumberConc";
		VariableReferenceList
			[ species_6  Variable:/_1:species_6  -1 ]
			[ species_18 Variable:/_3:species_18 1  ];
	}
	
	Process ExpressionFluxProcess( reaction_38 )
	{
		Name	SnoN_degrad3;
		k1	0.232;
		Expression	"k1 * species_14.NumberConc";
		VariableReferenceList
			[ species_14 Variable:/_1:species_14 -1 ]
			[ species_20 Variable:/_3:species_20 1  ];
	}
	
	Process ExpressionFluxProcess( reaction_39 )
	{
		Name	Smad7_degrad;
		k1	0.1;
		Expression	"_1.Value * k1 * _174.NumberConc * (1 + species_15.NumberConc)";
		VariableReferenceList
			[ _174       Variable:/_1:_174       -1 ]
			[ species_15 Variable:/_1:species_15 0  ]
			[ _1         Variable:/_1:SIZE       0  ];
	}
	
	Process ExpressionFluxProcess( reaction_40 )
	{
		Name	Ski_degrad;
		k1	0.232;
		Expression	"_1.Value * k1 * species_7.NumberConc";
		VariableReferenceList
			[ species_7 Variable:/_1:species_7 -1 ]
			[ _1        Variable:/_1:SIZE      0  ];
	}
	
	Process ExpressionFluxProcess( reaction_41 )
	{
		Name	Ski_trans;
		k1	0.1;
		k2	0.2;
		Expression	"k1 * species_7.NumberConc - k2 * species_22.NumberConc";
		VariableReferenceList
			[ species_7  Variable:/_1:species_7  -1 ]
			[ species_22 Variable:/_3:species_22 1  ];
	}
	
	Process ExpressionFluxProcess( reaction_42 )
	{
		Name	fluxSki;
		k	2e-05;
		k1	0.00055;
		Expression	"_1.Value * (k + k1 * species_30.NumberConc)";
		VariableReferenceList
			[ species_7  Variable:/_1:species_7  1 ]
			[ species_30 Variable:/_3:species_30 0 ]
			[ _1         Variable:/_1:SIZE       0 ];
	}
	
	Process ExpressionFluxProcess( reaction_43 )
	{
		Name	Smurf2_degrad;
		k1	0.05;
		Expression	"_1.Value * k1 * species_1.NumberConc * (1 + _174.NumberConc)";
		VariableReferenceList
			[ species_1 Variable:/_1:species_1 -1 ]
			[ _174      Variable:/_1:_174      0  ]
			[ _1        Variable:/_1:SIZE      0  ];
	}
	
	Process ExpressionFluxProcess( reaction_44 )
	{
		Name	"Smad4-Ski";
		k1	1.0;
		k2	0.05288;
		Expression	"_3.Value * (k1 * _5.NumberConc * species_22.NumberConc - k2 * species_23.NumberConc)";
		VariableReferenceList
			[ _5         Variable:/_3:_5         -1 ]
			[ species_22 Variable:/_3:species_22 -1 ]
			[ species_23 Variable:/_3:species_23 1  ]
			[ _3         Variable:/_3:SIZE       0  ];
	}
	
	Process ExpressionFluxProcess( reaction_45 )
	{
		Name	"Smad3-Ski_cyt";
		k1	0.1;
		k2	0.1;
		Expression	"_1.Value * (k1 * species_3.NumberConc * species_7.NumberConc - k2 * species_8.NumberConc)";
		VariableReferenceList
			[ species_3 Variable:/_1:species_3 -1 ]
			[ species_7 Variable:/_1:species_7 -1 ]
			[ species_8 Variable:/_1:species_8 1  ]
			[ _1        Variable:/_1:SIZE      0  ];
	}
	
	Process ExpressionFluxProcess( reaction_46 )
	{
		Name	"Smad7-Smurf1";
		k1	2.9;
		k2	0.2;
		Expression	"_3.Value * (k1 * species_24.NumberConc * _25.NumberConc - k2 * species_25.NumberConc)";
		VariableReferenceList
			[ species_24 Variable:/_3:species_24 -1 ]
			[ _25        Variable:/_3:_25        -1 ]
			[ species_25 Variable:/_3:species_25 1  ]
			[ _3         Variable:/_3:SIZE       0  ];
	}
	
	Process ExpressionFluxProcess( reaction_47 )
	{
		Name	fluxSmurf1;
		k	0.0001;
		k1	0.0022;
		Expression	"_1.Value * (k + k1 * species_30.NumberConc)";
		VariableReferenceList
			[ species_9  Variable:/_1:species_9  1 ]
			[ species_30 Variable:/_3:species_30 0 ]
			[ _1         Variable:/_1:SIZE       0 ];
	}
	
	Process ExpressionFluxProcess( reaction_48 )
	{
		Name	Smad_inhibComp3Ski;
		k1	1.6;
		k2	1.6;
		Expression	"_3.Value * (k1 * species_18.NumberConc * pow(species_22.NumberConc, 2) - k2 * species_26.NumberConc)";
		VariableReferenceList
			[ species_18 Variable:/_3:species_18 -1 ]
			[ species_22 Variable:/_3:species_22 -2 ]
			[ species_26 Variable:/_3:species_26 1  ]
			[ _3         Variable:/_3:SIZE       0  ];
	}
	
	Process ExpressionFluxProcess( reaction_49 )
	{
		Name	Rec_degrad2;
		k1	1900.0;
		Expression	"_1.Value * k1 * species_10.NumberConc * _96.NumberConc";
		VariableReferenceList
			[ species_10 Variable:/_1:species_10 -1 ]
			[ _96        Variable:/_1:_96        -1 ]
			[ _1         Variable:/_1:SIZE       0  ];
	}
	
	Process ExpressionFluxProcess( reaction_50 )
	{
		Name	"Smad7-Smurf1_transp";
		k1	1.0;
		k2	0.01;
		Expression	"k1 * species_25.NumberConc - k2 * species_10.NumberConc";
		VariableReferenceList
			[ species_25 Variable:/_3:species_25 -1 ]
			[ species_10 Variable:/_1:species_10 1  ];
	}
	
	Process ExpressionFluxProcess( reaction_51 )
	{
		Name	Smurf1_degrad;
		k1	0.5;
		Expression	"_1.Value * k1 * species_9.NumberConc * (1 + _174.NumberConc)";
		VariableReferenceList
			[ species_9 Variable:/_1:species_9 -1 ]
			[ _174      Variable:/_1:_174      0  ]
			[ _1        Variable:/_1:SIZE      0  ];
	}
	
	Process ExpressionFluxProcess( reaction_52 )
	{
		Name	Smurf1_transp;
		k1	0.05;
		k2	3.0;
		Expression	"k1 * species_24.NumberConc - k2 * species_9.NumberConc";
		VariableReferenceList
			[ species_24 Variable:/_3:species_24 -1 ]
			[ species_9  Variable:/_1:species_9  1  ];
	}
	
	Process ExpressionFluxProcess( reaction_53 )
	{
		Name	"Smad3-freePromot";
		k1	0.463;
		k2	0.102;
		Expression	"_3.Value * (k1 * species_18.NumberConc * species_28.NumberConc - k2 * species_30.NumberConc)";
		VariableReferenceList
			[ species_18 Variable:/_3:species_18 -1 ]
			[ species_28 Variable:/_3:species_28 -1 ]
			[ species_30 Variable:/_3:species_30 1  ]
			[ _3         Variable:/_3:SIZE       0  ];
	}
	
	Process ExpressionFluxProcess( reaction_54 )
	{
		Name	"Smad2-freePromot";
		k1	0.463;
		k2	0.102;
		Expression	"_3.Value * (k1 * _9.NumberConc * species_28.NumberConc - k2 * species_30.NumberConc)";
		VariableReferenceList
			[ _9         Variable:/_3:_9         -1 ]
			[ species_28 Variable:/_3:species_28 -1 ]
			[ species_30 Variable:/_3:species_30 1  ]
			[ _3         Variable:/_3:SIZE       0  ];
	}
	
	Process ExpressionFluxProcess( reaction_55 )
	{
		Name	"Smad3-SnoN-freePromot";
		k1	0.2;
		k2	0.2;
		Expression	"_3.Value * (k1 * species_21.NumberConc * species_28.NumberConc - k2 * species_29.NumberConc)";
		VariableReferenceList
			[ species_21 Variable:/_3:species_21 -1 ]
			[ species_28 Variable:/_3:species_28 -1 ]
			[ species_29 Variable:/_3:species_29 1  ]
			[ _3         Variable:/_3:SIZE       0  ];
	}
	
	Process ExpressionFluxProcess( reaction_56 )
	{
		Name	"Smad2-SnoN-gene";
		k1	0.2;
		k2	0.2;
		Expression	"_3.Value * (k1 * _13.NumberConc * species_28.NumberConc - k2 * species_29.NumberConc)";
		VariableReferenceList
			[ _13        Variable:/_3:_13        -1 ]
			[ species_28 Variable:/_3:species_28 -1 ]
			[ species_29 Variable:/_3:species_29 1  ]
			[ _3         Variable:/_3:SIZE       0  ];
	}
	
	Process ExpressionFluxProcess( reaction_57 )
	{
		Name	"Smad3-Ski-freePromot";
		k1	0.2;
		k2	0.2;
		Expression	"_3.Value * (k1 * species_26.NumberConc * species_28.NumberConc - k2 * species_29.NumberConc)";
		VariableReferenceList
			[ species_26 Variable:/_3:species_26 -1 ]
			[ species_28 Variable:/_3:species_28 -1 ]
			[ species_29 Variable:/_3:species_29 1  ]
			[ _3         Variable:/_3:SIZE       0  ];
	}
	
	Process ExpressionFluxProcess( reaction_58 )
	{
		Name	Smad_inhibComp2Ski;
		k1	1.6;
		k2	1.6;
		Expression	"k1 * _9.NumberConc * pow(species_22.NumberConc, 2) - k2 * species_11.NumberConc";
		VariableReferenceList
			[ _9         Variable:/_3:_9         -1 ]
			[ species_22 Variable:/_3:species_22 -2 ]
			[ species_11 Variable:/_1:species_11 1  ];
	}
	
	Process ExpressionFluxProcess( reaction_59 )
	{
		Name	"Smad2-Ski-gene";
		k1	0.2;
		k2	0.2;
		Expression	"k1 * species_11.NumberConc * species_28.NumberConc - k2 * species_29.NumberConc";
		VariableReferenceList
			[ species_11 Variable:/_1:species_11 -1 ]
			[ species_28 Variable:/_3:species_28 -1 ]
			[ species_29 Variable:/_3:species_29 1  ];
	}
	
	Process ExpressionFluxProcess( reaction_60 )
	{
		Name	"Smad4-freePromot";
		k1	0.1;
		k2	0.1;
		Expression	"_3.Value * (k1 * species_23.NumberConc * species_28.NumberConc - k2 * species_29.NumberConc)";
		VariableReferenceList
			[ species_23 Variable:/_3:species_23 -1 ]
			[ species_28 Variable:/_3:species_28 -1 ]
			[ species_29 Variable:/_3:species_29 1  ]
			[ _3         Variable:/_3:SIZE       0  ];
	}
	
	Process ExpressionFluxProcess( reaction_61 )
	{
		Name	"Smad2-Ski_cyt";
		k1	0.1;
		k2	0.1;
		Expression	"_1.Value * (k1 * _99.NumberConc * species_7.NumberConc - k2 * species_12.NumberConc)";
		VariableReferenceList
			[ _99        Variable:/_1:_99        -1 ]
			[ species_7  Variable:/_1:species_7  -1 ]
			[ species_12 Variable:/_1:species_12 1  ]
			[ _1         Variable:/_1:SIZE       0  ];
	}
	
	Process ExpressionFluxProcess( reaction_62 )
	{
		Name	"Smad2-Snon";
		k1	1.0;
		k2	1.0;
		Expression	"k1 * pow(_19.NumberConc, 3) * pow(_11.NumberConc, 3) - k2 * species_13.NumberConc";
		VariableReferenceList
			[ _19        Variable:/_3:_19        -3 ]
			[ _11        Variable:/_3:_11        -3 ]
			[ species_13 Variable:/_1:species_13 1  ];
	}
	
	Process ExpressionFluxProcess( reaction_63 )
	{
		Name	"Smad3-Snon";
		k1	1.0;
		k2	1.0;
		Expression	"k1 * pow(species_20.NumberConc, 3) * pow(_11.NumberConc, 3) - k2 * species_14.NumberConc";
		VariableReferenceList
			[ species_20 Variable:/_3:species_20 -3 ]
			[ _11        Variable:/_3:_11        -3 ]
			[ species_14 Variable:/_1:species_14 1  ];
	}
	
	Process ExpressionFluxProcess( reaction_64 )
	{
		Name	"Smad2-comp-degrad";
		k1	0.005;
		Expression	"_3.Value * k1 * _9.NumberConc";
		VariableReferenceList
			[ _9 Variable:/_3:_9   -1 ]
			[ _3 Variable:/_3:SIZE 0  ];
	}
	
	Process ExpressionFluxProcess( reaction_65 )
	{
		Name	"Samd3-comp-degrad";
		k1	0.005;
		Expression	"_3.Value * k1 * species_18.NumberConc";
		VariableReferenceList
			[ species_18 Variable:/_3:species_18 -1 ]
			[ _3         Variable:/_3:SIZE       0  ];
	}
	
	Process ExpressionFluxProcess( reaction_66 )
	{
		Name	fluxArkadia;
		v	2e-05;
		Expression	"_1.Value * v";
		VariableReferenceList
			[ species_15 Variable:/_1:species_15 1 ]
			[ _1         Variable:/_1:SIZE       0 ];
	}
	
	Process ExpressionFluxProcess( reaction_67 )
	{
		Name	Arkadia_deg;
		k1	0.1;
		Expression	"_1.Value * k1 * species_15.NumberConc";
		VariableReferenceList
			[ species_15 Variable:/_1:species_15 -1 ]
			[ _1         Variable:/_1:SIZE       0  ];
	}
	
	Process ExpressionFluxProcess( reaction_68 )
	{
		Name	"SnoN-deg2";
		k1	0.1;
		Expression	"k1 * species_13.NumberConc * pow(species_31.NumberConc, 3)";
		VariableReferenceList
			[ species_13 Variable:/_1:species_13 -1 ]
			[ species_31 Variable:/_3:species_31 -3 ]
			[ _19        Variable:/_3:_19        3  ];
	}
	
	Process ExpressionFluxProcess( reaction_69 )
	{
		Name	"SnoN-deg3";
		k1	0.1;
		Expression	"k1 * species_14.NumberConc * pow(species_31.NumberConc, 3)";
		VariableReferenceList
			[ species_14 Variable:/_1:species_14 -1 ]
			[ species_31 Variable:/_3:species_31 -3 ]
			[ species_20 Variable:/_3:species_20 1  ];
	}
	
	Process ExpressionFluxProcess( reaction_70 )
	{
		Name	transArkadia;
		k1	0.1;
		k2	0.1;
		Expression	"k1 * species_15.NumberConc - k2 * species_31.NumberConc";
		VariableReferenceList
			[ species_15 Variable:/_1:species_15 -1 ]
			[ species_31 Variable:/_3:species_31 1  ];
	}
	
	
}

System System( /_1 )
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
	
	Variable Variable( _75 )
	{
		Name	TGF_RII;
		NumberConc	0.0;
		Fixed	0;
	}
	
	Variable Variable( _79 )
	{
		Name	TGFbeta_TGF_RII;
		NumberConc	0.0;
		Fixed	0;
	}
	
	Variable Variable( _84 )
	{
		Name	TGF_RI;
		NumberConc	0.0;
		Fixed	0;
	}
	
	Variable Variable( _96 )
	{
		Name	Rec_active;
		NumberConc	0.0;
		Fixed	0;
	}
	
	Variable Variable( _99 )
	{
		Name	Smad2_c;
		NumberConc	0.0;
		Fixed	0;
	}
	
	Variable Variable( _101 )
	{
		Name	SARA;
		NumberConc	0.0;
		Fixed	0;
	}
	
	Variable Variable( _105 )
	{
		Name	Smad2_SARA;
		NumberConc	0.0;
		Fixed	0;
	}
	
	Variable Variable( _129 )
	{
		Name	pSmad2_c;
		NumberConc	0.0;
		Fixed	0;
	}
	
	Variable Variable( _147 )
	{
		Name	Smad4_c;
		NumberConc	0.0;
		Fixed	0;
	}
	
	Variable Variable( _153 )
	{
		Name	pSmad2_Smad4_c;
		NumberConc	0.0;
		Fixed	0;
	}
	
	Variable Variable( _174 )
	{
		Name	Smad7_c;
		NumberConc	0.0;
		Fixed	0;
	}
	
	Variable Variable( _181 )
	{
		Name	Smad7_Smurf2_c;
		NumberConc	0.0;
		Fixed	0;
	}
	
	Variable Variable( _198 )
	{
		Name	Rec_Smad7;
		NumberConc	0.0;
		Fixed	0;
	}
	
	Variable Variable( species_1 )
	{
		Name	Smurf2_c;
		NumberConc	0.0;
		Fixed	0;
	}
	
	Variable Variable( species_2 )
	{
		Name	SnoN_c;
		NumberConc	0.0;
		Fixed	0;
	}
	
	Variable Variable( species_3 )
	{
		Name	Smad3_c;
		NumberConc	0.0;
		Fixed	0;
	}
	
	Variable Variable( species_4 )
	{
		Name	pSmad3_c;
		NumberConc	0.0;
		Fixed	0;
	}
	
	Variable Variable( species_5 )
	{
		Name	Smad3_SARA;
		NumberConc	0.0;
		Fixed	0;
	}
	
	Variable Variable( species_6 )
	{
		Name	pSmad3_Smad4_c;
		NumberConc	0.0;
		Fixed	0;
	}
	
	Variable Variable( species_7 )
	{
		Name	Ski_c;
		NumberConc	0.0;
		Fixed	0;
	}
	
	Variable Variable( species_8 )
	{
		Name	Smad3_Ski_c;
		NumberConc	0.0;
		Fixed	0;
	}
	
	Variable Variable( species_9 )
	{
		Name	Smurf1_c;
		NumberConc	0.0;
		Fixed	0;
	}
	
	Variable Variable( species_10 )
	{
		Name	Smad7_Smurf1_c;
		NumberConc	0.0;
		Fixed	0;
	}
	
	Variable Variable( species_11 )
	{
		Name	pSmad2_Smad4_Ski_n;
		NumberConc	0.0;
		Fixed	0;
	}
	
	Variable Variable( species_12 )
	{
		Name	Smad2_Ski_c;
		NumberConc	0.0;
		Fixed	0;
	}
	
	Variable Variable( species_13 )
	{
		Name	pSmad2_SnoN_n;
		NumberConc	0.0;
		Fixed	0;
	}
	
	Variable Variable( species_14 )
	{
		Name	pSmad3_SnoN_n;
		NumberConc	0.0;
		Fixed	0;
	}
	
	Variable Variable( species_15 )
	{
		Name	Arkadia_c;
		NumberConc	0.0;
		Fixed	0;
	}
	
	
}

System System( /_3 )
{
	StepperID	Default;
	Name	nucleus;

	Variable Variable( Dimensions )
	{
		Value	3;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Fixed	1;
	}
	
	Variable Variable( _5 )
	{
		Name	Smad4_n;
		NumberConc	0.0;
		Fixed	0;
	}
	
	Variable Variable( _9 )
	{
		Name	pSmad2_Smad4_n;
		NumberConc	0.0;
		Fixed	0;
	}
	
	Variable Variable( _11 )
	{
		Name	SnoN_n;
		NumberConc	0.0;
		Fixed	0;
	}
	
	Variable Variable( _13 )
	{
		Name	pSmad2_Smad4_SnoN_n;
		NumberConc	0.0;
		Fixed	0;
	}
	
	Variable Variable( _15 )
	{
		Name	Smurf2_n;
		NumberConc	0.0;
		Fixed	0;
	}
	
	Variable Variable( _19 )
	{
		Name	pSmad2_n;
		NumberConc	0.0;
		Fixed	0;
	}
	
	Variable Variable( _21 )
	{
		Name	Smad2_n;
		NumberConc	0.0;
		Fixed	0;
	}
	
	Variable Variable( _25 )
	{
		Name	Smad7_n;
		NumberConc	0.0;
		Fixed	0;
	}
	
	Variable Variable( _27 )
	{
		Name	Smad7_Smurf2_n;
		NumberConc	0.0;
		Fixed	0;
	}
	
	Variable Variable( species_16 )
	{
		Name	Smad4_SnoN_n;
		NumberConc	0.0;
		Fixed	0;
	}
	
	Variable Variable( species_17 )
	{
		Name	Smad3_n;
		NumberConc	0.0;
		Fixed	0;
	}
	
	Variable Variable( species_18 )
	{
		Name	pSmad3_Smad4_n;
		NumberConc	0.0;
		Fixed	0;
	}
	
	Variable Variable( species_19 )
	{
		Name	Smad4_Smad2_n;
		NumberConc	0.0;
		Fixed	0;
	}
	
	Variable Variable( species_20 )
	{
		Name	pSmad3_n;
		NumberConc	0.0;
		Fixed	0;
	}
	
	Variable Variable( species_21 )
	{
		Name	pSmad3_Smad4_SnoN_n;
		NumberConc	0.0;
		Fixed	0;
	}
	
	Variable Variable( species_22 )
	{
		Name	Ski_n;
		NumberConc	0.0;
		Fixed	0;
	}
	
	Variable Variable( species_23 )
	{
		Name	Smad4_Ski_n;
		NumberConc	0.0;
		Fixed	0;
	}
	
	Variable Variable( species_24 )
	{
		Name	Smurf1_n;
		NumberConc	0.0;
		Fixed	0;
	}
	
	Variable Variable( species_25 )
	{
		Name	Smad7_Smurf1_n;
		NumberConc	0.0;
		Fixed	0;
	}
	
	Variable Variable( species_26 )
	{
		Name	pSmad3_Smad4_Ski_n;
		NumberConc	0.0;
		Fixed	0;
	}
	
	Variable Variable( species_27 )
	{
		Name	Smad4_Smad3_n;
		NumberConc	0.0;
		Fixed	0;
	}
	
	Variable Variable( species_28 )
	{
		Name	freePromoters;
		NumberConc	0.0999999951844;
		Fixed	0;
	}
	
	Variable Variable( species_29 )
	{
		Name	inactivePromoters;
		NumberConc	0.0;
		Fixed	0;
	}
	
	Variable Variable( species_30 )
	{
		Name	geneProduct;
		NumberConc	0.0;
		Fixed	0;
	}
	
	Variable Variable( species_31 )
	{
		Name	Arkadia_n;
		NumberConc	0.0;
		Fixed	0;
	}
	
	
}

System System( /SBMLParameter )
{
	StepperID	Default;
	Name	"Global Parameter";

	Variable Variable( parameter_1 )
	{
		Name	TGFbeta;
		Value	0.01;
		Fixed	1;
	}
	
	Variable Variable( parameter_2 )
	{
		Name	allSnoN;
		Value	0.0;
	}
	
	Variable Variable( parameter_3 )
	{
		Name	allSmad7;
		Value	0.0;
	}
	
	Variable Variable( parameter_4 )
	{
		Name	allSmurf2;
		Value	0.0;
	}
	
	Variable Variable( parameter_5 )
	{
		Name	allSmad2;
		Value	0.0;
	}
	
	Variable Variable( parameter_6 )
	{
		Name	allSmad4;
		Value	0.0;
	}
	
	Variable Variable( parameter_7 )
	{
		Name	allPSmad3;
		Value	0.0;
	}
	
	Variable Variable( parameter_8 )
	{
		Name	allSmad3;
		Value	0.0;
	}
	
	Variable Variable( parameter_9 )
	{
		Name	allSmad4cyt;
		Value	0.0;
	}
	
	Variable Variable( parameter_10 )
	{
		Name	allSmad4nuc;
		Value	0.0;
	}
	
	
}

System System( /SBMLRule )
{
	Name	"System for SBML Rule";
	StepperID	Default;

	Process ExpressionAssignmentProcess( Assignment_parameter_3 )
	{
		StepperID	Default;
		Name	"Assignment rule for 'parameter_3'";
		Expression	"_174.NumberConc + _181.NumberConc + _198.NumberConc + _25.NumberConc + _27.NumberConc";
		VariableReferenceList
			[ parameter_3 Variable:/SBMLParameter:parameter_3 1 ]
			[ _174        Variable:/_1:_174                   0 ]
			[ _181        Variable:/_1:_181                   0 ]
			[ _198        Variable:/_1:_198                   0 ]
			[ _25         Variable:/_3:_25                    0 ]
			[ _27         Variable:/_3:_27                    0 ];
	}
	
	Process ExpressionAssignmentProcess( Assignment_parameter_2 )
	{
		StepperID	Default;
		Name	"Assignment rule for 'parameter_2'";
		Expression	"species_2.NumberConc + _11.NumberConc + species_16.NumberConc + species_16.NumberConc";
		VariableReferenceList
			[ parameter_2 Variable:/SBMLParameter:parameter_2 1 ]
			[ species_2   Variable:/_1:species_2              0 ]
			[ _11         Variable:/_3:_11                    0 ]
			[ species_16  Variable:/_3:species_16             0 ];
	}
	
	Process ExpressionAssignmentProcess( Assignment_parameter_4 )
	{
		StepperID	Default;
		Name	"Assignment rule for 'parameter_4'";
		Expression	"_181.NumberConc + species_1.NumberConc + _15.NumberConc + _27.NumberConc";
		VariableReferenceList
			[ parameter_4 Variable:/SBMLParameter:parameter_4 1 ]
			[ _181        Variable:/_1:_181                   0 ]
			[ species_1   Variable:/_1:species_1              0 ]
			[ _15         Variable:/_3:_15                    0 ]
			[ _27         Variable:/_3:_27                    0 ];
	}
	
	Process ExpressionAssignmentProcess( Assignment_parameter_5 )
	{
		StepperID	Default;
		Name	"Assignment rule for 'parameter_5'";
		Expression	"_99.NumberConc + _105.NumberConc + _129.NumberConc + _153.NumberConc + _9.NumberConc + _13.NumberConc + _19.NumberConc + _21.NumberConc + species_19.NumberConc";
		VariableReferenceList
			[ parameter_5 Variable:/SBMLParameter:parameter_5 1 ]
			[ _99         Variable:/_1:_99                    0 ]
			[ _105        Variable:/_1:_105                   0 ]
			[ _129        Variable:/_1:_129                   0 ]
			[ _153        Variable:/_1:_153                   0 ]
			[ _9          Variable:/_3:_9                     0 ]
			[ _13         Variable:/_3:_13                    0 ]
			[ _19         Variable:/_3:_19                    0 ]
			[ _21         Variable:/_3:_21                    0 ]
			[ species_19  Variable:/_3:species_19             0 ];
	}
	
	Process ExpressionAssignmentProcess( Assignment_parameter_6 )
	{
		StepperID	Default;
		Name	"Assignment rule for 'parameter_6'";
		Expression	"_147.NumberConc + _153.NumberConc + species_6.NumberConc + _5.NumberConc + _9.NumberConc + species_18.NumberConc + _13.NumberConc + species_16.NumberConc + species_19.NumberConc + species_21.NumberConc + species_27.NumberConc + species_26.NumberConc + species_23.NumberConc";
		VariableReferenceList
			[ parameter_6 Variable:/SBMLParameter:parameter_6 1 ]
			[ _147        Variable:/_1:_147                   0 ]
			[ _153        Variable:/_1:_153                   0 ]
			[ species_6   Variable:/_1:species_6              0 ]
			[ _5          Variable:/_3:_5                     0 ]
			[ _9          Variable:/_3:_9                     0 ]
			[ species_18  Variable:/_3:species_18             0 ]
			[ _13         Variable:/_3:_13                    0 ]
			[ species_16  Variable:/_3:species_16             0 ]
			[ species_19  Variable:/_3:species_19             0 ]
			[ species_21  Variable:/_3:species_21             0 ]
			[ species_27  Variable:/_3:species_27             0 ]
			[ species_26  Variable:/_3:species_26             0 ]
			[ species_23  Variable:/_3:species_23             0 ];
	}
	
	Process ExpressionAssignmentProcess( Assignment_parameter_7 )
	{
		StepperID	Default;
		Name	"Assignment rule for 'parameter_7'";
		Expression	"species_4.NumberConc + species_6.NumberConc + species_18.NumberConc + species_20.NumberConc + species_21.NumberConc + species_26.NumberConc";
		VariableReferenceList
			[ parameter_7 Variable:/SBMLParameter:parameter_7 1 ]
			[ species_4   Variable:/_1:species_4              0 ]
			[ species_6   Variable:/_1:species_6              0 ]
			[ species_18  Variable:/_3:species_18             0 ]
			[ species_20  Variable:/_3:species_20             0 ]
			[ species_21  Variable:/_3:species_21             0 ]
			[ species_26  Variable:/_3:species_26             0 ];
	}
	
	Process ExpressionAssignmentProcess( Assignment_parameter_8 )
	{
		StepperID	Default;
		Name	"Assignment rule for 'parameter_8'";
		Expression	"species_3.NumberConc + species_4.NumberConc + species_5.NumberConc + species_6.NumberConc + species_8.NumberConc + species_17.NumberConc + species_18.NumberConc + species_20.NumberConc + species_21.NumberConc + species_26.NumberConc + species_27.NumberConc";
		VariableReferenceList
			[ parameter_8 Variable:/SBMLParameter:parameter_8 1 ]
			[ species_3   Variable:/_1:species_3              0 ]
			[ species_4   Variable:/_1:species_4              0 ]
			[ species_5   Variable:/_1:species_5              0 ]
			[ species_6   Variable:/_1:species_6              0 ]
			[ species_8   Variable:/_1:species_8              0 ]
			[ species_17  Variable:/_3:species_17             0 ]
			[ species_18  Variable:/_3:species_18             0 ]
			[ species_20  Variable:/_3:species_20             0 ]
			[ species_21  Variable:/_3:species_21             0 ]
			[ species_26  Variable:/_3:species_26             0 ]
			[ species_27  Variable:/_3:species_27             0 ];
	}
	
	Process ExpressionAssignmentProcess( Assignment_parameter_9 )
	{
		StepperID	Default;
		Name	"Assignment rule for 'parameter_9'";
		Expression	"_147.NumberConc + _153.NumberConc + species_6.NumberConc";
		VariableReferenceList
			[ parameter_9 Variable:/SBMLParameter:parameter_9 1 ]
			[ _147        Variable:/_1:_147                   0 ]
			[ _153        Variable:/_1:_153                   0 ]
			[ species_6   Variable:/_1:species_6              0 ];
	}
	
	Process ExpressionAssignmentProcess( Assignment_parameter_10 )
	{
		StepperID	Default;
		Name	"Assignment rule for 'parameter_10'";
		Expression	"species_11.NumberConc + _5.NumberConc + _9.NumberConc + _13.NumberConc + species_18.NumberConc + species_16.NumberConc + species_18.NumberConc + species_19.NumberConc + species_21.NumberConc + species_23.NumberConc + species_26.NumberConc + species_26.NumberConc + species_27.NumberConc";
		VariableReferenceList
			[ parameter_10 Variable:/SBMLParameter:parameter_10 1 ]
			[ species_11   Variable:/_1:species_11              0 ]
			[ _5           Variable:/_3:_5                      0 ]
			[ _9           Variable:/_3:_9                      0 ]
			[ _13          Variable:/_3:_13                     0 ]
			[ species_18   Variable:/_3:species_18              0 ]
			[ species_16   Variable:/_3:species_16              0 ]
			[ species_19   Variable:/_3:species_19              0 ]
			[ species_21   Variable:/_3:species_21              0 ]
			[ species_23   Variable:/_3:species_23              0 ]
			[ species_26   Variable:/_3:species_26              0 ]
			[ species_27   Variable:/_3:species_27              0 ];
	}
	
	
}

