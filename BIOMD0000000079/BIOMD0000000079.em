
# created by eml2em program
# from file: ../BIOMD0000000079/BIOMD0000000079.eml, date: Mon Dec 16 22:55:06 2013
#

Stepper ODEStepper( DE )
{
	# no property
}

System System( / )
{
	StepperID	DE;
	Name	Default;

	Process ExpressionFluxProcess( reaction_0 )
	{
		Name	"Increase of  P";
		a	0.1;
		Expression	"body.Value * function_0(a, C0.Value / body.Value)";
		VariableReferenceList	[ P0 Variable:/body:P 1 ] [ C0 Variable:/body:Q 0 ] [ body Variable:/body:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( reaction_1 )
	{
		Name	"Decrease of P";
		V	0.1;
		Km	0.2;
		Expression	None;
		VariableReferenceList	[ S0 Variable:/body:P -1 ];
	}
	
	Process ExpressionFluxProcess( reaction_2 )
	{
		Name	"Increase of Q";
		V1	1.0;
		K1	0.01;
		Expression	None;
		VariableReferenceList	[ P0 Variable:/body:Q 1 ];
	}
	
	Process ExpressionFluxProcess( reaction_3 )
	{
		Name	"Decrease of Q";
		V2	1.5;
		K2	0.01;
		Expression	None;
		VariableReferenceList	[ S0 Variable:/body:Q -1 ] [ C0 Variable:/body:R 0 ];
	}
	
	Process ExpressionFluxProcess( reaction_4 )
	{
		Name	"Increase of R";
		V3	6.0;
		k3	0.01;
		Expression	None;
		VariableReferenceList	[ P0 Variable:/body:R 1 ] [ C0 Variable:/body:P 0 ];
	}
	
	Process ExpressionFluxProcess( reaction_5 )
	{
		Name	"Decrease of R";
		V	2.5;
		Km	0.01;
		Expression	None;
		VariableReferenceList	[ S0 Variable:/body:R -1 ];
	}
	
	
}

System System( /body )
{
	StepperID	DE;
	Name	body;

	Variable Variable( Dimensions )
	{
		Value	3;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Fixed	1;
	}
	
	Variable Variable( P )
	{
		Name	P;
		Value	0.43;
		Fixed	0;
	}
	
	Variable Variable( Q )
	{
		Name	Q;
		Value	0.8;
		Fixed	0;
	}
	
	Variable Variable( R )
	{
		Name	R;
		Value	0.55;
		Fixed	0;
	}
	
	
}

