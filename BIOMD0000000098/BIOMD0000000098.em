
# created by eml2em program
# from file: ../BIOMD0000000098/BIOMD0000000098.eml, date: Mon Dec 16 22:55:14 2013
#

Stepper ODEStepper( DE )
{
	# no property
}

System System( / )
{
	StepperID	DE;
	Name	Default;

	Process ExpressionFluxProcess( R0 )
	{
		Name	"Ca influx";
		Expression	"cytosol.Value * Param0.Value";
		VariableReferenceList	[ P0 Variable:/cytosol:Z 1 ] [ cytosol Variable:/cytosol:SIZE 0 ] [ Param0 Variable:/SBMLParameter:v0 0 ];
	}
	
	Process ExpressionFluxProcess( R1 )
	{
		Name	"InsP3 dependent Ca influx";
		Expression	"cytosol.Value * Param0.Value * Param1.Value";
		VariableReferenceList	[ P0 Variable:/cytosol:Z 1 ] [ cytosol Variable:/cytosol:SIZE 0 ] [ Param0 Variable:/SBMLParameter:v1 0 ] [ Param1 Variable:/SBMLParameter:beta 0 ];
	}
	
	Process ExpressionFluxProcess( R2 )
	{
		Name	"ATP driven Ca pumping into store";
		Expression	"cytosol.Value * (Param0.Value * pow(S0.Value / cytosol.Value, Param1.Value) / (pow(Param2.Value, Param1.Value) + pow(S0.Value / cytosol.Value, Param1.Value)))";
		VariableReferenceList	[ S0 Variable:/cytosol:Z -1 ] [ P0 Variable:/store:Y 1 ] [ cytosol Variable:/cytosol:SIZE 0 ] [ Param0 Variable:/SBMLParameter:Vm2 0 ] [ Param1 Variable:/SBMLParameter:n 0 ] [ Param2 Variable:/SBMLParameter:K2 0 ];
	}
	
	Process ExpressionFluxProcess( R3 )
	{
		Name	"ATP driven pumping into cytosol";
		Expression	"store.Value * (Param0.Value * pow(S0.Value / store.Value, Param1.Value) * pow(P0.Value / store.Value, Param2.Value) / ((pow(Param3.Value, Param1.Value) + pow(S0.Value / store.Value, Param1.Value)) * (pow(Param4.Value, Param2.Value) + pow(P0.Value / store.Value, Param2.Value))))";
		VariableReferenceList	[ S0 Variable:/store:Y -1 ] [ P0 Variable:/cytosol:Z 1 ] [ store Variable:/store:SIZE 0 ] [ Param0 Variable:/SBMLParameter:Vm3 0 ] [ Param1 Variable:/SBMLParameter:m 0 ] [ Param2 Variable:/SBMLParameter:p 0 ] [ Param3 Variable:/SBMLParameter:Kr 0 ] [ Param4 Variable:/SBMLParameter:Ka 0 ];
	}
	
	Process ExpressionFluxProcess( Rf )
	{
		Name	"Ca leak";
		Expression	"store.Value * Param0.Value * (S0.Value / store.Value)";
		VariableReferenceList	[ S0 Variable:/store:Y -1 ] [ P0 Variable:/cytosol:Z 1 ] [ store Variable:/store:SIZE 0 ] [ Param0 Variable:/SBMLParameter:kf 0 ];
	}
	
	Process ExpressionFluxProcess( R_eff )
	{
		Name	"Ca efflux";
		Expression	"cytosol.Value * Param0.Value * (S0.Value / cytosol.Value)";
		VariableReferenceList	[ S0 Variable:/cytosol:Z -1 ] [ cytosol Variable:/cytosol:SIZE 0 ] [ Param0 Variable:/SBMLParameter:k 0 ];
	}
	
	
}

System System( /cytosol )
{
	StepperID	DE;
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
		Value	0.15;
		Fixed	0;
	}
	
	
}

System System( /store )
{
	StepperID	DE;
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
		Value	1.6;
		Fixed	0;
	}
	
	
}

System System( /SBMLParameter )
{
	StepperID	DE;
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

