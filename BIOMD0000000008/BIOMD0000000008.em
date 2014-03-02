
# created by eml2em program
# from file: BIOMD0000000008.eml, date: Sat Mar  1 16:48:07 2014
#

Stepper ODEStepper( Default )
{
	# no property
}

System System( / )
{
	StepperID	Default;
	Name	default;

	Process ExpressionFluxProcess( reaction1 )
	{
		Name	"creation of cyclin";
		vi	0.1;
		Expression	vi;
		VariableReferenceList
			[ C Variable:/Cell:C 1 ];
	}
	
	Process ExpressionFluxProcess( reaction2 )
	{
		Name	"cdc2 kinase triggered degration of cyclin";
		k1	0.5;
		K5	0.02;
		Expression	"C.NumberConc * k1 * X.NumberConc * pow(C.NumberConc + K5, -1)";
		VariableReferenceList
			[ C Variable:/Cell:C -1 ]
			[ X Variable:/Cell:X 0  ];
	}
	
	Process ExpressionFluxProcess( reaction3 )
	{
		Name	"default degradation of cyclin";
		kd	0.02;
		Expression	"C.NumberConc * kd";
		VariableReferenceList
			[ C Variable:/Cell:C -1 ];
	}
	
	Process ExpressionFluxProcess( reaction4 )
	{
		Name	"activation of cdc2 kinase";
		K1	0.1;
		Expression	"(1 + -1 * M.NumberConc) * V1.Value * pow(K1 + -1 * M.NumberConc + 1, -1)";
		VariableReferenceList
			[ M  Variable:/Cell:M           1 ]
			[ V1 Variable:/SBMLParameter:V1 0 ];
	}
	
	Process ExpressionFluxProcess( reaction5 )
	{
		Name	"deactivation of cdc2 kinase";
		V2	0.25;
		K2	0.1;
		Expression	"M.NumberConc * V2 * pow(K2 + M.NumberConc, -1)";
		VariableReferenceList
			[ M Variable:/Cell:M -1 ];
	}
	
	Process ExpressionFluxProcess( reaction6 )
	{
		Name	"activation of cyclin protease";
		K3	0.2;
		Expression	"V3.Value * (1 + -1 * X.NumberConc) * pow(K3 + -1 * X.NumberConc + 1, -1)";
		VariableReferenceList
			[ X  Variable:/Cell:X           1 ]
			[ V3 Variable:/SBMLParameter:V3 0 ];
	}
	
	Process ExpressionFluxProcess( reaction7 )
	{
		Name	"deactivation of cyclin protease";
		K4	0.1;
		V4	0.1;
		Expression	"V4 * X.NumberConc * pow(K4 + X.NumberConc, -1)";
		VariableReferenceList
			[ X Variable:/Cell:X -1 ];
	}
	
	Process ExpressionFluxProcess( reaction8 )
	{
		Name	reaction8;
		a1	0.05;
		Expression	"a1 * C.NumberConc * Y.NumberConc";
		VariableReferenceList
			[ C Variable:/Cell:C -1 ]
			[ Y Variable:/Cell:Y -1 ]
			[ Z Variable:/Cell:Z 1  ];
	}
	
	Process ExpressionFluxProcess( reaction9 )
	{
		Name	reaction9;
		a2	0.05;
		Expression	"a2 * Z.NumberConc";
		VariableReferenceList
			[ Z Variable:/Cell:Z -1 ]
			[ C Variable:/Cell:C 1  ]
			[ Y Variable:/Cell:Y 1  ];
	}
	
	Process ExpressionFluxProcess( reaction10 )
	{
		Name	"desinhibition of cyclin";
		alpha	0.1;
		d1	0.05;
		Expression	"alpha * d1 * Z.NumberConc";
		VariableReferenceList
			[ Z Variable:/Cell:Z -1 ]
			[ C Variable:/Cell:C 1  ];
	}
	
	Process ExpressionFluxProcess( reaction11 )
	{
		Name	"degradation of inhibited cyclin";
		kd	0.02;
		alpha	0.1;
		Expression	"alpha * kd * Z.NumberConc";
		VariableReferenceList
			[ Z Variable:/Cell:Z -1 ]
			[ Y Variable:/Cell:Y 1  ];
	}
	
	Process ExpressionFluxProcess( reaction12 )
	{
		Name	"creation of cyclin inhibitor";
		vs	0.2;
		Expression	vs;
		VariableReferenceList
			[ Y Variable:/Cell:Y 1 ];
	}
	
	Process ExpressionFluxProcess( reaction13 )
	{
		Name	"degradation of cyclin inhibitor";
		d1	0.05;
		Expression	"d1 * Y.NumberConc";
		VariableReferenceList
			[ Y Variable:/Cell:Y -1 ];
	}
	
	
}

System System( /Cell )
{
	StepperID	Default;
	Name	Cell;

	Variable Variable( Dimensions )
	{
		Value	3;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Fixed	1;
	}
	
	Variable Variable( C )
	{
		Name	cyclin;
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( X )
	{
		Name	protease;
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( M )
	{
		Name	cdc2k;
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( Y )
	{
		Name	"cyclin inhibitor";
		Value	1.0;
		Fixed	0;
	}
	
	Variable Variable( Z )
	{
		Name	"complex inhibitor-cyclin";
		Value	1.0;
		Fixed	0;
	}
	
	
}

System System( /SBMLParameter )
{
	StepperID	Default;
	Name	"Global Parameter";

	Variable Variable( V1 )
	{
		Name	V1;
		Value	0.0;
	}
	
	Variable Variable( K6 )
	{
		Name	K6;
		Value	0.3;
		Fixed	1;
	}
	
	Variable Variable( V1p )
	{
		Name	V1p;
		Value	0.75;
		Fixed	1;
	}
	
	Variable Variable( V3 )
	{
		Name	V3;
		Value	0.0;
	}
	
	Variable Variable( V3p )
	{
		Name	V3p;
		Value	0.3;
		Fixed	1;
	}
	
	
}

System System( /SBMLRule )
{
	Name	"System for SBML Rule";
	StepperID	Default;

	Process ExpressionAssignmentProcess( Assignment_V1 )
	{
		StepperID	Default;
		Name	"Assignment rule for 'V1'";
		Expression	"C.NumberConc * V1p.NumberConc * pow(C.NumberConc + K6.NumberConc, -1)";
		VariableReferenceList
			[ V1  Variable:/SBMLParameter:V1  1 ]
			[ C   Variable:/Cell:C            0 ]
			[ V1p Variable:/SBMLParameter:V1p 0 ]
			[ K6  Variable:/SBMLParameter:K6  0 ];
	}
	
	Process ExpressionAssignmentProcess( Assignment_V3 )
	{
		StepperID	Default;
		Name	"Assignment rule for 'V3'";
		Expression	"M.NumberConc * V3p.NumberConc";
		VariableReferenceList
			[ V3  Variable:/SBMLParameter:V3  1 ]
			[ M   Variable:/Cell:M            0 ]
			[ V3p Variable:/SBMLParameter:V3p 0 ];
	}
	
	
}

