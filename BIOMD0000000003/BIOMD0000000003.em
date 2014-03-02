
# created by eml2em program
# from file: BIOMD0000000003.eml, date: Sat Mar  1 16:30:28 2014
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
		vi	0.025;
		Expression	"cell.Value * vi";
		VariableReferenceList
			[ C    Variable:/cell:C    1 ]
			[ cell Variable:/cell:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( reaction2 )
	{
		Name	"default degradation of cyclin";
		kd	0.01;
		Expression	"C.NumberConc * cell.Value * kd";
		VariableReferenceList
			[ C    Variable:/cell:C    -1 ]
			[ cell Variable:/cell:SIZE 0  ];
	}
	
	Process ExpressionFluxProcess( reaction3 )
	{
		Name	"cdc2 kinase triggered degration of cyclin";
		vd	0.25;
		Kd	0.02;
		Expression	"C.NumberConc * cell.Value * vd * X.NumberConc * pow(C.NumberConc + Kd, -1)";
		VariableReferenceList
			[ C    Variable:/cell:C    -1 ]
			[ X    Variable:/cell:X    0  ]
			[ cell Variable:/cell:SIZE 0  ];
	}
	
	Process ExpressionFluxProcess( reaction4 )
	{
		Name	"activation of cdc2 kinase";
		K1	0.005;
		Expression	"cell.Value * (1 + -1 * M.NumberConc) * V1.Value * pow(K1 + -1 * M.NumberConc + 1, -1)";
		VariableReferenceList
			[ M    Variable:/cell:M           1 ]
			[ cell Variable:/cell:SIZE        0 ]
			[ V1   Variable:/SBMLParameter:V1 0 ];
	}
	
	Process ExpressionFluxProcess( reaction5 )
	{
		Name	"deactivation of cdc2 kinase";
		V2	1.5;
		K2	0.005;
		Expression	"cell.Value * M.NumberConc * V2 * pow(K2 + M.NumberConc, -1)";
		VariableReferenceList
			[ M    Variable:/cell:M    -1 ]
			[ cell Variable:/cell:SIZE 0  ];
	}
	
	Process ExpressionFluxProcess( reaction6 )
	{
		Name	"activation of cyclin protease";
		K3	0.005;
		Expression	"cell.Value * V3.Value * (1 + -1 * X.NumberConc) * pow(K3 + -1 * X.NumberConc + 1, -1)";
		VariableReferenceList
			[ X    Variable:/cell:X           1 ]
			[ cell Variable:/cell:SIZE        0 ]
			[ V3   Variable:/SBMLParameter:V3 0 ];
	}
	
	Process ExpressionFluxProcess( reaction7 )
	{
		Name	"deactivation of cyclin protease";
		K4	0.005;
		V4	0.5;
		Expression	"cell.Value * V4 * X.NumberConc * pow(K4 + X.NumberConc, -1)";
		VariableReferenceList
			[ X    Variable:/cell:X    -1 ]
			[ cell Variable:/cell:SIZE 0  ];
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
	
	Variable Variable( C )
	{
		Name	Cyclin;
		NumberConc	0.01;
		Fixed	0;
	}
	
	Variable Variable( M )
	{
		Name	"CDC-2 Kinase";
		NumberConc	0.01;
		Fixed	0;
	}
	
	Variable Variable( X )
	{
		Name	"Cyclin Protease";
		NumberConc	0.01;
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
		Value	0.0588235294118;
	}
	
	Variable Variable( V3 )
	{
		Name	V3;
		Value	0.01;
	}
	
	Variable Variable( VM1 )
	{
		Name	VM1;
		Value	3.0;
		Fixed	1;
	}
	
	Variable Variable( VM3 )
	{
		Name	VM3;
		Value	1.0;
		Fixed	1;
	}
	
	Variable Variable( Kc )
	{
		Name	Kc;
		Value	0.5;
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
		Expression	"C.NumberConc * VM1.NumberConc * pow(C.NumberConc + Kc.NumberConc, -1)";
		VariableReferenceList
			[ V1  Variable:/SBMLParameter:V1  1 ]
			[ C   Variable:/cell:C            0 ]
			[ VM1 Variable:/SBMLParameter:VM1 0 ]
			[ Kc  Variable:/SBMLParameter:Kc  0 ];
	}
	
	Process ExpressionAssignmentProcess( Assignment_V3 )
	{
		StepperID	Default;
		Name	"Assignment rule for 'V3'";
		Expression	"M.NumberConc * VM3.NumberConc";
		VariableReferenceList
			[ V3  Variable:/SBMLParameter:V3  1 ]
			[ M   Variable:/cell:M            0 ]
			[ VM3 Variable:/SBMLParameter:VM3 0 ];
	}
	
	
}

