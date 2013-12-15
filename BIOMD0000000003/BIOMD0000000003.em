
# created by eml2em program
# from file: BIOMD0000000003.eml, date: Sun Dec 15 15:39:00 2013
#
# BIOMD0000000003 - Goldbeter1991 - Min Mit Oscil
# 
# Goldbeter A. 
# A minimal cascade model for the mitotic oscillator involving cyclin and cdc2 kinase. 
# Proc. Natl. Acad. Sci. U.S.A. 1991 Oct; 88(20): 9107-9111 
# Faculté des Sciences, Université Libre de Bruxelles, Belgium.


##### Steppers #####

Stepper FixedODE1Stepper( DE ) {}
Stepper DiscreteTimeStepper( DT ) {}

##### Model Entities #####

System System( / )
{
	StepperID	DE;
	Name	Default;

	Process ExpressionFluxProcess( reaction1 )
	{
		Name	"creation of cyclin";
		vi	0.025;
		Expression	"cell.Value * vi";
		VariableReferenceList	
			[ P0 Variable:/cell:C 1 ]
			[ cell Variable:/cell:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( reaction2 )
	{
		Name	"default degradation of cyclin";
		kd	0.01;
		Expression	"S0.Value / cell.Value * cell.Value * kd";
		VariableReferenceList	
			[ S0 Variable:/cell:C -1 ]
			[ cell Variable:/cell:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( reaction3 )
	{
		Name	"cdc2 kinase triggered degration of cyclin";
		vd	0.25;
		Kd	0.02;
		Expression	"S0.Value / cell.Value * cell.Value * vd * (C0.Value / cell.Value) * pow(S0.Value / cell.Value + Kd, -1)";
		VariableReferenceList	
			[ S0 Variable:/cell:C -1 ]
			[ C0 Variable:/cell:X 0 ]
			[ cell Variable:/cell:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( reaction4 )
	{
		Name	"activation of cdc2 kinase";
		K1	0.005;
		Expression	"cell.Value * (1 + -1 * (P0.Value / cell.Value)) * Param0.Value * pow(K1 + -1 * (P0.Value / cell.Value) + 1, -1)";
		VariableReferenceList	
			[ P0 Variable:/cell:M 1 ]
			[ cell Variable:/cell:SIZE 0 ]
			[ Param0 Variable:/SBMLParameter:V1 0 ];
	}
	
	Process ExpressionFluxProcess( reaction5 )
	{
		Name	"deactivation of cdc2 kinase";
		V2	1.5;
		K2	0.005;
		Expression	"cell.Value * (S0.Value / cell.Value) * V2 * pow(K2 + S0.Value / cell.Value, -1)";
		VariableReferenceList	
			[ S0 Variable:/cell:M -1 ]
			[ cell Variable:/cell:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( reaction6 )
	{
		Name	"activation of cyclin protease";
		K3	0.005;
		Expression	"cell.Value * Param0.Value * (1 + -1 * (P0.Value / cell.Value)) * pow(K3 + -1 * (P0.Value / cell.Value) + 1, -1)";
		VariableReferenceList	
			[ P0 Variable:/cell:X 1 ]
			[ cell Variable:/cell:SIZE 0 ]
			[ Param0 Variable:/SBMLParameter:V3 0 ];
	}
	
	Process ExpressionFluxProcess( reaction7 )
	{
		Name	"deactivation of cyclin protease";
		K4	0.005;
		V4	0.5;
		Expression	"cell.Value * V4 * (S0.Value / cell.Value) * pow(K4 + S0.Value / cell.Value, -1)";
		VariableReferenceList	
			[ S0 Variable:/cell:X -1 ]
			[ cell Variable:/cell:SIZE 0 ];
	}
	
	
}

System System( /cell )
{
	StepperID	DE;
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
		Value	0.01;
		Fixed	0;
	}
	
	Variable Variable( M )
	{
		Name	"CDC-2 Kinase";
		Value	0.01;
		Fixed	0;
	}
	
	Variable Variable( X )
	{
		Name	"Cyclin Protease";
		Value	0.01;
		Fixed	0;
	}
	
	
}

System System( /SBMLParameter )
{
	StepperID	DE;
	Name	"Global Parameter";

	Variable Variable( V1 )
	{
		Name	V1;
		Value	0.0589623156345;  # Cyclin*VM1*(Cyclin+Kc)^(-1) = V1
	}
	
	Variable Variable( V3 )
	{
		Name	V3;
		Value	0.009;  # CDC-2 Kinase*VM3 = V3
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
	StepperID	DT;

	Process ExpressionAssignmentProcess( Rule1 )
	{
		Expression	"V0.Value / cell.Value * P1.Value * pow(V0.Value / cell.Value + P2.Value, -1)";
		VariableReferenceList	
			[ P0 Variable:/SBMLParameter:V1 1 ]
			[ V0 Variable:/cell:C 0 ]
			[ cell Variable:/cell:SIZE 0 ]
			[ P1 Variable:/SBMLParameter:VM1 0 ]
			[ P2 Variable:/SBMLParameter:Kc 0 ];
	}
	
	Process ExpressionAssignmentProcess( Rule2 )
	{
		Expression	"V0.Value / cell.Value * P1.Value";
		VariableReferenceList	
			[ P0 Variable:/SBMLParameter:V3 1 ]
			[ V0 Variable:/cell:M 0 ]
			[ cell Variable:/cell:SIZE 0 ]
			[ P1 Variable:/SBMLParameter:VM3 0 ];
	}
	
	
}

