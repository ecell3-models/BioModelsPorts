
# created by eml2em program
# from file: ../BIOMD0000000410/BIOMD0000000410.eml, date: Mon Dec 16 23:02:43 2013
#

Stepper ODEStepper( DE )
{
	# no property
}

System System( / )
{
	StepperID	DE;
	Name	Default;

	Process ExpressionFluxProcess( _29 )
	{
		Name	Smad_dissoc3;
		k1	0.0492;
		Expression	"_3.Value * k1 * (S0.Value / _3.Value)";
		VariableReferenceList	[ S0 Variable:/_3:species_27 -1 ] [ P0 Variable:/_3:_5 1 ] [ P1 Variable:/_3:species_17 2 ] [ _3 Variable:/_3:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( _31 )
	{
		Name	Smad2_dephosphNuc;
		Km	40.0;
		V	2.34;
		Expression	"_3.Value * function_1(_9, Km, V)";
		VariableReferenceList	[ S0 Variable:/_3:_9 -1 ] [ P0 Variable:/_3:species_19 1 ] [ _3 Variable:/_3:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( _33 )
	{
		Name	Smad_inhibComp2SnoN;
		k1	1.6;
		k2	1.6;
		Expression	"_3.Value * (k1 * (S0.Value / _3.Value) * pow(S1.Value / _3.Value, 2) - k2 * (P0.Value / _3.Value))";
		VariableReferenceList	[ S0 Variable:/_3:_9 -1 ] [ S1 Variable:/_3:_11 -2 ] [ P0 Variable:/_3:_13 1 ] [ _3 Variable:/_3:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( _35 )
	{
		Name	SnoN_degrad2;
		k1	0.232;
		Expression	"k1 * pow(S0.Value / _3.Value, 3) * (S1.Value / _3.Value)";
		VariableReferenceList	[ S0 Variable:/_3:_15 -3 ] [ S1 Variable:/_1:species_13 -1 ] [ P0 Variable:/_3:_19 3 ] [ _3 Variable:/_3:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( _37 )
	{
		Name	Smad_compNuc2;
		k1	255.068;
		Expression	"_3.Value * k1 * (S0.Value / _3.Value) * pow(S1.Value / _3.Value, 2)";
		VariableReferenceList	[ S0 Variable:/_3:_5 -1 ] [ S1 Variable:/_3:_19 -2 ] [ P0 Variable:/_3:_9 1 ] [ _3 Variable:/_3:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( _39 )
	{
		Name	Smad2_dephosphNuc2;
		Km	0.53;
		V	3.51;
		Expression	"_3.Value * function_1(_19, Km, V)";
		VariableReferenceList	[ S0 Variable:/_3:_19 -1 ] [ P0 Variable:/_3:_21 1 ] [ _3 Variable:/_3:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( _41 )
	{
		Name	Smad2_degrad;
		k1	0.2;
		Expression	"_3.Value * k1 * (S0.Value / _3.Value) * (S1.Value / _3.Value)";
		VariableReferenceList	[ S0 Variable:/_3:_21 -1 ] [ S1 Variable:/_3:_15 -1 ] [ _3 Variable:/_3:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( _43 )
	{
		Name	"Smad7-Smurf2";
		k1	2.9;
		k2	0.2;
		Expression	"_3.Value * (k1 * (S0.Value / _3.Value) * (S1.Value / _3.Value) - k2 * (P0.Value / _3.Value))";
		VariableReferenceList	[ S0 Variable:/_3:_15 -1 ] [ S1 Variable:/_3:_25 -1 ] [ P0 Variable:/_3:_27 1 ] [ _3 Variable:/_3:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( _77 )
	{
		Name	Rec_comp1;
		k	9.45;
		Expression	"_1.Value * function_2(parameter_1, k, _75, _75)";
		VariableReferenceList	[ S0 Variable:/_1:_75 -2 ] [ P0 Variable:/_1:_79 1 ] [ C0 Variable:/_1:_75 0 ] [ _1 Variable:/_1:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( _86 )
	{
		Name	Rec_comp2;
		k1	0.03333;
		k2	0.03333;
		Expression	"_1.Value * (k1 * (S0.Value / _1.Value) * pow(S1.Value / _1.Value, 2) - k2 * (P0.Value / _1.Value))";
		VariableReferenceList	[ S0 Variable:/_1:_79 -1 ] [ S1 Variable:/_1:_84 -2 ] [ P0 Variable:/_1:_96 1 ] [ _1 Variable:/_1:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( _103 )
	{
		Name	"SARA-comp2";
		k1	1.0;
		k2	0.1;
		Expression	"_1.Value * (k1 * (S0.Value / _1.Value) * (S1.Value / _1.Value) - k2 * (P0.Value / _1.Value))";
		VariableReferenceList	[ S0 Variable:/_1:_101 -1 ] [ S1 Variable:/_1:_99 -1 ] [ P0 Variable:/_1:_105 1 ] [ _1 Variable:/_1:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( _125 )
	{
		Name	Smad2_phosph;
		k	1000.0;
		km	0.0318;
		Expression	"_1.Value * function_3(k, _96, _99, km)";
		VariableReferenceList	[ S0 Variable:/_1:_99 -1 ] [ P0 Variable:/_1:_129 1 ] [ C0 Variable:/_1:_96 0 ] [ _1 Variable:/_1:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( _132 )
	{
		Name	Smad2_phosphSARA;
		k	3.51;
		km	0.53;
		Expression	"_1.Value * function_3(k, _96, _105, km)";
		VariableReferenceList	[ S0 Variable:/_1:_105 -1 ] [ P0 Variable:/_1:_129 1 ] [ P1 Variable:/_1:_101 1 ] [ C0 Variable:/_1:_96 0 ] [ _1 Variable:/_1:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( _139 )
	{
		Name	"Smad2-P_transp";
		k1	16.6;
		Expression	"k1 * (S0.Value / _1.Value)";
		VariableReferenceList	[ S0 Variable:/_1:_129 -1 ] [ P0 Variable:/_3:_19 1 ] [ _1 Variable:/_1:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( _149 )
	{
		Name	Smad_compCyt2;
		k1	1000.0;
		Expression	"_1.Value * k1 * (S0.Value / _1.Value) * pow(S1.Value / _1.Value, 2)";
		VariableReferenceList	[ S0 Variable:/_1:_147 -1 ] [ S1 Variable:/_1:_129 -2 ] [ P0 Variable:/_1:_153 1 ] [ _1 Variable:/_1:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( _156 )
	{
		Name	Smad4_transp;
		k1	0.156;
		k2	0.156;
		Expression	"k1 * (S0.Value / _1.Value) - k2 * (P0.Value / _1.Value)";
		VariableReferenceList	[ S0 Variable:/_1:_147 -1 ] [ P0 Variable:/_3:_5 1 ] [ _1 Variable:/_1:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( _164 )
	{
		Name	Smad_compTransp2;
		k1	0.16;
		Expression	"k1 * (S0.Value / _1.Value)";
		VariableReferenceList	[ S0 Variable:/_1:_153 -1 ] [ P0 Variable:/_3:_9 1 ] [ _1 Variable:/_1:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( _172 )
	{
		Name	Smad7_transp;
		k1	0.1;
		k2	0.01;
		Expression	"k1 * (S0.Value / _3.Value) - k2 * (P0.Value / _3.Value)";
		VariableReferenceList	[ S0 Variable:/_3:_25 -1 ] [ P0 Variable:/_1:_174 1 ] [ _3 Variable:/_3:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( _178 )
	{
		Name	"Smad7-Smurf2_transp";
		k1	1.0;
		k2	0.01;
		Expression	"k1 * (S0.Value / _3.Value) - k2 * (P0.Value / _3.Value)";
		VariableReferenceList	[ S0 Variable:/_3:_27 -1 ] [ P0 Variable:/_1:_181 1 ] [ _3 Variable:/_3:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( _192 )
	{
		Name	Rec_degrad1;
		k1	1900.0;
		Expression	"_1.Value * k1 * (S0.Value / _1.Value) * (S1.Value / _1.Value)";
		VariableReferenceList	[ S0 Variable:/_1:_181 -1 ] [ S1 Variable:/_1:_96 -1 ] [ _1 Variable:/_1:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( _194 )
	{
		Name	Rec_inhib;
		k1	8.69;
		k2	0.01;
		Expression	"_1.Value * (k1 * (S0.Value / _1.Value) * (S1.Value / _1.Value) - k2 * (P0.Value / _1.Value))";
		VariableReferenceList	[ S0 Variable:/_1:_174 -1 ] [ S1 Variable:/_1:_96 -1 ] [ P0 Variable:/_1:_198 1 ] [ _1 Variable:/_1:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( reaction_1 )
	{
		Name	fluxRecII;
		v	0.00146;
		Expression	"_1.Value * function_4(v)";
		VariableReferenceList	[ P0 Variable:/_1:_75 1 ] [ _1 Variable:/_1:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( reaction_2 )
	{
		Name	fluxSara;
		k	0.0001;
		k1	0.031;
		Expression	"_1.Value * function_5(k, k1, species_30)";
		VariableReferenceList	[ P0 Variable:/_1:_101 1 ] [ C0 Variable:/_3:species_30 0 ] [ _1 Variable:/_1:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( reaction_3 )
	{
		Name	fluxSmad7;
		k	0.0001;
		k1	0.1;
		Expression	"_1.Value * function_6(k, k1, species_30, species_16, species_23)";
		VariableReferenceList	[ P0 Variable:/_1:_174 1 ] [ C0 Variable:/_3:species_30 0 ] [ C1 Variable:/_3:species_16 0 ] [ C2 Variable:/_3:species_23 0 ] [ _1 Variable:/_1:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( reaction_4 )
	{
		Name	fluxSmurf2;
		k	0.000228;
		k1	0.0285;
		Expression	"_1.Value * function_5(k, k1, species_30)";
		VariableReferenceList	[ P0 Variable:/_1:species_1 1 ] [ C0 Variable:/_3:species_30 0 ] [ _1 Variable:/_1:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( reaction_5 )
	{
		Name	fluxSnoN;
		k	2e-05;
		k1	0.00055;
		Expression	"_1.Value * function_5(k, k1, species_30)";
		VariableReferenceList	[ P0 Variable:/_1:species_2 1 ] [ C0 Variable:/_3:species_30 0 ] [ _1 Variable:/_1:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( reaction_6 )
	{
		Name	fluxRecI;
		v	0.0125;
		Expression	"_1.Value * function_4(v)";
		VariableReferenceList	[ P0 Variable:/_1:_84 1 ] [ _1 Variable:/_1:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( reaction_7 )
	{
		Name	"Smad4-SnoN";
		k1	1.0;
		k2	0.05288;
		Expression	"_3.Value * (k1 * (S0.Value / _3.Value) * (S1.Value / _3.Value) - k2 * (P0.Value / _3.Value))";
		VariableReferenceList	[ S0 Variable:/_3:_5 -1 ] [ S1 Variable:/_3:_11 -1 ] [ P0 Variable:/_3:species_16 1 ] [ _3 Variable:/_3:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( reaction_8 )
	{
		Name	Smad2_transp;
		k1	0.156;
		k2	0.336;
		Expression	"k1 * (S0.Value / _1.Value) - k2 * (P0.Value / _1.Value)";
		VariableReferenceList	[ S0 Variable:/_1:_99 -1 ] [ P0 Variable:/_3:_21 1 ] [ _1 Variable:/_1:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( reaction_9 )
	{
		Name	Rec_degrad;
		k1	0.027778;
		Expression	"_1.Value * k1 * (S0.Value / _1.Value)";
		VariableReferenceList	[ S0 Variable:/_1:_96 -1 ] [ _1 Variable:/_1:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( reaction_10 )
	{
		Name	RecI_degrad;
		k1	0.027778;
		Expression	"_1.Value * k1 * (S0.Value / _1.Value)";
		VariableReferenceList	[ S0 Variable:/_1:_84 -1 ] [ _1 Variable:/_1:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( reaction_11 )
	{
		Name	RecII_degrad;
		k1	0.027778;
		Expression	"_1.Value * k1 * (S0.Value / _1.Value)";
		VariableReferenceList	[ S0 Variable:/_1:_75 -1 ] [ _1 Variable:/_1:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( reaction_12 )
	{
		Name	Rec_recycl;
		k1	0.03333;
		Expression	"_1.Value * k1 * (S0.Value / _1.Value)";
		VariableReferenceList	[ S0 Variable:/_1:_79 -1 ] [ P0 Variable:/_1:_75 2 ] [ _1 Variable:/_1:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( reaction_13 )
	{
		Name	fluxSmad2;
		v	0.0156;
		Expression	"_1.Value * function_4(v)";
		VariableReferenceList	[ P0 Variable:/_1:_99 1 ] [ _1 Variable:/_1:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( reaction_14 )
	{
		Name	fluxSmad4;
		v	0.01183;
		Expression	"_1.Value * function_4(v)";
		VariableReferenceList	[ P0 Variable:/_1:_147 1 ] [ _1 Variable:/_1:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( reaction_15 )
	{
		Name	Smad4_degrad;
		k1	0.1266;
		Expression	"_1.Value * k1 * (S0.Value / _1.Value)";
		VariableReferenceList	[ S0 Variable:/_1:_147 -1 ] [ _1 Variable:/_1:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( reaction_16 )
	{
		Name	SARA_degrad;
		k1	0.065;
		Expression	"_1.Value * k1 * (S0.Value / _1.Value)";
		VariableReferenceList	[ S0 Variable:/_1:_101 -1 ] [ _1 Variable:/_1:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( reaction_17 )
	{
		Name	Smad2_dephospCyt;
		Km	3.51;
		V	0.53;
		Expression	"_1.Value * function_1(_129, Km, V)";
		VariableReferenceList	[ S0 Variable:/_1:_129 -1 ] [ P0 Variable:/_1:_99 1 ] [ _1 Variable:/_1:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( reaction_18 )
	{
		Name	SnoN_degrad;
		k1	0.232;
		Expression	"_1.Value * k1 * (S0.Value / _1.Value)";
		VariableReferenceList	[ S0 Variable:/_1:species_2 -1 ] [ _1 Variable:/_1:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( reaction_19 )
	{
		Name	Smurf2_transp;
		k1	0.2333;
		k2	1.8056;
		Expression	"k1 * (S0.Value / _3.Value) - k2 * (P0.Value / _3.Value)";
		VariableReferenceList	[ S0 Variable:/_3:_15 -1 ] [ P0 Variable:/_1:species_1 1 ] [ _3 Variable:/_3:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( reaction_20 )
	{
		Name	Smad2_cyt_degrad;
		k1	0.2;
		Expression	"_1.Value * k1 * (S0.Value / _1.Value)";
		VariableReferenceList	[ S0 Variable:/_1:_99 -1 ] [ _1 Variable:/_1:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( reaction_21 )
	{
		Name	SnoN_trans;
		k1	0.1;
		k2	0.2;
		Expression	"k1 * (S0.Value / _1.Value) - k2 * (P0.Value / _1.Value)";
		VariableReferenceList	[ S0 Variable:/_1:species_2 -1 ] [ P0 Variable:/_3:_11 1 ] [ _1 Variable:/_1:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( reaction_22 )
	{
		Name	fluxSmad3;
		v	0.04528;
		Expression	"_1.Value * function_4(v)";
		VariableReferenceList	[ P0 Variable:/_1:species_3 1 ] [ _1 Variable:/_1:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( reaction_23 )
	{
		Name	Smad3_cyt_degrad;
		k1	0.2;
		Expression	"_1.Value * k1 * (S0.Value / _1.Value)";
		VariableReferenceList	[ S0 Variable:/_1:species_3 -1 ] [ _1 Variable:/_1:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( reaction_24 )
	{
		Name	Smad3_dephospCyt;
		Km	3.51;
		V	0.53;
		Expression	"_1.Value * function_1(species_4, Km, V)";
		VariableReferenceList	[ S0 Variable:/_1:species_4 -1 ] [ P0 Variable:/_1:species_3 1 ] [ _1 Variable:/_1:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( reaction_25 )
	{
		Name	Smad3_dephospNuc;
		Km	40.0;
		V	2.34;
		Expression	"_3.Value * function_1(species_18, Km, V)";
		VariableReferenceList	[ S0 Variable:/_3:species_18 -1 ] [ P0 Variable:/_3:species_27 1 ] [ _3 Variable:/_3:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( reaction_26 )
	{
		Name	Smad3_dephospNuc2;
		Km	0.53;
		V	3.51;
		Expression	"_3.Value * function_1(species_20, Km, V)";
		VariableReferenceList	[ S0 Variable:/_3:species_20 -1 ] [ P0 Variable:/_3:species_17 1 ] [ _3 Variable:/_3:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( reaction_27 )
	{
		Name	Smad3_phosph;
		k	1000.0;
		km	0.0318;
		Expression	"_1.Value * function_3(k, _96, species_3, km)";
		VariableReferenceList	[ S0 Variable:/_1:species_3 -1 ] [ P0 Variable:/_1:species_4 1 ] [ C0 Variable:/_1:_96 0 ] [ _1 Variable:/_1:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( reaction_28 )
	{
		Name	Smad3_phosphSARA;
		k	3.51;
		km	0.53;
		Expression	"_1.Value * function_3(k, _96, species_5, km)";
		VariableReferenceList	[ S0 Variable:/_1:species_5 -1 ] [ P0 Variable:/_1:species_4 1 ] [ P1 Variable:/_1:_101 1 ] [ C0 Variable:/_1:_96 0 ] [ _1 Variable:/_1:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( reaction_29 )
	{
		Name	Smad3_degrad;
		k1	0.2;
		Expression	"_3.Value * k1 * (S0.Value / _3.Value)";
		VariableReferenceList	[ S0 Variable:/_3:species_17 -1 ] [ _3 Variable:/_3:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( reaction_30 )
	{
		Name	Smad3_transp;
		k1	0.156;
		k2	0.336;
		Expression	"k1 * (S0.Value / _1.Value) - k2 * (P0.Value / _1.Value)";
		VariableReferenceList	[ S0 Variable:/_1:species_3 -1 ] [ P0 Variable:/_3:species_17 1 ] [ _1 Variable:/_1:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( reaction_31 )
	{
		Name	"SARA-comp3";
		k1	1.0;
		k2	0.1;
		Expression	"_1.Value * (k1 * (S0.Value / _1.Value) * (S1.Value / _1.Value) - k2 * (P0.Value / _1.Value))";
		VariableReferenceList	[ S0 Variable:/_1:_101 -1 ] [ S1 Variable:/_1:species_3 -1 ] [ P0 Variable:/_1:species_5 1 ] [ _1 Variable:/_1:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( reaction_32 )
	{
		Name	Smad_dissoc2;
		k1	0.0492;
		Expression	"_3.Value * k1 * (S0.Value / _3.Value)";
		VariableReferenceList	[ S0 Variable:/_3:species_19 -1 ] [ P0 Variable:/_3:_5 1 ] [ P1 Variable:/_3:_21 2 ] [ _3 Variable:/_3:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( reaction_33 )
	{
		Name	"Smad3-P-transp";
		k1	16.6;
		Expression	"k1 * (S0.Value / _1.Value)";
		VariableReferenceList	[ S0 Variable:/_1:species_4 -1 ] [ P0 Variable:/_3:species_20 1 ] [ _1 Variable:/_1:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( reaction_34 )
	{
		Name	Smad_compCyt3;
		k1	1000.0;
		Expression	"_1.Value * k1 * (S0.Value / _1.Value) * pow(S1.Value / _1.Value, 2)";
		VariableReferenceList	[ S0 Variable:/_1:_147 -1 ] [ S1 Variable:/_1:species_4 -2 ] [ P0 Variable:/_1:species_6 1 ] [ _1 Variable:/_1:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( reaction_35 )
	{
		Name	Smad_compNuc3;
		k1	255.068;
		Expression	"_3.Value * k1 * (S0.Value / _3.Value) * pow(S1.Value / _3.Value, 2)";
		VariableReferenceList	[ S0 Variable:/_3:_5 -1 ] [ S1 Variable:/_3:species_20 -2 ] [ P0 Variable:/_3:species_18 1 ] [ _3 Variable:/_3:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( reaction_36 )
	{
		Name	Smad_inhibComp3SnoN;
		k1	1.6;
		k2	1.6;
		Expression	"_3.Value * (k1 * (S0.Value / _3.Value) * pow(S1.Value / _3.Value, 2) - k2 * (P0.Value / _3.Value))";
		VariableReferenceList	[ S0 Variable:/_3:species_18 -1 ] [ S1 Variable:/_3:_11 -2 ] [ P0 Variable:/_3:species_21 1 ] [ _3 Variable:/_3:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( reaction_37 )
	{
		Name	Smad_compTransp3;
		k1	0.16;
		Expression	"k1 * (S0.Value / _1.Value)";
		VariableReferenceList	[ S0 Variable:/_1:species_6 -1 ] [ P0 Variable:/_3:species_18 1 ] [ _1 Variable:/_1:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( reaction_38 )
	{
		Name	SnoN_degrad3;
		k1	0.232;
		Expression	"k1 * (S0.Value / _1.Value)";
		VariableReferenceList	[ S0 Variable:/_1:species_14 -1 ] [ P0 Variable:/_3:species_20 1 ] [ _1 Variable:/_1:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( reaction_39 )
	{
		Name	Smad7_degrad;
		k1	0.1;
		Expression	"_1.Value * function_7(k1, _174, species_15)";
		VariableReferenceList	[ S0 Variable:/_1:_174 -1 ] [ C0 Variable:/_1:species_15 0 ] [ _1 Variable:/_1:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( reaction_40 )
	{
		Name	Ski_degrad;
		k1	0.232;
		Expression	"_1.Value * k1 * (S0.Value / _1.Value)";
		VariableReferenceList	[ S0 Variable:/_1:species_7 -1 ] [ _1 Variable:/_1:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( reaction_41 )
	{
		Name	Ski_trans;
		k1	0.1;
		k2	0.2;
		Expression	"k1 * (S0.Value / _1.Value) - k2 * (P0.Value / _1.Value)";
		VariableReferenceList	[ S0 Variable:/_1:species_7 -1 ] [ P0 Variable:/_3:species_22 1 ] [ _1 Variable:/_1:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( reaction_42 )
	{
		Name	fluxSki;
		k	2e-05;
		k1	0.00055;
		Expression	"_1.Value * function_5(k, k1, species_30)";
		VariableReferenceList	[ P0 Variable:/_1:species_7 1 ] [ C0 Variable:/_3:species_30 0 ] [ _1 Variable:/_1:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( reaction_43 )
	{
		Name	Smurf2_degrad;
		k1	0.05;
		Expression	"_1.Value * function_7(k1, species_1, _174)";
		VariableReferenceList	[ S0 Variable:/_1:species_1 -1 ] [ C0 Variable:/_1:_174 0 ] [ _1 Variable:/_1:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( reaction_44 )
	{
		Name	"Smad4-Ski";
		k1	1.0;
		k2	0.05288;
		Expression	"_3.Value * (k1 * (S0.Value / _3.Value) * (S1.Value / _3.Value) - k2 * (P0.Value / _3.Value))";
		VariableReferenceList	[ S0 Variable:/_3:_5 -1 ] [ S1 Variable:/_3:species_22 -1 ] [ P0 Variable:/_3:species_23 1 ] [ _3 Variable:/_3:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( reaction_45 )
	{
		Name	"Smad3-Ski_cyt";
		k1	0.1;
		k2	0.1;
		Expression	"_1.Value * (k1 * (S0.Value / _1.Value) * (S1.Value / _1.Value) - k2 * (P0.Value / _1.Value))";
		VariableReferenceList	[ S0 Variable:/_1:species_3 -1 ] [ S1 Variable:/_1:species_7 -1 ] [ P0 Variable:/_1:species_8 1 ] [ _1 Variable:/_1:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( reaction_46 )
	{
		Name	"Smad7-Smurf1";
		k1	2.9;
		k2	0.2;
		Expression	"_3.Value * (k1 * (S0.Value / _3.Value) * (S1.Value / _3.Value) - k2 * (P0.Value / _3.Value))";
		VariableReferenceList	[ S0 Variable:/_3:species_24 -1 ] [ S1 Variable:/_3:_25 -1 ] [ P0 Variable:/_3:species_25 1 ] [ _3 Variable:/_3:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( reaction_47 )
	{
		Name	fluxSmurf1;
		k	0.0001;
		k1	0.0022;
		Expression	"_1.Value * function_5(k, k1, species_30)";
		VariableReferenceList	[ P0 Variable:/_1:species_9 1 ] [ C0 Variable:/_3:species_30 0 ] [ _1 Variable:/_1:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( reaction_48 )
	{
		Name	Smad_inhibComp3Ski;
		k1	1.6;
		k2	1.6;
		Expression	"_3.Value * (k1 * (S0.Value / _3.Value) * pow(S1.Value / _3.Value, 2) - k2 * (P0.Value / _3.Value))";
		VariableReferenceList	[ S0 Variable:/_3:species_18 -1 ] [ S1 Variable:/_3:species_22 -2 ] [ P0 Variable:/_3:species_26 1 ] [ _3 Variable:/_3:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( reaction_49 )
	{
		Name	Rec_degrad2;
		k1	1900.0;
		Expression	"_1.Value * k1 * (S0.Value / _1.Value) * (S1.Value / _1.Value)";
		VariableReferenceList	[ S0 Variable:/_1:species_10 -1 ] [ S1 Variable:/_1:_96 -1 ] [ _1 Variable:/_1:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( reaction_50 )
	{
		Name	"Smad7-Smurf1_transp";
		k1	1.0;
		k2	0.01;
		Expression	"k1 * (S0.Value / _3.Value) - k2 * (P0.Value / _3.Value)";
		VariableReferenceList	[ S0 Variable:/_3:species_25 -1 ] [ P0 Variable:/_1:species_10 1 ] [ _3 Variable:/_3:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( reaction_51 )
	{
		Name	Smurf1_degrad;
		k1	0.5;
		Expression	"_1.Value * function_7(k1, species_9, _174)";
		VariableReferenceList	[ S0 Variable:/_1:species_9 -1 ] [ C0 Variable:/_1:_174 0 ] [ _1 Variable:/_1:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( reaction_52 )
	{
		Name	Smurf1_transp;
		k1	0.05;
		k2	3.0;
		Expression	"k1 * (S0.Value / _3.Value) - k2 * (P0.Value / _3.Value)";
		VariableReferenceList	[ S0 Variable:/_3:species_24 -1 ] [ P0 Variable:/_1:species_9 1 ] [ _3 Variable:/_3:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( reaction_53 )
	{
		Name	"Smad3-freePromot";
		k1	0.463;
		k2	0.102;
		Expression	"_3.Value * (k1 * (S0.Value / _3.Value) * (S1.Value / _3.Value) - k2 * (P0.Value / _3.Value))";
		VariableReferenceList	[ S0 Variable:/_3:species_18 -1 ] [ S1 Variable:/_3:species_28 -1 ] [ P0 Variable:/_3:species_30 1 ] [ _3 Variable:/_3:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( reaction_54 )
	{
		Name	"Smad2-freePromot";
		k1	0.463;
		k2	0.102;
		Expression	"_3.Value * (k1 * (S0.Value / _3.Value) * (S1.Value / _3.Value) - k2 * (P0.Value / _3.Value))";
		VariableReferenceList	[ S0 Variable:/_3:_9 -1 ] [ S1 Variable:/_3:species_28 -1 ] [ P0 Variable:/_3:species_30 1 ] [ _3 Variable:/_3:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( reaction_55 )
	{
		Name	"Smad3-SnoN-freePromot";
		k1	0.2;
		k2	0.2;
		Expression	"_3.Value * (k1 * (S0.Value / _3.Value) * (S1.Value / _3.Value) - k2 * (P0.Value / _3.Value))";
		VariableReferenceList	[ S0 Variable:/_3:species_21 -1 ] [ S1 Variable:/_3:species_28 -1 ] [ P0 Variable:/_3:species_29 1 ] [ _3 Variable:/_3:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( reaction_56 )
	{
		Name	"Smad2-SnoN-gene";
		k1	0.2;
		k2	0.2;
		Expression	"_3.Value * (k1 * (S0.Value / _3.Value) * (S1.Value / _3.Value) - k2 * (P0.Value / _3.Value))";
		VariableReferenceList	[ S0 Variable:/_3:_13 -1 ] [ S1 Variable:/_3:species_28 -1 ] [ P0 Variable:/_3:species_29 1 ] [ _3 Variable:/_3:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( reaction_57 )
	{
		Name	"Smad3-Ski-freePromot";
		k1	0.2;
		k2	0.2;
		Expression	"_3.Value * (k1 * (S0.Value / _3.Value) * (S1.Value / _3.Value) - k2 * (P0.Value / _3.Value))";
		VariableReferenceList	[ S0 Variable:/_3:species_26 -1 ] [ S1 Variable:/_3:species_28 -1 ] [ P0 Variable:/_3:species_29 1 ] [ _3 Variable:/_3:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( reaction_58 )
	{
		Name	Smad_inhibComp2Ski;
		k1	1.6;
		k2	1.6;
		Expression	"k1 * (S0.Value / _3.Value) * pow(S1.Value / _3.Value, 2) - k2 * (P0.Value / _3.Value)";
		VariableReferenceList	[ S0 Variable:/_3:_9 -1 ] [ S1 Variable:/_3:species_22 -2 ] [ P0 Variable:/_1:species_11 1 ] [ _3 Variable:/_3:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( reaction_59 )
	{
		Name	"Smad2-Ski-gene";
		k1	0.2;
		k2	0.2;
		Expression	"k1 * (S0.Value / _1.Value) * (S1.Value / _1.Value) - k2 * (P0.Value / _1.Value)";
		VariableReferenceList	[ S0 Variable:/_1:species_11 -1 ] [ S1 Variable:/_3:species_28 -1 ] [ P0 Variable:/_3:species_29 1 ] [ _1 Variable:/_1:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( reaction_60 )
	{
		Name	"Smad4-freePromot";
		k1	0.1;
		k2	0.1;
		Expression	"_3.Value * (k1 * (S0.Value / _3.Value) * (S1.Value / _3.Value) - k2 * (P0.Value / _3.Value))";
		VariableReferenceList	[ S0 Variable:/_3:species_23 -1 ] [ S1 Variable:/_3:species_28 -1 ] [ P0 Variable:/_3:species_29 1 ] [ _3 Variable:/_3:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( reaction_61 )
	{
		Name	"Smad2-Ski_cyt";
		k1	0.1;
		k2	0.1;
		Expression	"_1.Value * (k1 * (S0.Value / _1.Value) * (S1.Value / _1.Value) - k2 * (P0.Value / _1.Value))";
		VariableReferenceList	[ S0 Variable:/_1:_99 -1 ] [ S1 Variable:/_1:species_7 -1 ] [ P0 Variable:/_1:species_12 1 ] [ _1 Variable:/_1:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( reaction_62 )
	{
		Name	"Smad2-Snon";
		k1	1.0;
		k2	1.0;
		Expression	"k1 * pow(S0.Value / _3.Value, 3) * pow(S1.Value / _3.Value, 3) - k2 * (P0.Value / _3.Value)";
		VariableReferenceList	[ S0 Variable:/_3:_19 -3 ] [ S1 Variable:/_3:_11 -3 ] [ P0 Variable:/_1:species_13 1 ] [ _3 Variable:/_3:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( reaction_63 )
	{
		Name	"Smad3-Snon";
		k1	1.0;
		k2	1.0;
		Expression	"k1 * pow(S0.Value / _3.Value, 3) * pow(S1.Value / _3.Value, 3) - k2 * (P0.Value / _3.Value)";
		VariableReferenceList	[ S0 Variable:/_3:species_20 -3 ] [ S1 Variable:/_3:_11 -3 ] [ P0 Variable:/_1:species_14 1 ] [ _3 Variable:/_3:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( reaction_64 )
	{
		Name	"Smad2-comp-degrad";
		k1	0.005;
		Expression	"_3.Value * k1 * (S0.Value / _3.Value)";
		VariableReferenceList	[ S0 Variable:/_3:_9 -1 ] [ _3 Variable:/_3:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( reaction_65 )
	{
		Name	"Samd3-comp-degrad";
		k1	0.005;
		Expression	"_3.Value * k1 * (S0.Value / _3.Value)";
		VariableReferenceList	[ S0 Variable:/_3:species_18 -1 ] [ _3 Variable:/_3:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( reaction_66 )
	{
		Name	fluxArkadia;
		v	2e-05;
		Expression	"_1.Value * function_4(v)";
		VariableReferenceList	[ P0 Variable:/_1:species_15 1 ] [ _1 Variable:/_1:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( reaction_67 )
	{
		Name	Arkadia_deg;
		k1	0.1;
		Expression	"_1.Value * k1 * (S0.Value / _1.Value)";
		VariableReferenceList	[ S0 Variable:/_1:species_15 -1 ] [ _1 Variable:/_1:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( reaction_68 )
	{
		Name	"SnoN-deg2";
		k1	0.1;
		Expression	"k1 * (S0.Value / _1.Value) * pow(S1.Value / _1.Value, 3)";
		VariableReferenceList	[ S0 Variable:/_1:species_13 -1 ] [ S1 Variable:/_3:species_31 -3 ] [ P0 Variable:/_3:_19 3 ] [ _1 Variable:/_1:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( reaction_69 )
	{
		Name	"SnoN-deg3";
		k1	0.1;
		Expression	"k1 * (S0.Value / _1.Value) * pow(S1.Value / _1.Value, 3)";
		VariableReferenceList	[ S0 Variable:/_1:species_14 -1 ] [ S1 Variable:/_3:species_31 -3 ] [ P0 Variable:/_3:species_20 1 ] [ _1 Variable:/_1:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( reaction_70 )
	{
		Name	transArkadia;
		k1	0.1;
		k2	0.1;
		Expression	"k1 * (S0.Value / _1.Value) - k2 * (P0.Value / _1.Value)";
		VariableReferenceList	[ S0 Variable:/_1:species_15 -1 ] [ P0 Variable:/_3:species_31 1 ] [ _1 Variable:/_1:SIZE 0 ];
	}
	
	
}

System System( /_1 )
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
	
	Variable Variable( _75 )
	{
		Name	TGF_RII;
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( _79 )
	{
		Name	TGFbeta_TGF_RII;
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( _84 )
	{
		Name	TGF_RI;
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( _96 )
	{
		Name	Rec_active;
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( _99 )
	{
		Name	Smad2_c;
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( _101 )
	{
		Name	SARA;
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( _105 )
	{
		Name	Smad2_SARA;
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( _129 )
	{
		Name	pSmad2_c;
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( _147 )
	{
		Name	Smad4_c;
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( _153 )
	{
		Name	pSmad2_Smad4_c;
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( _174 )
	{
		Name	Smad7_c;
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( _181 )
	{
		Name	Smad7_Smurf2_c;
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( _198 )
	{
		Name	Rec_Smad7;
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( species_1 )
	{
		Name	Smurf2_c;
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( species_2 )
	{
		Name	SnoN_c;
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( species_3 )
	{
		Name	Smad3_c;
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( species_4 )
	{
		Name	pSmad3_c;
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( species_5 )
	{
		Name	Smad3_SARA;
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( species_6 )
	{
		Name	pSmad3_Smad4_c;
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( species_7 )
	{
		Name	Ski_c;
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( species_8 )
	{
		Name	Smad3_Ski_c;
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( species_9 )
	{
		Name	Smurf1_c;
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( species_10 )
	{
		Name	Smad7_Smurf1_c;
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( species_11 )
	{
		Name	pSmad2_Smad4_Ski_n;
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( species_12 )
	{
		Name	Smad2_Ski_c;
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( species_13 )
	{
		Name	pSmad2_SnoN_n;
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( species_14 )
	{
		Name	pSmad3_SnoN_n;
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( species_15 )
	{
		Name	Arkadia_c;
		Value	0.0;
		Fixed	0;
	}
	
	
}

System System( /_3 )
{
	StepperID	DE;
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
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( _9 )
	{
		Name	pSmad2_Smad4_n;
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( _11 )
	{
		Name	SnoN_n;
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( _13 )
	{
		Name	pSmad2_Smad4_SnoN_n;
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( _15 )
	{
		Name	Smurf2_n;
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( _19 )
	{
		Name	pSmad2_n;
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( _21 )
	{
		Name	Smad2_n;
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( _25 )
	{
		Name	Smad7_n;
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( _27 )
	{
		Name	Smad7_Smurf2_n;
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( species_16 )
	{
		Name	Smad4_SnoN_n;
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( species_17 )
	{
		Name	Smad3_n;
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( species_18 )
	{
		Name	pSmad3_Smad4_n;
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( species_19 )
	{
		Name	Smad4_Smad2_n;
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( species_20 )
	{
		Name	pSmad3_n;
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( species_21 )
	{
		Name	pSmad3_Smad4_SnoN_n;
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( species_22 )
	{
		Name	Ski_n;
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( species_23 )
	{
		Name	Smad4_Ski_n;
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( species_24 )
	{
		Name	Smurf1_n;
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( species_25 )
	{
		Name	Smad7_Smurf1_n;
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( species_26 )
	{
		Name	pSmad3_Smad4_Ski_n;
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( species_27 )
	{
		Name	Smad4_Smad3_n;
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( species_28 )
	{
		Name	freePromoters;
		Value	0.0999999951844;
		Fixed	0;
	}
	
	Variable Variable( species_29 )
	{
		Name	inactivePromoters;
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( species_30 )
	{
		Name	geneProduct;
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( species_31 )
	{
		Name	Arkadia_n;
		Value	0.0;
		Fixed	0;
	}
	
	
}

System System( /SBMLParameter )
{
	StepperID	DE;
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
	StepperID	DE;

	Process ExpressionAssignmentProcess( Rule1 )
	{
		Expression	"V0.Value / _1.Value + V1.Value / _1.Value + V2.Value / _1.Value + V3.Value / _3.Value + V4.Value / _3.Value";
		VariableReferenceList	[ P0 Variable:/SBMLParameter:parameter_3 1 ] [ V0 Variable:/_1:_174 0 ] [ _1 Variable:/_1:SIZE 0 ] [ V1 Variable:/_1:_181 0 ] [ V2 Variable:/_1:_198 0 ] [ V3 Variable:/_3:_25 0 ] [ _3 Variable:/_3:SIZE 0 ] [ V4 Variable:/_3:_27 0 ];
	}
	
	Process ExpressionAssignmentProcess( Rule2 )
	{
		Expression	"V0.Value / _1.Value + V1.Value / _3.Value + V2.Value / _3.Value + V2.Value / _3.Value";
		VariableReferenceList	[ P0 Variable:/SBMLParameter:parameter_2 1 ] [ V0 Variable:/_1:species_2 0 ] [ _1 Variable:/_1:SIZE 0 ] [ V1 Variable:/_3:_11 0 ] [ _3 Variable:/_3:SIZE 0 ] [ V2 Variable:/_3:species_16 0 ];
	}
	
	Process ExpressionAssignmentProcess( Rule3 )
	{
		Expression	"V0.Value / _1.Value + V1.Value / _1.Value + V2.Value / _3.Value + V3.Value / _3.Value";
		VariableReferenceList	[ P0 Variable:/SBMLParameter:parameter_4 1 ] [ V0 Variable:/_1:_181 0 ] [ _1 Variable:/_1:SIZE 0 ] [ V1 Variable:/_1:species_1 0 ] [ V2 Variable:/_3:_15 0 ] [ _3 Variable:/_3:SIZE 0 ] [ V3 Variable:/_3:_27 0 ];
	}
	
	Process ExpressionAssignmentProcess( Rule4 )
	{
		Expression	"V0.Value / _1.Value + V1.Value / _1.Value + V2.Value / _1.Value + V3.Value / _1.Value + V4.Value / _3.Value + V5.Value / _3.Value + V6.Value / _3.Value + V7.Value / _3.Value + V8.Value / _3.Value";
		VariableReferenceList	[ P0 Variable:/SBMLParameter:parameter_5 1 ] [ V0 Variable:/_1:_99 0 ] [ _1 Variable:/_1:SIZE 0 ] [ V1 Variable:/_1:_105 0 ] [ V2 Variable:/_1:_129 0 ] [ V3 Variable:/_1:_153 0 ] [ V4 Variable:/_3:_9 0 ] [ _3 Variable:/_3:SIZE 0 ] [ V5 Variable:/_3:_13 0 ] [ V6 Variable:/_3:_19 0 ] [ V7 Variable:/_3:_21 0 ] [ V8 Variable:/_3:species_19 0 ];
	}
	
	Process ExpressionAssignmentProcess( Rule5 )
	{
		Expression	"V0.Value / _1.Value + V1.Value / _1.Value + V2.Value / _1.Value + V3.Value / _3.Value + V4.Value / _3.Value + V5.Value / _3.Value + V6.Value / _3.Value + V7.Value / _3.Value + V8.Value / _3.Value + V9.Value / _3.Value + V10.Value / _3.Value + V11.Value / _3.Value + V12.Value / _3.Value";
		VariableReferenceList	[ P0 Variable:/SBMLParameter:parameter_6 1 ] [ V0 Variable:/_1:_147 0 ] [ _1 Variable:/_1:SIZE 0 ] [ V1 Variable:/_1:_153 0 ] [ V2 Variable:/_1:species_6 0 ] [ V3 Variable:/_3:_5 0 ] [ _3 Variable:/_3:SIZE 0 ] [ V4 Variable:/_3:_9 0 ] [ V5 Variable:/_3:species_18 0 ] [ V6 Variable:/_3:_13 0 ] [ V7 Variable:/_3:species_16 0 ] [ V8 Variable:/_3:species_19 0 ] [ V9 Variable:/_3:species_21 0 ] [ V10 Variable:/_3:species_27 0 ] [ V11 Variable:/_3:species_26 0 ] [ V12 Variable:/_3:species_23 0 ];
	}
	
	Process ExpressionAssignmentProcess( Rule6 )
	{
		Expression	"V0.Value / _1.Value + V1.Value / _1.Value + V2.Value / _3.Value + V3.Value / _3.Value + V4.Value / _3.Value + V5.Value / _3.Value";
		VariableReferenceList	[ P0 Variable:/SBMLParameter:parameter_7 1 ] [ V0 Variable:/_1:species_4 0 ] [ _1 Variable:/_1:SIZE 0 ] [ V1 Variable:/_1:species_6 0 ] [ V2 Variable:/_3:species_18 0 ] [ _3 Variable:/_3:SIZE 0 ] [ V3 Variable:/_3:species_20 0 ] [ V4 Variable:/_3:species_21 0 ] [ V5 Variable:/_3:species_26 0 ];
	}
	
	Process ExpressionAssignmentProcess( Rule7 )
	{
		Expression	"V0.Value / _1.Value + V1.Value / _1.Value + V2.Value / _1.Value + V3.Value / _1.Value + V4.Value / _1.Value + V5.Value / _3.Value + V6.Value / _3.Value + V7.Value / _3.Value + V8.Value / _3.Value + V9.Value / _3.Value + V10.Value / _3.Value";
		VariableReferenceList	[ P0 Variable:/SBMLParameter:parameter_8 1 ] [ V0 Variable:/_1:species_3 0 ] [ _1 Variable:/_1:SIZE 0 ] [ V1 Variable:/_1:species_4 0 ] [ V2 Variable:/_1:species_5 0 ] [ V3 Variable:/_1:species_6 0 ] [ V4 Variable:/_1:species_8 0 ] [ V5 Variable:/_3:species_17 0 ] [ _3 Variable:/_3:SIZE 0 ] [ V6 Variable:/_3:species_18 0 ] [ V7 Variable:/_3:species_20 0 ] [ V8 Variable:/_3:species_21 0 ] [ V9 Variable:/_3:species_26 0 ] [ V10 Variable:/_3:species_27 0 ];
	}
	
	Process ExpressionAssignmentProcess( Rule8 )
	{
		Expression	"V0.Value / _1.Value + V1.Value / _1.Value + V2.Value / _1.Value";
		VariableReferenceList	[ P0 Variable:/SBMLParameter:parameter_9 1 ] [ V0 Variable:/_1:_147 0 ] [ _1 Variable:/_1:SIZE 0 ] [ V1 Variable:/_1:_153 0 ] [ V2 Variable:/_1:species_6 0 ];
	}
	
	Process ExpressionAssignmentProcess( Rule9 )
	{
		Expression	"V0.Value / _1.Value + V1.Value / _3.Value + V2.Value / _3.Value + V3.Value / _3.Value + V4.Value / _3.Value + V5.Value / _3.Value + V4.Value / _3.Value + V6.Value / _3.Value + V7.Value / _3.Value + V8.Value / _3.Value + V9.Value / _3.Value + V9.Value / _3.Value + V10.Value / _3.Value";
		VariableReferenceList	[ P0 Variable:/SBMLParameter:parameter_10 1 ] [ V0 Variable:/_1:species_11 0 ] [ _1 Variable:/_1:SIZE 0 ] [ V1 Variable:/_3:_5 0 ] [ _3 Variable:/_3:SIZE 0 ] [ V2 Variable:/_3:_9 0 ] [ V3 Variable:/_3:_13 0 ] [ V4 Variable:/_3:species_18 0 ] [ V5 Variable:/_3:species_16 0 ] [ V6 Variable:/_3:species_19 0 ] [ V7 Variable:/_3:species_21 0 ] [ V8 Variable:/_3:species_23 0 ] [ V9 Variable:/_3:species_26 0 ] [ V10 Variable:/_3:species_27 0 ];
	}
	
	
}

