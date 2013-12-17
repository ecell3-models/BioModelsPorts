
# created by eml2em program
# from file: BIOMD0000000079.eml, date: Mon Dec 16 22:55:06 2013
#
# BIOMD0000000079 - Goldbeter2006_weightCycling
# 
# Goldbeter A. 
# A model for the dynamics of human weight cycling. 
# J. Biosci. 2006 Mar; 31(1): 129-136 
# Unite de Chronobiologie theorique, Faculte des Sciences, Universite Libre de Bruxelles, Campus Plaine, Brussels, Belgium.


##### Steppers #####

Stepper FixedODE1Stepper( DE ) {}
# Stepper DiscreteTimeStepper( DT ) {}

##### Model Entities #####

System System( / )
{
	StepperID	DE;
	Name	Default;

	Process ExpressionFluxProcess( reaction_0 )
	{
		Name	"Increase of  P";
		a	0.1;
		Expression	"body.Value * (a * C0.Value)";  ##  lambda(a, Q, a*Q) 
		VariableReferenceList	
			[ P0 Variable:/body:P 1 ]
			[ C0 Variable:/body:Q 0 ]
			[ body Variable:/body:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( reaction_1 )
	{
		Name	"Decrease of P";
		V	0.1;
		Km	0.2;
		Expression	"V*S0.Value/(Km+S0.Value)";   ###  function_1(V, P, Km) 
		VariableReferenceList	
			[ S0 Variable:/body:P -1 ];
	}
	
	Process ExpressionFluxProcess( reaction_2 )
	{
		Name	"Increase of Q";
		V1	1.0;
		K1	0.01;
		Expression	"V1*(1-P0.Value)/(K1+(1-P0.Value))";   ###  function_2(V1, Q, K1) 
		VariableReferenceList	
			[ P0 Variable:/body:Q 1 ];
	}
	
	Process ExpressionFluxProcess( reaction_3 )
	{
		Name	"Decrease of Q";
		V2	1.5;
		K2	0.01;
		Expression	"V2*C0.Value*S0.Value/(K2+S0.Value)";   ###  function_3(V2, R, Q, K2) 
		VariableReferenceList	
			[ S0 Variable:/body:Q -1 ]
			[ C0 Variable:/body:R 0 ];
	}
	
	Process ExpressionFluxProcess( reaction_4 )
	{
		Name	"Increase of R";
		V3	6.0;
		k3	0.01;
		Expression	"C0.Value*V3*(1-P0.Value)/(k3+(1-P0.Value))";   ###  function_4(P, V3, R, k3) 
		VariableReferenceList	
			[ P0 Variable:/body:R 1 ]
			[ C0 Variable:/body:P 0 ];
	}
	
	Process ExpressionFluxProcess( reaction_5 )
	{
		Name	"Decrease of R";
		V	2.5;
		Km	0.01;
		Expression	"V*S0.Value/(Km+S0.Value)";   ###  function_1(V, R, Km) 
		VariableReferenceList	
			[ S0 Variable:/body:R -1 ];
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

