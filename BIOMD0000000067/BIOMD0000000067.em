
# created by eml2em program
# from file: BIOMD0000000067.eml, date: Sun Mar  2 01:28:33 2014
#

Stepper ODEStepper( Default )
{
	# no property
}

System System( / )
{
	StepperID	Default;
	Name	default;

	Process ExpressionFluxProcess( V_gly )
	{
		Name	"Glycolytic flux";
		Expression	"compartment.Value * S0.Value";
		VariableReferenceList
			[ AcCoA       Variable:/compartment:AcCoA 1 ]
			[ compartment Variable:/compartment:SIZE  0 ]
			[ S0          Variable:/SBMLParameter:S0  0 ];
	}
	
	Process ExpressionFluxProcess( V_TCA )
	{
		Name	"Flux to TCA cycle";
		Expression	"compartment.Value * kTCA.Value * AcCoA.NumberConc";
		VariableReferenceList
			[ AcCoA       Variable:/compartment:AcCoA  -1 ]
			[ compartment Variable:/compartment:SIZE   0  ]
			[ kTCA        Variable:/SBMLParameter:kTCA 0  ];
	}
	
	Process ExpressionFluxProcess( V_out )
	{
		Name	"Intercellular transport of Acetate";
		Expression	"compartment.Value * k3.Value * (HOAc.NumberConc - HOAc_E.NumberConc)";
		VariableReferenceList
			[ HOAc        Variable:/compartment:HOAc   -1 ]
			[ HOAc_E      Variable:/compartment:HOAc_E 1  ]
			[ compartment Variable:/compartment:SIZE   0  ]
			[ k3          Variable:/SBMLParameter:k3   0  ];
	}
	
	Process ExpressionFluxProcess( V_Pta )
	{
		Name	"Phosphate acetyl transferase flux";
		Expression	"compartment.Value * k1.Value * Pta.NumberConc * AcCoA.NumberConc / (KM1.Value + AcCoA.NumberConc)";
		VariableReferenceList
			[ AcCoA       Variable:/compartment:AcCoA -1 ]
			[ AcP         Variable:/compartment:AcP   1  ]
			[ Pta         Variable:/compartment:Pta   0  ]
			[ compartment Variable:/compartment:SIZE  0  ]
			[ k1          Variable:/SBMLParameter:k1  0  ]
			[ KM1         Variable:/SBMLParameter:KM1 0  ];
	}
	
	Process ExpressionFluxProcess( V_Ack )
	{
		Name	"Acetate kinase";
		Expression	"compartment.Value * (kAck_f.Value * AcP.NumberConc - kAck_r.Value * OAc.NumberConc)";
		VariableReferenceList
			[ AcP         Variable:/compartment:AcP      -1 ]
			[ OAc         Variable:/compartment:OAc      1  ]
			[ compartment Variable:/compartment:SIZE     0  ]
			[ kAck_f      Variable:/SBMLParameter:kAck_f 0  ]
			[ kAck_r      Variable:/SBMLParameter:kAck_r 0  ];
	}
	
	Process ExpressionFluxProcess( V_Acs )
	{
		Name	"Acetyl-CoA synthase flux";
		Expression	"compartment.Value * k2.Value * Acs.NumberConc * OAc.NumberConc / (KM2.Value + OAc.NumberConc)";
		VariableReferenceList
			[ OAc         Variable:/compartment:OAc   -1 ]
			[ AcCoA       Variable:/compartment:AcCoA 1  ]
			[ Acs         Variable:/compartment:Acs   0  ]
			[ compartment Variable:/compartment:SIZE  0  ]
			[ k2          Variable:/SBMLParameter:k2  0  ]
			[ KM2         Variable:/SBMLParameter:KM2 0  ];
	}
	
	Process ExpressionFluxProcess( V_Ace )
	{
		Name	"Acid-base equilibrium";
		Expression	"compartment.Value * C.Value * (OAc.NumberConc * H.Value - Keq.Value * HOAc.NumberConc)";
		VariableReferenceList
			[ OAc         Variable:/compartment:OAc   -1 ]
			[ HOAc        Variable:/compartment:HOAc  1  ]
			[ compartment Variable:/compartment:SIZE  0  ]
			[ C           Variable:/SBMLParameter:C   0  ]
			[ H           Variable:/SBMLParameter:H   0  ]
			[ Keq         Variable:/SBMLParameter:Keq 0  ];
	}
	
	Process ExpressionFluxProcess( R_LacI )
	{
		Name	"LacI synthesis";
		Expression	"compartment.Value * (alpha1.Value * pow(AcP.NumberConc / Kg1.Value, n.Value) / (1 + pow(AcP.NumberConc / Kg1.Value, n.Value)) + alpha0.Value)";
		VariableReferenceList
			[ LacI        Variable:/compartment:LacI     1 ]
			[ AcP         Variable:/compartment:AcP      0 ]
			[ compartment Variable:/compartment:SIZE     0 ]
			[ alpha1      Variable:/SBMLParameter:alpha1 0 ]
			[ Kg1         Variable:/SBMLParameter:Kg1    0 ]
			[ n           Variable:/SBMLParameter:n      0 ]
			[ alpha0      Variable:/SBMLParameter:alpha0 0 ];
	}
	
	Process ExpressionFluxProcess( R_Acs )
	{
		Name	"Acetyl-CoA synthase synthesis";
		Expression	"compartment.Value * (alpha2.Value * pow(AcP.NumberConc / Kg2.Value, n.Value) / (1 + pow(AcP.NumberConc / Kg2.Value, n.Value)) + alpha0.Value)";
		VariableReferenceList
			[ Acs         Variable:/compartment:Acs      1 ]
			[ AcP         Variable:/compartment:AcP      0 ]
			[ compartment Variable:/compartment:SIZE     0 ]
			[ alpha2      Variable:/SBMLParameter:alpha2 0 ]
			[ Kg2         Variable:/SBMLParameter:Kg2    0 ]
			[ n           Variable:/SBMLParameter:n      0 ]
			[ alpha0      Variable:/SBMLParameter:alpha0 0 ];
	}
	
	Process ExpressionFluxProcess( R_Pta )
	{
		Name	"Phosphate acetyl transferase synthase";
		Expression	"alpha3.Value / (1 + pow(LacI.NumberConc / Kg3.Value, n.Value)) + alpha0.Value";
		VariableReferenceList
			[ Pta    Variable:/compartment:Pta      1 ]
			[ LacI   Variable:/compartment:LacI     0 ]
			[ alpha3 Variable:/SBMLParameter:alpha3 0 ]
			[ Kg3    Variable:/SBMLParameter:Kg3    0 ]
			[ n      Variable:/SBMLParameter:n      0 ]
			[ alpha0 Variable:/SBMLParameter:alpha0 0 ];
	}
	
	Process ExpressionFluxProcess( R_dLacI )
	{
		Name	"LacI degradation";
		Expression	"compartment.Value * kd.Value * LacI.NumberConc";
		VariableReferenceList
			[ LacI        Variable:/compartment:LacI -1 ]
			[ compartment Variable:/compartment:SIZE 0  ]
			[ kd          Variable:/SBMLParameter:kd 0  ];
	}
	
	Process ExpressionFluxProcess( R_dAcs )
	{
		Name	"Acs degradation";
		Expression	"compartment.Value * kd.Value * Acs.NumberConc";
		VariableReferenceList
			[ Acs         Variable:/compartment:Acs  -1 ]
			[ compartment Variable:/compartment:SIZE 0  ]
			[ kd          Variable:/SBMLParameter:kd 0  ];
	}
	
	Process ExpressionFluxProcess( R_dPta )
	{
		Name	"Pta degradation";
		Expression	"compartment.Value * kd.Value * Pta.NumberConc";
		VariableReferenceList
			[ Pta         Variable:/compartment:Pta  -1 ]
			[ compartment Variable:/compartment:SIZE 0  ]
			[ kd          Variable:/SBMLParameter:kd 0  ];
	}
	
	
}

System System( /compartment )
{
	StepperID	Default;
	Name	Intracellular;

	Variable Variable( Dimensions )
	{
		Value	3;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Fixed	1;
	}
	
	Variable Variable( AcCoA )
	{
		Name	"Acetyl-CoA";
		NumberConc	0.0;
		Fixed	0;
	}
	
	Variable Variable( AcP )
	{
		Name	"Acetyl phosphate";
		NumberConc	0.0;
		Fixed	0;
	}
	
	Variable Variable( OAc )
	{
		Name	Acetate;
		NumberConc	0.0;
		Fixed	0;
	}
	
	Variable Variable( HOAc )
	{
		Name	"protonated acetate";
		NumberConc	0.0;
		Fixed	0;
	}
	
	Variable Variable( LacI )
	{
		Name	"lac repressor";
		NumberConc	0.0;
		Fixed	0;
	}
	
	Variable Variable( Acs )
	{
		Name	"Acetyl-CoA synthase";
		NumberConc	0.0;
		Fixed	0;
	}
	
	Variable Variable( Pta )
	{
		Name	"Phosphate acetyl transferase";
		NumberConc	0.0;
		Fixed	0;
	}
	
	Variable Variable( HOAc_E )
	{
		Name	"acetate export";
		NumberConc	0.0;
		Fixed	0;
	}
	
	
}

System System( /SBMLParameter )
{
	StepperID	Default;
	Name	"Global Parameter";

	Variable Variable( S0 )
	{
		Value	0.5;
		Fixed	1;
	}
	
	Variable Variable( kTCA )
	{
		Value	10.0;
		Fixed	1;
	}
	
	Variable Variable( k1 )
	{
		Value	80.0;
		Fixed	1;
	}
	
	Variable Variable( KM1 )
	{
		Value	0.06;
		Fixed	1;
	}
	
	Variable Variable( k2 )
	{
		Value	0.8;
		Fixed	1;
	}
	
	Variable Variable( KM2 )
	{
		Value	0.1;
		Fixed	1;
	}
	
	Variable Variable( kAck_f )
	{
		Value	1.0;
		Fixed	1;
	}
	
	Variable Variable( kAck_r )
	{
		Value	1.0;
		Fixed	1;
	}
	
	Variable Variable( C )
	{
		Value	100.0;
		Fixed	1;
	}
	
	Variable Variable( H )
	{
		Value	1e-07;
		Fixed	1;
	}
	
	Variable Variable( Keq )
	{
		Value	0.0005;
		Fixed	1;
	}
	
	Variable Variable( k3 )
	{
		Value	0.01;
		Fixed	1;
	}
	
	Variable Variable( alpha0 )
	{
		Value	0.0;
		Fixed	1;
	}
	
	Variable Variable( alpha1 )
	{
		Value	0.1;
		Fixed	1;
	}
	
	Variable Variable( alpha2 )
	{
		Value	2.0;
		Fixed	1;
	}
	
	Variable Variable( alpha3 )
	{
		Value	2.0;
		Fixed	1;
	}
	
	Variable Variable( Kg1 )
	{
		Value	10.0;
		Fixed	1;
	}
	
	Variable Variable( Kg2 )
	{
		Value	10.0;
		Fixed	1;
	}
	
	Variable Variable( Kg3 )
	{
		Value	0.001;
		Fixed	1;
	}
	
	Variable Variable( n )
	{
		Value	2.0;
		Fixed	1;
	}
	
	Variable Variable( kd )
	{
		Value	0.06;
		Fixed	1;
	}
	
	
}

