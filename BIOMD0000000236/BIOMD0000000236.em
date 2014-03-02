
# created by eml2em program
# from file: BIOMD0000000236.eml, date: Sun Mar  2 20:24:07 2014
#

Stepper ODEStepper( Default )
{
	# no property
}

System System( / )
{
	StepperID	Default;
	Name	default;

	Process ExpressionFluxProcess( vgk )
	{
		Name	vgk;
		Expression	"cell.Value * Vgk.Value * pow(GLC.NumberConc / Sgk.Value, hGK.Value) / (1 + pow(GLC.NumberConc / Sgk.Value, hGK.Value))";
		VariableReferenceList
			[ GLC     Variable:/cell:GLC          0 ]
			[ G6P_F6P Variable:/cell:G6P_F6P      1 ]
			[ cell    Variable:/cell:SIZE         0 ]
			[ Vgk     Variable:/SBMLParameter:Vgk 0 ]
			[ Sgk     Variable:/SBMLParameter:Sgk 0 ]
			[ hGK     Variable:/SBMLParameter:hGK 0 ];
	}
	
	Process ExpressionFluxProcess( vpfk )
	{
		Name	vpfk;
		Expression	"cell.Value * Vpfk.Value * pow(F6P.NumberConc / Spfk.Value, hpfk.Value - (hpfk.Value - hact.Value) * (FBP.NumberConc / Sfba.Value / (1 + FBP.NumberConc / Sfba.Value))) / (pow(F6P.NumberConc / Spfk.Value, hpfk.Value - (hpfk.Value - hact.Value) * (FBP.NumberConc / Sfba.Value / (1 + FBP.NumberConc / Sfba.Value))) + (1 + pow(FBP.NumberConc / Xpfk.Value, hx.Value)) / (1 + pow(alpha.Value, hpfk.Value - (hpfk.Value - hact.Value) * (FBP.NumberConc / Sfba.Value / (1 + FBP.NumberConc / Sfba.Value))) * pow(FBP.NumberConc / Xpfk.Value, hx.Value)))";
		VariableReferenceList
			[ G6P_F6P Variable:/cell:G6P_F6P        -1 ]
			[ FBP     Variable:/cell:FBP            1  ]
			[ F6P     Variable:/cell:F6P            0  ]
			[ cell    Variable:/cell:SIZE           0  ]
			[ Vpfk    Variable:/SBMLParameter:Vpfk  0  ]
			[ Spfk    Variable:/SBMLParameter:Spfk  0  ]
			[ hpfk    Variable:/SBMLParameter:hpfk  0  ]
			[ hact    Variable:/SBMLParameter:hact  0  ]
			[ Sfba    Variable:/SBMLParameter:Sfba  0  ]
			[ Xpfk    Variable:/SBMLParameter:Xpfk  0  ]
			[ hx      Variable:/SBMLParameter:hx    0  ]
			[ alpha   Variable:/SBMLParameter:alpha 0  ];
	}
	
	Process ExpressionFluxProcess( vfba )
	{
		Name	vfba;
		Expression	"cell.Value * Vfba.Value * (FBP.NumberConc / Sfba.Value - G3P.NumberConc * DHAP.NumberConc / (Pfba.Value * Qfba.Value * KeqFBA.Value)) / (1 + FBP.NumberConc / Sfba.Value + DHAP.NumberConc / Qfba.Value + G3P.NumberConc * DHAP.NumberConc / (Pfba.Value * Qfba.Value))";
		VariableReferenceList
			[ FBP      Variable:/cell:FBP             -1 ]
			[ DHAP_G3P Variable:/cell:DHAP_G3P        2  ]
			[ G3P      Variable:/cell:G3P             0  ]
			[ DHAP     Variable:/cell:DHAP            0  ]
			[ cell     Variable:/cell:SIZE            0  ]
			[ Vfba     Variable:/SBMLParameter:Vfba   0  ]
			[ Sfba     Variable:/SBMLParameter:Sfba   0  ]
			[ Pfba     Variable:/SBMLParameter:Pfba   0  ]
			[ Qfba     Variable:/SBMLParameter:Qfba   0  ]
			[ KeqFBA   Variable:/SBMLParameter:KeqFBA 0  ];
	}
	
	Process ExpressionFluxProcess( vgapdh )
	{
		Name	vgapdh;
		Expression	"cell.Value * Vgapdh.Value * G3P.NumberConc / (Sgapdh.Value + G3P.NumberConc)";
		VariableReferenceList
			[ DHAP_G3P Variable:/cell:DHAP_G3P        -1 ]
			[ G3P      Variable:/cell:G3P             0  ]
			[ cell     Variable:/cell:SIZE            0  ]
			[ Vgapdh   Variable:/SBMLParameter:Vgapdh 0  ]
			[ Sgapdh   Variable:/SBMLParameter:Sgapdh 0  ];
	}
	
	
}

System System( /cell )
{
	StepperID	Default;
	Name	cell;

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
		Name	"intracellular glucose";
		NumberConc	10.0;
		Fixed	1;
	}
	
	Variable Variable( G6P_F6P )
	{
		Name	G6P_F6P;
		NumberConc	3.71728;
		Fixed	0;
	}
	
	Variable Variable( F6P )
	{
		Name	"fructose-6-phosphate";
		Value	0.857833846154;
		Fixed	0;
	}
	
	Variable Variable( FBP )
	{
		Name	"fructose-1,6-biphosphate";
		NumberConc	0.00063612;
		Fixed	0;
	}
	
	Variable Variable( G3P )
	{
		Name	"glyceraldehyde--phosphate";
		Value	0.000114334137098;
		Fixed	0;
	}
	
	Variable Variable( DHAP )
	{
		Name	"dihydroxyacetone-phosphate";
		Value	0.0025153258629;
		Fixed	0;
	}
	
	Variable Variable( DHAP_G3P )
	{
		Name	"DHAP-G3P pool";
		NumberConc	0.00262966;
		Fixed	0;
	}
	
	
}

System System( /SBMLParameter )
{
	StepperID	Default;
	Name	"Global Parameter";

	Variable Variable( Vgk )
	{
		Name	Vgk;
		Value	0.05555;
	}
	
	Variable Variable( hGK )
	{
		Name	hGK;
		Value	1.7;
		Fixed	1;
	}
	
	Variable Variable( KeqGPI )
	{
		Name	KeqGPI;
		Value	0.3;
		Fixed	1;
	}
	
	Variable Variable( KeqTPI )
	{
		Name	KeqTPI;
		Value	0.045455;
		Fixed	1;
	}
	
	Variable Variable( Vpfk )
	{
		Name	Vpfk;
		Value	0.5555;
	}
	
	Variable Variable( Vfba )
	{
		Name	Vfba;
		Value	0.138875;
	}
	
	Variable Variable( Vgapdh )
	{
		Name	Vgapdh;
		Value	1.38875;
	}
	
	Variable Variable( Sgk )
	{
		Name	Sgk;
		Value	8.0;
		Fixed	1;
	}
	
	Variable Variable( Spfk )
	{
		Name	Spfk;
		Value	4.0;
		Fixed	1;
	}
	
	Variable Variable( Sfba )
	{
		Name	Sfba;
		Value	0.005;
		Fixed	1;
	}
	
	Variable Variable( Sgapdh )
	{
		Name	Sgapdh;
		Value	0.005;
		Fixed	1;
	}
	
	Variable Variable( Xpfk )
	{
		Name	Xpfk;
		Value	0.01;
		Fixed	1;
	}
	
	Variable Variable( alpha )
	{
		Name	alpha;
		Value	5.0;
		Fixed	1;
	}
	
	Variable Variable( hx )
	{
		Name	hx;
		Value	2.5;
		Fixed	1;
	}
	
	Variable Variable( hpfk )
	{
		Name	hpfk;
		Value	2.5;
		Fixed	1;
	}
	
	Variable Variable( hact )
	{
		Name	hact;
		Value	1.0;
		Fixed	1;
	}
	
	Variable Variable( dw_per_ml )
	{
		Name	dw_per_ml;
		Value	0.3333;
		Fixed	1;
	}
	
	Variable Variable( min_to_sec )
	{
		Name	min_to_sec;
		Value	60.0;
		Fixed	1;
	}
	
	Variable Variable( Vgk_min )
	{
		Name	Vgk_min;
		Value	10.0;
		Fixed	1;
	}
	
	Variable Variable( Vpfk_min )
	{
		Name	Vpfk_min;
		Value	100.0;
		Fixed	1;
	}
	
	Variable Variable( Vfba_min )
	{
		Name	Vfba_min;
		Value	25.0;
		Fixed	1;
	}
	
	Variable Variable( Vgapdh_min )
	{
		Name	Vgapdh_min;
		Value	250.0;
		Fixed	1;
	}
	
	Variable Variable( Pfba )
	{
		Name	Pfba;
		Value	0.5;
		Fixed	1;
	}
	
	Variable Variable( Qfba )
	{
		Name	Qfba;
		Value	0.275;
		Fixed	1;
	}
	
	Variable Variable( KeqFBA )
	{
		Name	KeqFBA;
		Value	0.1;
		Fixed	1;
	}
	
	Variable Variable( sigma )
	{
		Name	sigma;
		Value	0.214458461538;
	}
	
	
}

System System( /SBMLRule )
{
	Name	"System for SBML Rule";
	StepperID	Default;

	Process ExpressionAssignmentProcess( Assignment_sigma )
	{
		StepperID	Default;
		Name	"Assignment rule for 'sigma'";
		Expression	"F6P.NumberConc / Spfk.NumberConc";
		VariableReferenceList
			[ sigma Variable:/SBMLParameter:sigma 1 ]
			[ F6P   Variable:/cell:F6P            0 ]
			[ Spfk  Variable:/SBMLParameter:Spfk  0 ];
	}
	
	Process ExpressionAssignmentProcess( Assignment_Vgk )
	{
		StepperID	Default;
		Name	"Assignment rule for 'Vgk'";
		Expression	"Vgk_min.NumberConc * dw_per_ml.NumberConc / min_to_sec.NumberConc";
		VariableReferenceList
			[ Vgk        Variable:/SBMLParameter:Vgk        1 ]
			[ Vgk_min    Variable:/SBMLParameter:Vgk_min    0 ]
			[ dw_per_ml  Variable:/SBMLParameter:dw_per_ml  0 ]
			[ min_to_sec Variable:/SBMLParameter:min_to_sec 0 ];
	}
	
	Process ExpressionAssignmentProcess( Assignment_Vpfk )
	{
		StepperID	Default;
		Name	"Assignment rule for 'Vpfk'";
		Expression	"Vpfk_min.NumberConc * dw_per_ml.NumberConc / min_to_sec.NumberConc";
		VariableReferenceList
			[ Vpfk       Variable:/SBMLParameter:Vpfk       1 ]
			[ Vpfk_min   Variable:/SBMLParameter:Vpfk_min   0 ]
			[ dw_per_ml  Variable:/SBMLParameter:dw_per_ml  0 ]
			[ min_to_sec Variable:/SBMLParameter:min_to_sec 0 ];
	}
	
	Process ExpressionAssignmentProcess( Assignment_Vfba )
	{
		StepperID	Default;
		Name	"Assignment rule for 'Vfba'";
		Expression	"Vfba_min.NumberConc * dw_per_ml.NumberConc / min_to_sec.NumberConc";
		VariableReferenceList
			[ Vfba       Variable:/SBMLParameter:Vfba       1 ]
			[ Vfba_min   Variable:/SBMLParameter:Vfba_min   0 ]
			[ dw_per_ml  Variable:/SBMLParameter:dw_per_ml  0 ]
			[ min_to_sec Variable:/SBMLParameter:min_to_sec 0 ];
	}
	
	Process ExpressionAssignmentProcess( Assignment_Vgapdh )
	{
		StepperID	Default;
		Name	"Assignment rule for 'Vgapdh'";
		Expression	"Vgapdh_min.NumberConc * dw_per_ml.NumberConc / min_to_sec.NumberConc";
		VariableReferenceList
			[ Vgapdh     Variable:/SBMLParameter:Vgapdh     1 ]
			[ Vgapdh_min Variable:/SBMLParameter:Vgapdh_min 0 ]
			[ dw_per_ml  Variable:/SBMLParameter:dw_per_ml  0 ]
			[ min_to_sec Variable:/SBMLParameter:min_to_sec 0 ];
	}
	
	Process ExpressionAssignmentProcess( Assignment_F6P )
	{
		StepperID	Default;
		Name	"Assignment rule for 'F6P'";
		Expression	"G6P_F6P.NumberConc * KeqGPI.NumberConc / (1 + KeqGPI.NumberConc)";
		VariableReferenceList
			[ F6P     Variable:/cell:F6P             1 ]
			[ G6P_F6P Variable:/cell:G6P_F6P         0 ]
			[ KeqGPI  Variable:/SBMLParameter:KeqGPI 0 ];
	}
	
	Process ExpressionAssignmentProcess( Assignment_G3P )
	{
		StepperID	Default;
		Name	"Assignment rule for 'G3P'";
		Expression	"DHAP_G3P.NumberConc * KeqTPI.NumberConc / (1 + KeqTPI.NumberConc)";
		VariableReferenceList
			[ G3P      Variable:/cell:G3P             1 ]
			[ DHAP_G3P Variable:/cell:DHAP_G3P        0 ]
			[ KeqTPI   Variable:/SBMLParameter:KeqTPI 0 ];
	}
	
	Process ExpressionAssignmentProcess( Assignment_DHAP )
	{
		StepperID	Default;
		Name	"Assignment rule for 'DHAP'";
		Expression	"DHAP_G3P.NumberConc - G3P.NumberConc";
		VariableReferenceList
			[ DHAP     Variable:/cell:DHAP     1 ]
			[ DHAP_G3P Variable:/cell:DHAP_G3P 0 ]
			[ G3P      Variable:/cell:G3P      0 ];
	}
	
	
}

