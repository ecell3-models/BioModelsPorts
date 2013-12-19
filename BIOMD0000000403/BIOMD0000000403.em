
# created by eml2em program
# from file: BIOMD0000000403.eml, date: Mon Dec 16 23:02:32 2013
#
# BIOMD0000000403 - Ayati2010_BoneRemodelingDynamics_WithTumour+DrugTreatment
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
	
	Variable Variable( time )
	{
		Value	0.0;
	}

	Process ExpressionFluxProcess( clock )
	{
		Expression	"1.0";
		VariableReferenceList	
			[ P0 Variable:.:time 1 ];
	}

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
		Value	13.0;
		Fixed	0;
	}
	
	Variable Variable( B )
	{
		Name	Osteoblasts;
		Value	300.0;
		Fixed	0;
	}
	
	Variable Variable( z )
	{
		Name	BoneMass;
		Value	100.0;
		Fixed	0;
	}
	
	Variable Variable( Tumour )
	{
		Name	Tumour;
		Value	1.0;
		Fixed	0;
	}
	
	
}

System System( /SBMLParameter )
{
	StepperID	DE;
	Name	"Global Parameter";

	Variable Variable( y1 )
	{
		Name	y1;
		Value	13.0003104462;  ## Calcurated
	}
	
	Variable Variable( y2 )
	{
		Name	y2;
		Value	300.045410177;  ## Calcurated
	}
	
	Variable Variable( C_bar )
	{
		Name	C_bar;
		Value	4.99380996157;  ## Calcurated
	}
	
	Variable Variable( B_bar )
	{
		Name	B_bar;
		Value	315.901488672;  ## Calcurated
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
		Value	0.0748;
		Fixed	1;
	}
	
	Variable Variable( k2 )
	{
		Name	k2;
		Value	0.0006395;
		Fixed	1;
	}
	
	Variable Variable( g11 )
	{
		Name	g11;
		Value	1.1;
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
		Value	-0.3734;  ## Calcurated
	}
	
	Variable Variable( gammaT )
	{
		Name	gammaT;
		Value	0.005;
		Fixed	1;
	}
	
	Variable Variable( LT )
	{
		Name	LT;
		Value	100.0;
		Fixed	1;
	}
	
	Variable Variable( r11 )
	{
		Name	r11;
		Value	0.005;
		Fixed	1;
	}
	
	Variable Variable( r21 )
	{
		Name	r21;
		Value	0.0;
		Fixed	1;
	}
	
	Variable Variable( r12 )
	{
		Name	r12;
		Value	0.0;
		Fixed	1;
	}
	
	Variable Variable( r22 )
	{
		Name	r22;
		Value	0.2;
		Fixed	1;
	}
	
	Variable Variable( V1 )
	{
		Name	V1;
		Value	0.0;
	}
	
	Variable Variable( V2 )
	{
		Name	V2;
		Value	0.0;
	}
	
	Variable Variable( v1 )
	{
		Name	v1;
		Value	0.001;
		Fixed	1;
	}
	
	Variable Variable( v2 )
	{
		Name	v2;
		Value	0.008;
		Fixed	1;
	}
	
	
}

System System( /SBMLRule )
{
	Name	"System for SBML Rule";
	StepperID	DE;

	Process ExpressionFluxProcess( Rule1 )
	{
		Expression	"P0.Value * pow(V0.Value / Compartment.Value, P1.Value * (1 + P2.Value * (V1.Value / Compartment.Value) / P3.Value)) * pow(V2.Value / Compartment.Value, P4.Value * (1 + P5.Value * (V1.Value / Compartment.Value) / P3.Value)) - P6.Value * (V0.Value / Compartment.Value)";
		VariableReferenceList	
			[ V0 Variable:/Compartment:C 1 ]
			[ Compartment Variable:/Compartment:SIZE 0 ]
			[ P0 Variable:/SBMLParameter:alpha1 0 ]
			[ P1 Variable:/SBMLParameter:g11 0 ]
			[ P2 Variable:/SBMLParameter:r11 0 ]
			[ V1 Variable:/Compartment:Tumour 0 ]
			[ P3 Variable:/SBMLParameter:LT 0 ]
			[ V2 Variable:/Compartment:B 0 ]
			[ P4 Variable:/SBMLParameter:g21 0 ]
			[ P5 Variable:/SBMLParameter:r21 0 ]
			[ P6 Variable:/SBMLParameter:beta1 0 ];
	}
	
	Process ExpressionFluxProcess( Rule2 )
	{
		Expression	"P0.Value * pow(V1.Value / Compartment.Value, P1.Value / (1 + P2.Value * (V2.Value / Compartment.Value) / P3.Value)) * pow(V0.Value / Compartment.Value, P4.Value - P5.Value * (V2.Value / Compartment.Value) / P3.Value) - (P6.Value - P7.Value) * (V0.Value / Compartment.Value)";
		VariableReferenceList	
			[ V0 Variable:/Compartment:B 1 ]
			[ Compartment Variable:/Compartment:SIZE 0 ]
			[ P0 Variable:/SBMLParameter:alpha2 0 ]
			[ V1 Variable:/Compartment:C 0 ]
			[ P1 Variable:/SBMLParameter:g12 0 ]
			[ P2 Variable:/SBMLParameter:r12 0 ]
			[ V2 Variable:/Compartment:Tumour 0 ]
			[ P3 Variable:/SBMLParameter:LT 0 ]
			[ P4 Variable:/SBMLParameter:g22 0 ]
			[ P5 Variable:/SBMLParameter:r22 0 ]
			[ P6 Variable:/SBMLParameter:beta2 0 ]
			[ P7 Variable:/SBMLParameter:V1 0 ];
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
		Expression	"pow(P1.Value / P2.Value, (1 - P3.Value + P4.Value) / P5.Value) * pow(P6.Value / P7.Value, P8.Value * (1 + P9.Value) / P5.Value)";
		VariableReferenceList	
			[ P0 Variable:/SBMLParameter:C_bar 1 ]
			[ P1 Variable:/SBMLParameter:beta1 0 ]
			[ P2 Variable:/SBMLParameter:alpha1 0 ]
			[ P3 Variable:/SBMLParameter:g22 0 ]
			[ P4 Variable:/SBMLParameter:r22 0 ]
			[ P5 Variable:/SBMLParameter:gamma 0 ]
			[ P6 Variable:/SBMLParameter:beta2 0 ]
			[ P7 Variable:/SBMLParameter:alpha2 0 ]
			[ P8 Variable:/SBMLParameter:g21 0 ]
			[ P9 Variable:/SBMLParameter:r21 0 ];
	}
	
	Process ExpressionAssignmentProcess( Rule7 )
	{
		StepperID	DT;
		Expression	"pow(P1.Value / P2.Value, P3.Value / (1 + P4.Value) / P5.Value) * pow(P6.Value / P7.Value, (1 - P8.Value * (1 + P9.Value)) / P5.Value)";
		VariableReferenceList	
			[ P0 Variable:/SBMLParameter:B_bar 1 ]
			[ P1 Variable:/SBMLParameter:beta1 0 ]
			[ P2 Variable:/SBMLParameter:alpha1 0 ]
			[ P3 Variable:/SBMLParameter:g12 0 ]
			[ P4 Variable:/SBMLParameter:r12 0 ]
			[ P5 Variable:/SBMLParameter:gamma 0 ]
			[ P6 Variable:/SBMLParameter:beta2 0 ]
			[ P7 Variable:/SBMLParameter:alpha2 0 ]
			[ P8 Variable:/SBMLParameter:g11 0 ]
			[ P9 Variable:/SBMLParameter:r11 0 ];
	}
	
	Process ExpressionAssignmentProcess( Rule8 )
	{
		StepperID	DT;
		Expression	"P1.Value / (1 + P2.Value) * P3.Value * (1 + P4.Value) - (1 - P5.Value * (1 + P6.Value)) * (1 - P7.Value + P8.Value)";
		VariableReferenceList	
			[ P0 Variable:/SBMLParameter:gamma 1 ]
			[ P1 Variable:/SBMLParameter:g12 0 ]
			[ P2 Variable:/SBMLParameter:r12 0 ]
			[ P3 Variable:/SBMLParameter:g21 0 ]
			[ P4 Variable:/SBMLParameter:r21 0 ]
			[ P5 Variable:/SBMLParameter:g11 0 ]
			[ P6 Variable:/SBMLParameter:r11 0 ]
			[ P7 Variable:/SBMLParameter:g22 0 ]
			[ P8 Variable:/SBMLParameter:r22 0 ];
	}
	
	Process ExpressionFluxProcess( Rule9 )
	{
		Expression	"(P0.Value - P1.Value) * (V0.Value / Compartment.Value) * log(P2.Value / (V0.Value / Compartment.Value))";
		VariableReferenceList	
			[ V0 Variable:/Compartment:Tumour 1 ]
			[ Compartment Variable:/Compartment:SIZE 0 ]
			[ P0 Variable:/SBMLParameter:gammaT 0 ]
			[ P1 Variable:/SBMLParameter:V2 0 ]
			[ P2 Variable:/SBMLParameter:LT 0 ];
	}
	
	Process ExpressionAssignmentProcess( Rule10 )
	{
		StepperID	DT;
		Expression	"geq(time.Value, 600.0) * V1.Value";
		VariableReferenceList	
			[ V0 Variable:/SBMLParameter:V1 1 ]
			[ V1 Variable:/SBMLParameter:v1 0 ]
			[ time Variable:/:time 0 ];
	}
	
	Process ExpressionAssignmentProcess( Rule11 )
	{
		StepperID	DT;
		Expression	"geq(time.Value, 600.0) * V1.Value";
		VariableReferenceList	
			[ V0 Variable:/SBMLParameter:V2 1 ]
			[ V1 Variable:/SBMLParameter:v2 0 ]
			[ time Variable:/:time 0 ];
	}

}

