
# created by eml2em program
# from file: BIOMD0000000135.eml, date: Mon Dec 16 22:55:29 2013
#
# BIOMD0000000135 - Izhikevich2004_SpikingNeurons_subthresholdOscillations
# 
# Izhikevich EM. 
# Which model to use for cortical spiking neurons? 
# IEEE Trans Neural Netw 2004 Sep; 15(5): 1063-1070 
# The Neurosciences Institute, San Diego, CA 92121, USA.


##### Steppers #####

Stepper FixedODE1Stepper( DE ) {}
# Stepper DiscreteTimeStepper( DT ) {}

##### Model Entities #####

System System( / )
{
	StepperID	DE;
	Name	Default;
}

System System( /cell )
{
	StepperID	DE;

	Variable Variable( Dimensions )
	{
		Value	3;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Fixed	1;
	}
	
	
}

System System( /SBMLParameter )
{
	StepperID	DE;
	Name	"Global Parameter";

	Variable Variable( a )
	{
		Value	0.05;
		Fixed	1;
	}
	
	Variable Variable( b )
	{
		Value	0.26;
		Fixed	1;
	}
	
	Variable Variable( c )
	{
		Value	-60.0;
		Fixed	1;
	}
	
	Variable Variable( d )
	{
		Value	0.0;
		Fixed	1;
	}
	
	Variable Variable( Vthresh )
	{
		Value	30.0;
		Fixed	1;
	}
	
	Variable Variable( i )
	{
		Value	0.0;
	}
	
	Variable Variable( v )
	{
		Value	-62.0;
	}
	
	Variable Variable( u )
	{
		Value	-16.12;
	}
	
	
}

System System( /SBMLRule )
{
	Name	"System for SBML Rule";
	StepperID	DE;

	Process ExpressionFluxProcess( Rule1 )
	{
		Expression	"P1.Value * (P2.Value * P3.Value - P0.Value)";
		VariableReferenceList	
			[ P0 Variable:/SBMLParameter:u 0 ]
			[ P1 Variable:/SBMLParameter:a 0 ]
			[ P2 Variable:/SBMLParameter:b 0 ]
			[ P3 Variable:/SBMLParameter:v 0 ];
	}
	
	Process ExpressionFluxProcess( Rule2 )
	{
		Expression	"0.04 * pow(P0.Value, 2) + 5 * P0.Value + 140 - P1.Value + P2.Value";
		VariableReferenceList	
			[ P0 Variable:/SBMLParameter:v 0 ]
			[ P1 Variable:/SBMLParameter:u 0 ]
			[ P2 Variable:/SBMLParameter:i 0 ];
	}
	
	
}

