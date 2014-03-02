
# created by eml2em program
# from file: BIOMD0000000184.eml, date: Sun Mar  2 12:18:48 2014
#

Stepper ODEStepper( Default )
{
	# no property
}

System System( / )
{
	StepperID	Default;
	Name	default;

	Process ExpressionFluxProcess( R1 )
	{
		Name	vin;
		Expression	"compartment.Value * vin.Value";
		VariableReferenceList
			[ X           Variable:/compartment:X     1 ]
			[ compartment Variable:/compartment:SIZE  0 ]
			[ vin         Variable:/SBMLParameter:vin 0 ];
	}
	
	Process ExpressionFluxProcess( R2 )
	{
		Name	"Calcium export from cell";
		Expression	"compartment.Value * kout.Value * X.NumberConc";
		VariableReferenceList
			[ X           Variable:/compartment:X      -1 ]
			[ compartment Variable:/compartment:SIZE   0  ]
			[ kout        Variable:/SBMLParameter:kout 0  ];
	}
	
	Process ExpressionFluxProcess( R3 )
	{
		Name	CICR;
		Expression	"ER.Value * 4 * vM3.Value * pow(k_CaA.Value, n.Value) * (pow(X.NumberConc, n.Value) / ((pow(X.NumberConc, n.Value) + pow(k_CaA.Value, n.Value)) * (pow(X.NumberConc, n.Value) + pow(k_CaI.Value, n.Value)))) * (pow(Z.NumberConc, m.Value) / (pow(Z.NumberConc, m.Value) + pow(kip3.Value, m.Value))) * (Y.NumberConc - X.NumberConc)";
		VariableReferenceList
			[ Y     Variable:/ER:Y                -1 ]
			[ X     Variable:/compartment:X       1  ]
			[ Z     Variable:/compartment:Z       0  ]
			[ ER    Variable:/ER:SIZE             0  ]
			[ vM3   Variable:/SBMLParameter:vM3   0  ]
			[ k_CaA Variable:/SBMLParameter:k_CaA 0  ]
			[ n     Variable:/SBMLParameter:n     0  ]
			[ k_CaI Variable:/SBMLParameter:k_CaI 0  ]
			[ m     Variable:/SBMLParameter:m     0  ]
			[ kip3  Variable:/SBMLParameter:kip3  0  ];
	}
	
	Process ExpressionFluxProcess( R4 )
	{
		Name	serca;
		Expression	"compartment.Value * vM2.Value * pow(X.NumberConc, 2) / (pow(X.NumberConc, 2) + pow(k2.Value, 2))";
		VariableReferenceList
			[ X           Variable:/compartment:X     -1 ]
			[ Y           Variable:/ER:Y              1  ]
			[ compartment Variable:/compartment:SIZE  0  ]
			[ vM2         Variable:/SBMLParameter:vM2 0  ]
			[ k2          Variable:/SBMLParameter:k2  0  ];
	}
	
	Process ExpressionFluxProcess( R5 )
	{
		Name	"Leak flux";
		Expression	"ER.Value * kf.Value * (Y.NumberConc - X.NumberConc)";
		VariableReferenceList
			[ Y  Variable:/ER:Y             -1 ]
			[ X  Variable:/compartment:X    1  ]
			[ ER Variable:/ER:SIZE          0  ]
			[ kf Variable:/SBMLParameter:kf 0  ];
	}
	
	Process ExpressionFluxProcess( R6 )
	{
		Name	PLC;
		Expression	"compartment.Value * vp.Value * pow(X.NumberConc, 2) / (pow(X.NumberConc, 2) + pow(kp.Value, 2))";
		VariableReferenceList
			[ Z           Variable:/compartment:Z    1 ]
			[ X           Variable:/compartment:X    0 ]
			[ compartment Variable:/compartment:SIZE 0 ]
			[ vp          Variable:/SBMLParameter:vp 0 ]
			[ kp          Variable:/SBMLParameter:kp 0 ];
	}
	
	Process ExpressionFluxProcess( R7 )
	{
		Name	"IP3 degradation";
		Expression	"compartment.Value * kdeg.Value * Z.NumberConc";
		VariableReferenceList
			[ Z           Variable:/compartment:Z      -1 ]
			[ compartment Variable:/compartment:SIZE   0  ]
			[ kdeg        Variable:/SBMLParameter:kdeg 0  ];
	}
	
	
}

System System( /compartment )
{
	StepperID	Default;
	Name	Cytoplasm;

	Variable Variable( Dimensions )
	{
		Value	3;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Fixed	1;
	}
	
	Variable Variable( X )
	{
		Name	"Cytoplasmic Calcium";
		NumberConc	0.1;
		Fixed	0;
	}
	
	Variable Variable( Z )
	{
		Name	IP3;
		NumberConc	0.1;
		Fixed	0;
	}
	
	
}

System System( /ER )
{
	StepperID	Default;
	Name	"Endoplasmic Reticulum";

	Variable Variable( Dimensions )
	{
		Value	3;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Fixed	1;
	}
	
	Variable Variable( Y )
	{
		Name	"Calcium in ER";
		NumberConc	1.5;
		Fixed	0;
	}
	
	
}

System System( /SBMLParameter )
{
	StepperID	Default;
	Name	"Global Parameter";

	Variable Variable( vin )
	{
		Value	0.05;
		Fixed	1;
	}
	
	Variable Variable( kout )
	{
		Value	0.5;
		Fixed	1;
	}
	
	Variable Variable( vM3 )
	{
		Value	40.0;
		Fixed	1;
	}
	
	Variable Variable( k_CaA )
	{
		Value	0.15;
		Fixed	1;
	}
	
	Variable Variable( n )
	{
		Value	2.02;
		Fixed	1;
	}
	
	Variable Variable( k_CaI )
	{
		Value	0.15;
		Fixed	1;
	}
	
	Variable Variable( m )
	{
		Value	2.2;
		Fixed	1;
	}
	
	Variable Variable( kip3 )
	{
		Value	0.1;
		Fixed	1;
	}
	
	Variable Variable( vM2 )
	{
		Value	15.0;
		Fixed	1;
	}
	
	Variable Variable( k2 )
	{
		Value	0.1;
		Fixed	1;
	}
	
	Variable Variable( kf )
	{
		Value	0.5;
		Fixed	1;
	}
	
	Variable Variable( vp )
	{
		Value	0.05;
		Fixed	1;
	}
	
	Variable Variable( kp )
	{
		Value	0.3;
		Fixed	1;
	}
	
	Variable Variable( kdeg )
	{
		Value	0.08;
		Fixed	1;
	}
	
	
}

