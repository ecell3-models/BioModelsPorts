
# created by eml2em program
# from file: BIOMD0000000401.eml, date: Mon Dec 16 23:02:23 2013
#
# BIOMD0000000401 - Ayati2010_BoneRemodelingDynamics_NormalCondition
# 
# Ayati BP, Edwards CM, Webb GF, Wikswo JP. 
# A mathematical model of bone remodeling dynamics for normal bone cell populations and myeloma bone disease. 
# Biol. Direct 2010; 5: 28 
# Department of Mathematics, University of Iowa, Iowa City, IA 52242, USA.

##### Steppers #####

Stepper FixedODE1Stepper( DE ) {}
Stepper DiscreteTimeStepper( DT ) {}

##### Model Entities #####

System System( / )
{
	StepperID	DE;
	Name	Default;
}

System System( /Compartment )
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
	
	Variable Variable( C )
	{
		Name	Osteoclasts;
		Value	11.06;
		Fixed	0;
	}
	
	Variable Variable( B )
	{
		Name	Osteoblasts;
		Value	212.13;
		Fixed	0;
	}
	
	Variable Variable( z )
	{
		Name	BoneMass;
		Value	100.0;
		Fixed	0;
	}
	
	
}

System System( /SBMLParameter )
{
	StepperID	DE;
	Name	"Global Parameter";

	Variable Variable( y1 )
	{
		Name	maxC_Cbar;
		Value	11.059998473;  ## Calucrated
	}
	
	Variable Variable( y2 )
	{
		Name	maxB_Bbar;
		Value	212.130039997;  ## Calucrated
	}
	
	Variable Variable( C_bar )
	{
		Name	C_bar;
		Value	1.06066017178;  ## Calucrated
	}
	
	Variable Variable( B_bar )
	{
		Name	B_bar;
		Value	212.132034356;  ## Calucrated
	}
	
	Variable Variable( alpha1 )
	{
		Name	alpha1;
		Value	3.0;
		Fixed	1;
	}
	
	Variable Variable( beta1 )
	{
		Name	beta1;
		Value	0.2;
		Fixed	1;
	}
	
	Variable Variable( alpha2 )
	{
		Name	alpha2;
		Value	4.0;
		Fixed	1;
	}
	
	Variable Variable( beta2 )
	{
		Name	beta2;
		Value	0.02;
		Fixed	1;
	}
	
	Variable Variable( k1 )
	{
		Name	k1;
		Value	0.24;
		Fixed	1;
	}
	
	Variable Variable( k2 )
	{
		Name	k2;
		Value	0.0017;
		Fixed	1;
	}
	
	Variable Variable( g11 )
	{
		Name	g11;
		Value	0.5;
		Fixed	1;
	}
	
	Variable Variable( g21 )
	{
		Name	g21;
		Value	-0.5;
		Fixed	1;
	}
	
	Variable Variable( g12 )
	{
		Name	g12;
		Value	1.0;
		Fixed	1;
	}
	
	Variable Variable( g22 )
	{
		Name	g22;
		Value	0.0;
		Fixed	1;
	}
	
	Variable Variable( gamma )
	{
		Name	gamma;
		Value	-1.0;  ## Calucrated
	}
	
	
}

System System( /SBMLRule )
{
	Name	"System for SBML Rule";
	StepperID	DE;

	Process ExpressionFluxProcess( Rule1 )
	{
		Expression	"P0.Value * pow(V0.Value / Compartment.Value, P1.Value) * pow(V1.Value / Compartment.Value, P2.Value) - P3.Value * (V0.Value / Compartment.Value)";
		VariableReferenceList	
			[ V0 Variable:/Compartment:C 1 ]
			[ Compartment Variable:/Compartment:SIZE 0 ]
			[ P0 Variable:/SBMLParameter:alpha1 0 ]
			[ P1 Variable:/SBMLParameter:g11 0 ]
			[ V1 Variable:/Compartment:B 0 ]
			[ P2 Variable:/SBMLParameter:g21 0 ]
			[ P3 Variable:/SBMLParameter:beta1 0 ];
	}
	
	Process ExpressionFluxProcess( Rule2 )
	{
		Expression	"P0.Value * pow(V1.Value / Compartment.Value, P1.Value) * pow(V0.Value / Compartment.Value, P2.Value) - P3.Value * (V0.Value / Compartment.Value)";
		VariableReferenceList	
			[ V0 Variable:/Compartment:B 1 ]
			[ Compartment Variable:/Compartment:SIZE 0 ]
			[ P0 Variable:/SBMLParameter:alpha2 0 ]
			[ V1 Variable:/Compartment:C 0 ]
			[ P1 Variable:/SBMLParameter:g12 0 ]
			[ P2 Variable:/SBMLParameter:g22 0 ]
			[ P3 Variable:/SBMLParameter:beta2 0 ];
	}
	
	Process ExpressionFluxProcess( Rule3 )
	{
		Expression	"P0.Value * P1.Value - P2.Value * P3.Value";
		VariableReferenceList	
			[ V0 Variable:/Compartment:z 1 ]
			[ Compartment Variable:/Compartment:SIZE 0 ]
			[ P0 Variable:/SBMLParameter:k2 0 ]
			[ P1 Variable:/SBMLParameter:y2 0 ]
			[ P2 Variable:/SBMLParameter:k1 0 ]
			[ P3 Variable:/SBMLParameter:y1 0 ];
	}
	
	Process ExpressionAssignmentProcess( Rule4 )
	{
		StepperID	DT;
		Expression	"gt(C0.Value, C1.Value)* (C0.Value - C1.Value)";
		VariableReferenceList	
			[ C0 Variable:/Compartment:C 0 ]
			[ C1 Variable:/SBMLParameter:C_bar 0 ]
			[ P0 Variable:/SBMLParameter:y1 1 ];
	}
	
	Process ExpressionAssignmentProcess( Rule5 )
	{
		StepperID	DT;
		Expression	"gt(C0.Value, C1.Value)* (C0.Value - C1.Value)";
		VariableReferenceList	
			[ C0 Variable:/Compartment:B 0 ]
			[ C1 Variable:/SBMLParameter:B_bar 0 ]
			[ P0 Variable:/SBMLParameter:y2 1 ];
	}
	
	Process ExpressionAssignmentProcess( Rule6 )
	{
		StepperID	DT;
		Expression	"pow(P1.Value / P2.Value, (1 - P3.Value) / P4.Value) * pow(P5.Value / P6.Value, P7.Value / P4.Value)";
		VariableReferenceList	
			[ P0 Variable:/SBMLParameter:C_bar 1 ]
			[ P1 Variable:/SBMLParameter:beta1 0 ]
			[ P2 Variable:/SBMLParameter:alpha1 0 ]
			[ P3 Variable:/SBMLParameter:g22 0 ]
			[ P4 Variable:/SBMLParameter:gamma 0 ]
			[ P5 Variable:/SBMLParameter:beta2 0 ]
			[ P6 Variable:/SBMLParameter:alpha2 0 ]
			[ P7 Variable:/SBMLParameter:g21 0 ];
	}
	
	Process ExpressionAssignmentProcess( Rule7 )
	{
		StepperID	DT;
		Expression	"pow(P1.Value / P2.Value, P3.Value / P4.Value) * pow(P5.Value / P6.Value, (1 - P7.Value) / P4.Value)";
		VariableReferenceList	
			[ P0 Variable:/SBMLParameter:B_bar 1 ]
			[ P1 Variable:/SBMLParameter:beta1 0 ]
			[ P2 Variable:/SBMLParameter:alpha1 0 ]
			[ P3 Variable:/SBMLParameter:g12 0 ]
			[ P4 Variable:/SBMLParameter:gamma 0 ]
			[ P5 Variable:/SBMLParameter:beta2 0 ]
			[ P6 Variable:/SBMLParameter:alpha2 0 ]
			[ P7 Variable:/SBMLParameter:g11 0 ];
	}
	
	Process ExpressionAssignmentProcess( Rule8 )
	{
		StepperID	DT;
		Expression	"P1.Value * P2.Value - (1 - P3.Value) * (1 - P4.Value)";
		VariableReferenceList	
			[ P0 Variable:/SBMLParameter:gamma 1 ]
			[ P1 Variable:/SBMLParameter:g12 0 ]
			[ P2 Variable:/SBMLParameter:g21 0 ]
			[ P3 Variable:/SBMLParameter:g11 0 ]
			[ P4 Variable:/SBMLParameter:g22 0 ];
	}
	
	
}

