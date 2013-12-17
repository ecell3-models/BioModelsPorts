
# created by eml2em program
# from file: BIOMD0000000040.eml, date: Mon Dec 16 22:54:27 2013
#
# BIOMD0000000040 - Field1974_Oregonator
# 
# Richard J. Field, Richard M. Noyes 
# Oscillations in chemical systems. IV. Limit cycle behavior in a model of a real chemical reaction 
# J. Chem. Phys. 1974; 60(5): 1877-1884 
# Department of Chemistry, University of Oregon, Eugene, Oregon 97403


##### Steppers #####

Stepper FixedODE1Stepper( DE ) { StepInterval 2.0E-8; }
# Stepper DiscreteTimeStepper( DT ) {}

##### Model Entities #####
System System( / )
{
	StepperID	DE;
	Name	Default;

	Process ExpressionFluxProcess( Reaction1 )
	{
		Name	M1;
		k1	1.34;
		Expression	"S0.Value / BZ.Value * (S1.Value / BZ.Value) * k1 * BZ.Value";
		VariableReferenceList	
			[ S0 Variable:/BZ:Br -1 ]
			[ S1 Variable:/BZ:BrO3 0 ]
			[ P0 Variable:/BZ:HBrO2 1 ]
			[ P1 Variable:/BZ:HOBr 0 ]
			[ BZ Variable:/BZ:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( Reaction2 )
	{
		Name	M2;
		k2	1600000000.0;
		Expression	"S0.Value / BZ.Value * (S1.Value / BZ.Value) * k2 * BZ.Value";
		VariableReferenceList	
			[ S0 Variable:/BZ:Br -1 ]
			[ S1 Variable:/BZ:HBrO2 -1 ]
			[ P0 Variable:/BZ:HOBr 0 ]
			[ BZ Variable:/BZ:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( Reaction3 )
	{
		Name	M3;
		k3	8000.0;
		Expression	"S0.Value / BZ.Value * (P1.Value / BZ.Value) * k3 * BZ.Value";
		VariableReferenceList	
			[ S0 Variable:/BZ:BrO3 0 ]
			[ S1 Variable:/BZ:HBrO2 -1 ]
			[ P0 Variable:/BZ:Ce 1 ]
			[ P1 Variable:/BZ:HBrO2 2 ]
			[ BZ Variable:/BZ:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( Reaction4 )
	{
		Name	M4;
		k4	40000000.0;
		Expression	"pow(S0.Value / BZ.Value, 2) * k4 * BZ.Value";
		VariableReferenceList	
			[ S0 Variable:/BZ:HBrO2 -2 ]
			[ P0 Variable:/BZ:BrO3 0 ]
			[ P1 Variable:/BZ:HOBr 0 ]
			[ BZ Variable:/BZ:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( Reaction5 )
	{
		Name	M5;
		k5	1.0;
		Expression	"S0.Value / BZ.Value * k5 * BZ.Value";
		VariableReferenceList	
			[ S0 Variable:/BZ:Ce -1 ]
			[ P0 Variable:/BZ:Br 1 ]     ##### The stoichiometry is typically taken as 1/2 or 1.
			[ BZ Variable:/BZ:SIZE 0 ];
	}
	
	
}

System System( /BZ )
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
	
	Variable Variable( Br )
	{
		Name	"Br-";
		Value	1e-07;
		Fixed	0;
	}
	
	Variable Variable( BrO3 )
	{
		Name	"BrO3-";
		Value	0.06;
		Fixed	1;
	}
	
	Variable Variable( Ce )
	{
		Name	"Ce4+";
		Value	0.05;
		Fixed	0;
	}
	
	Variable Variable( HBrO2 )
	{
		Value	5e-11;
		Fixed	0;
	}
	
	Variable Variable( HOBr )
	{
		Value	0.0;
		Fixed	1;
	}
	
	
}

System System( /SBMLParameter )
{
	StepperID	DE;
	Name	"Global Parameter";

	Variable Variable( f )
	{
		Value	1.0;
		Fixed	1;
	}
	
	
}

