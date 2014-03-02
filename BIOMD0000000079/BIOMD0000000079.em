
# created by eml2em program
# from file: BIOMD0000000079.eml, date: Sun Mar  2 01:31:10 2014
#

Stepper ODEStepper( Default )
{
	# no property
}

System System( / )
{
	StepperID	Default;
	Name	default;

	Process ExpressionFluxProcess( reaction_0 )
	{
		Name	"Increase of  P";
		a	0.1;
		Expression	"body.Value * a * Q.NumberConc";
		VariableReferenceList
			[ P    Variable:/body:P    1 ]
			[ Q    Variable:/body:Q    0 ]
			[ body Variable:/body:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( reaction_1 )
	{
		Name	"Decrease of P";
		V	0.1;
		Km	0.2;
		Expression	"V * P.NumberConc / (Km + P.NumberConc)";
		VariableReferenceList
			[ P Variable:/body:P -1 ];
	}
	
	Process ExpressionFluxProcess( reaction_2 )
	{
		Name	"Increase of Q";
		V1	1.0;
		K1	0.01;
		Expression	"V1 * (1 - Q.NumberConc) / (K1 + (1 - Q.NumberConc))";
		VariableReferenceList
			[ Q Variable:/body:Q 1 ];
	}
	
	Process ExpressionFluxProcess( reaction_3 )
	{
		Name	"Decrease of Q";
		V2	1.5;
		K2	0.01;
		Expression	"V2 * R.NumberConc * Q.NumberConc / (K2 + Q.NumberConc)";
		VariableReferenceList
			[ Q Variable:/body:Q -1 ]
			[ R Variable:/body:R 0  ];
	}
	
	Process ExpressionFluxProcess( reaction_4 )
	{
		Name	"Increase of R";
		V3	6.0;
		k3	0.01;
		Expression	"P.NumberConc * V3 * (1 - R.NumberConc) / (k3 + (1 - R.NumberConc))";
		VariableReferenceList
			[ R Variable:/body:R 1 ]
			[ P Variable:/body:P 0 ];
	}
	
	Process ExpressionFluxProcess( reaction_5 )
	{
		Name	"Decrease of R";
		V	2.5;
		Km	0.01;
		Expression	"V * R.NumberConc / (Km + R.NumberConc)";
		VariableReferenceList
			[ R Variable:/body:R -1 ];
	}
	
	
}

System System( /body )
{
	StepperID	Default;
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
		NumberConc	0.43;
		Fixed	0;
	}
	
	Variable Variable( Q )
	{
		Name	Q;
		NumberConc	0.8;
		Fixed	0;
	}
	
	Variable Variable( R )
	{
		Name	R;
		NumberConc	0.55;
		Fixed	0;
	}
	
	
}

