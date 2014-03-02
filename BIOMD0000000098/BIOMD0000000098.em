
# created by eml2em program
# from file: BIOMD0000000098.eml, date: Sun Mar  2 01:32:20 2014
#

Stepper ODEStepper( Default )
{
	# no property
}

System System( / )
{
	StepperID	Default;
	Name	default;

	Process ExpressionFluxProcess( R0 )
	{
		Name	"Ca influx";
		Expression	"cytosol.Value * v0.Value";
		VariableReferenceList
			[ Z       Variable:/cytosol:Z        1 ]
			[ cytosol Variable:/cytosol:SIZE     0 ]
			[ v0      Variable:/SBMLParameter:v0 0 ];
	}
	
	Process ExpressionFluxProcess( R1 )
	{
		Name	"InsP3 dependent Ca influx";
		Expression	"cytosol.Value * v1.Value * beta.Value";
		VariableReferenceList
			[ Z       Variable:/cytosol:Z          1 ]
			[ cytosol Variable:/cytosol:SIZE       0 ]
			[ v1      Variable:/SBMLParameter:v1   0 ]
			[ beta    Variable:/SBMLParameter:beta 0 ];
	}
	
	Process ExpressionFluxProcess( R2 )
	{
		Name	"ATP driven Ca pumping into store";
		Expression	"cytosol.Value * (Vm2.Value * pow(Z.NumberConc, n.Value) / (pow(K2.Value, n.Value) + pow(Z.NumberConc, n.Value)))";
		VariableReferenceList
			[ Z       Variable:/cytosol:Z         -1 ]
			[ Y       Variable:/store:Y           1  ]
			[ cytosol Variable:/cytosol:SIZE      0  ]
			[ Vm2     Variable:/SBMLParameter:Vm2 0  ]
			[ n       Variable:/SBMLParameter:n   0  ]
			[ K2      Variable:/SBMLParameter:K2  0  ];
	}
	
	Process ExpressionFluxProcess( R3 )
	{
		Name	"ATP driven pumping into cytosol";
		Expression	"store.Value * (Vm3.Value * pow(Y.NumberConc, m.Value) * pow(Z.NumberConc, p.Value) / ((pow(Kr.Value, m.Value) + pow(Y.NumberConc, m.Value)) * (pow(Ka.Value, p.Value) + pow(Z.NumberConc, p.Value))))";
		VariableReferenceList
			[ Y     Variable:/store:Y           -1 ]
			[ Z     Variable:/cytosol:Z         1  ]
			[ store Variable:/store:SIZE        0  ]
			[ Vm3   Variable:/SBMLParameter:Vm3 0  ]
			[ m     Variable:/SBMLParameter:m   0  ]
			[ p     Variable:/SBMLParameter:p   0  ]
			[ Kr    Variable:/SBMLParameter:Kr  0  ]
			[ Ka    Variable:/SBMLParameter:Ka  0  ];
	}
	
	Process ExpressionFluxProcess( Rf )
	{
		Name	"Ca leak";
		Expression	"store.Value * kf.Value * Y.NumberConc";
		VariableReferenceList
			[ Y     Variable:/store:Y          -1 ]
			[ Z     Variable:/cytosol:Z        1  ]
			[ store Variable:/store:SIZE       0  ]
			[ kf    Variable:/SBMLParameter:kf 0  ];
	}
	
	Process ExpressionFluxProcess( R_eff )
	{
		Name	"Ca efflux";
		Expression	"cytosol.Value * k.Value * Z.NumberConc";
		VariableReferenceList
			[ Z       Variable:/cytosol:Z       -1 ]
			[ cytosol Variable:/cytosol:SIZE    0  ]
			[ k       Variable:/SBMLParameter:k 0  ];
	}
	
	
}

System System( /cytosol )
{
	StepperID	Default;
	Name	cytosol;

	Variable Variable( Dimensions )
	{
		Value	3;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Fixed	1;
	}
	
	Variable Variable( Z )
	{
		NumberConc	0.15;
		Fixed	0;
	}
	
	
}

System System( /store )
{
	StepperID	Default;
	Name	store;

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
		NumberConc	1.6;
		Fixed	0;
	}
	
	
}

System System( /SBMLParameter )
{
	StepperID	Default;
	Name	"Global Parameter";

	Variable Variable( v0 )
	{
		Value	1.0;
		Fixed	1;
	}
	
	Variable Variable( v1 )
	{
		Value	7.3;
		Fixed	1;
	}
	
	Variable Variable( beta )
	{
		Value	0.301;
		Fixed	1;
	}
	
	Variable Variable( Vm2 )
	{
		Value	65.0;
		Fixed	1;
	}
	
	Variable Variable( n )
	{
		Value	2.0;
		Fixed	1;
	}
	
	Variable Variable( K2 )
	{
		Value	1.0;
		Fixed	1;
	}
	
	Variable Variable( Vm3 )
	{
		Value	500.0;
		Fixed	1;
	}
	
	Variable Variable( m )
	{
		Value	2.0;
		Fixed	1;
	}
	
	Variable Variable( Kr )
	{
		Value	2.0;
		Fixed	1;
	}
	
	Variable Variable( Ka )
	{
		Value	0.9;
		Fixed	1;
	}
	
	Variable Variable( kf )
	{
		Value	1.0;
		Fixed	1;
	}
	
	Variable Variable( k )
	{
		Value	10.0;
		Fixed	1;
	}
	
	Variable Variable( p )
	{
		Value	4.0;
		Fixed	1;
	}
	
	
}

