
# created by eml2em program
# from file: BIOMD0000000067.eml, date: Mon Dec 16 22:54:57 2013
#
# BIOMD0000000067 - Fung2005_Metabolic_Oscillator
# 
# Fung E, Wong WW, Suen JK, Bulter T, Lee SG, Liao JC. 
# A synthetic gene-metabolic oscillator. 
# Nature 2005 May; 435(7038): 118-122 
# Department of Chemical Engineering, University of California-Los Angeles, Los Angeles, California 90095, USA.


##### Steppers #####

Stepper FixedODE1Stepper( DE ) { StepInterval 1.0E-6; }
# Stepper DiscreteTimeStepper( DT ) {}

##### Model Entities #####

System System( / )
{
	StepperID	DE;
	Name	Default;

	Process ExpressionFluxProcess( V_gly )
	{
		Name	"Glycolytic flux";
		Expression	"compartment.Value * Param0.Value";
		VariableReferenceList	
			[ P0 Variable:/compartment:AcCoA 1 ]
			[ compartment Variable:/compartment:SIZE 0 ]
			[ Param0 Variable:/SBMLParameter:S0 0 ];
	}
	
	Process ExpressionFluxProcess( V_TCA )
	{
		Name	"Flux to TCA cycle";
		Expression	"compartment.Value * Param0.Value * (S0.Value / compartment.Value)";
		VariableReferenceList	
			[ S0 Variable:/compartment:AcCoA -1 ]
			[ compartment Variable:/compartment:SIZE 0 ]
			[ Param0 Variable:/SBMLParameter:kTCA 0 ];
	}
	
	Process ExpressionFluxProcess( V_out )
	{
		Name	"Intercellular transport of Acetate";
		Expression	"compartment.Value * Param0.Value * (S0.Value / compartment.Value - P0.Value / compartment.Value)";
		VariableReferenceList	
			[ S0 Variable:/compartment:HOAc -1 ]
			[ P0 Variable:/compartment:HOAc_E 1 ]
			[ compartment Variable:/compartment:SIZE 0 ]
			[ Param0 Variable:/SBMLParameter:k3 0 ];
	}
	
	Process ExpressionFluxProcess( V_Pta )
	{
		Name	"Phosphate acetyl transferase flux";
		Expression	"compartment.Value * Param0.Value * (C0.Value / compartment.Value) * (S0.Value / compartment.Value) / (Param1.Value + S0.Value / compartment.Value)";
		VariableReferenceList	
			[ S0 Variable:/compartment:AcCoA -1 ]
			[ P0 Variable:/compartment:AcP 1 ]
			[ C0 Variable:/compartment:Pta 0 ]
			[ compartment Variable:/compartment:SIZE 0 ]
			[ Param0 Variable:/SBMLParameter:k1 0 ]
			[ Param1 Variable:/SBMLParameter:KM1 0 ];
	}
	
	Process ExpressionFluxProcess( V_Ack )
	{
		Name	"Acetate kinase";
		Expression	"compartment.Value * (Param0.Value * (S0.Value / compartment.Value) - Param1.Value * (P0.Value / compartment.Value))";
		VariableReferenceList	
			[ S0 Variable:/compartment:AcP -1 ]
			[ P0 Variable:/compartment:OAc 1 ]
			[ compartment Variable:/compartment:SIZE 0 ]
			[ Param0 Variable:/SBMLParameter:kAck_f 0 ]
			[ Param1 Variable:/SBMLParameter:kAck_r 0 ];
	}
	
	Process ExpressionFluxProcess( V_Acs )
	{
		Name	"Acetyl-CoA synthase flux";
		Expression	"compartment.Value * Param0.Value * (C0.Value / compartment.Value) * (S0.Value / compartment.Value) / (Param1.Value + S0.Value / compartment.Value)";
		VariableReferenceList	
			[ S0 Variable:/compartment:OAc -1 ]
			[ P0 Variable:/compartment:AcCoA 1 ]
			[ C0 Variable:/compartment:Acs 0 ]
			[ compartment Variable:/compartment:SIZE 0 ]
			[ Param0 Variable:/SBMLParameter:k2 0 ]
			[ Param1 Variable:/SBMLParameter:KM2 0 ];
	}
	
	Process ExpressionFluxProcess( V_Ace )
	{
		Name	"Acid-base equilibrium";
		Expression	"compartment.Value * Param0.Value * (S0.Value / compartment.Value * Param1.Value - Param2.Value * (P0.Value / compartment.Value))";
		VariableReferenceList	
			[ S0 Variable:/compartment:OAc -1 ]
			[ P0 Variable:/compartment:HOAc 1 ]
			[ compartment Variable:/compartment:SIZE 0 ]
			[ Param0 Variable:/SBMLParameter:C 0 ]
			[ Param1 Variable:/SBMLParameter:H 0 ]
			[ Param2 Variable:/SBMLParameter:Keq 0 ];
	}
	
	Process ExpressionFluxProcess( R_LacI )
	{
		Name	"LacI synthesis";
		Expression	"compartment.Value * (Param0.Value * pow(C0.Value / compartment.Value / Param1.Value, Param2.Value) / (1 + pow(C0.Value / compartment.Value / Param1.Value, Param2.Value)) + Param3.Value)";
		VariableReferenceList	
			[ P0 Variable:/compartment:LacI 1 ]
			[ C0 Variable:/compartment:AcP 0 ]
			[ compartment Variable:/compartment:SIZE 0 ]
			[ Param0 Variable:/SBMLParameter:alpha1 0 ]
			[ Param1 Variable:/SBMLParameter:Kg1 0 ]
			[ Param2 Variable:/SBMLParameter:n 0 ]
			[ Param3 Variable:/SBMLParameter:alpha0 0 ];
	}
	
	Process ExpressionFluxProcess( R_Acs )
	{
		Name	"Acetyl-CoA synthase synthesis";
		Expression	"compartment.Value * (Param0.Value * pow(C0.Value / compartment.Value / Param1.Value, Param2.Value) / (1 + pow(C0.Value / compartment.Value / Param1.Value, Param2.Value)) + Param3.Value)";
		VariableReferenceList	
			[ P0 Variable:/compartment:Acs 1 ]
			[ C0 Variable:/compartment:AcP 0 ]
			[ compartment Variable:/compartment:SIZE 0 ]
			[ Param0 Variable:/SBMLParameter:alpha2 0 ]
			[ Param1 Variable:/SBMLParameter:Kg2 0 ]
			[ Param2 Variable:/SBMLParameter:n 0 ]
			[ Param3 Variable:/SBMLParameter:alpha0 0 ];
	}
	
	Process ExpressionFluxProcess( R_Pta )
	{
		Name	"Phosphate acetyl transferase synthase";
		Expression	"Param0.Value / (1 + pow(C0.Value / compartment.Value / Param1.Value, Param2.Value)) + Param3.Value";
		VariableReferenceList	
			[ P0 Variable:/compartment:Pta 1 ]
			[ C0 Variable:/compartment:LacI 0 ]
			[ Param0 Variable:/SBMLParameter:alpha3 0 ]
			[ compartment Variable:/compartment:SIZE 0 ]
			[ Param1 Variable:/SBMLParameter:Kg3 0 ]
			[ Param2 Variable:/SBMLParameter:n 0 ]
			[ Param3 Variable:/SBMLParameter:alpha0 0 ];
	}
	
	Process ExpressionFluxProcess( R_dLacI )
	{
		Name	"LacI degradation";
		Expression	"compartment.Value * Param0.Value * (S0.Value / compartment.Value)";
		VariableReferenceList	
			[ S0 Variable:/compartment:LacI -1 ]
			[ compartment Variable:/compartment:SIZE 0 ]
			[ Param0 Variable:/SBMLParameter:kd 0 ];
	}
	
	Process ExpressionFluxProcess( R_dAcs )
	{
		Name	"Acs degradation";
		Expression	"compartment.Value * Param0.Value * (S0.Value / compartment.Value)";
		VariableReferenceList	
			[ S0 Variable:/compartment:Acs -1 ]
			[ compartment Variable:/compartment:SIZE 0 ]
			[ Param0 Variable:/SBMLParameter:kd 0 ];
	}
	
	Process ExpressionFluxProcess( R_dPta )
	{
		Name	"Pta degradation";
		Expression	"compartment.Value * Param0.Value * (S0.Value / compartment.Value)";
		VariableReferenceList	
			[ S0 Variable:/compartment:Pta -1 ]
			[ compartment Variable:/compartment:SIZE 0 ]
			[ Param0 Variable:/SBMLParameter:kd 0 ];
	}
	
	
}

System System( /compartment )
{
	StepperID	DE;
	Name	Intracellular;

	Variable Variable( Dimensions )
	{
		Value	3;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Fixed	1;
	}
	
	Variable Variable( AcCoA )
	{
		Name	"Acetyl-CoA";
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( AcP )
	{
		Name	"Acetyl phosphate";
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( OAc )
	{
		Name	Acetate;
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( HOAc )
	{
		Name	"protonated acetate";
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( LacI )
	{
		Name	"lac repressor";
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( Acs )
	{
		Name	"Acetyl-CoA synthase";
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( Pta )
	{
		Name	"Phosphate acetyl transferase";
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( HOAc_E )
	{
		Name	"acetate export";
		Value	0.0;
		Fixed	0;
	}
	
	
}

System System( /SBMLParameter )
{
	StepperID	DE;
	Name	"Global Parameter";

	Variable Variable( S0 )
	{
		Value	0.5;
		Fixed	1;
	}
	
	Variable Variable( kTCA )
	{
		Value	10.0;
		Fixed	1;
	}
	
	Variable Variable( k1 )
	{
		Value	80.0;
		Fixed	1;
	}
	
	Variable Variable( KM1 )
	{
		Value	0.06;
		Fixed	1;
	}
	
	Variable Variable( k2 )
	{
		Value	0.8;
		Fixed	1;
	}
	
	Variable Variable( KM2 )
	{
		Value	0.1;
		Fixed	1;
	}
	
	Variable Variable( kAck_f )
	{
		Value	1.0;
		Fixed	1;
	}
	
	Variable Variable( kAck_r )
	{
		Value	1.0;
		Fixed	1;
	}
	
	Variable Variable( C )
	{
		Value	100.0;
		Fixed	1;
	}
	
	Variable Variable( H )
	{
		Value	1e-07;
		Fixed	1;
	}
	
	Variable Variable( Keq )
	{
		Value	0.0005;
		Fixed	1;
	}
	
	Variable Variable( k3 )
	{
		Value	0.01;
		Fixed	1;
	}
	
	Variable Variable( alpha0 )
	{
		Value	0.0;
		Fixed	1;
	}
	
	Variable Variable( alpha1 )
	{
		Value	0.1;
		Fixed	1;
	}
	
	Variable Variable( alpha2 )
	{
		Value	2.0;
		Fixed	1;
	}
	
	Variable Variable( alpha3 )
	{
		Value	2.0;
		Fixed	1;
	}
	
	Variable Variable( Kg1 )
	{
		Value	10.0;
		Fixed	1;
	}
	
	Variable Variable( Kg2 )
	{
		Value	10.0;
		Fixed	1;
	}
	
	Variable Variable( Kg3 )
	{
		Value	0.001;
		Fixed	1;
	}
	
	Variable Variable( n )
	{
		Value	2.0;
		Fixed	1;
	}
	
	Variable Variable( kd )
	{
		Value	0.06;
		Fixed	1;
	}
	
	
}

