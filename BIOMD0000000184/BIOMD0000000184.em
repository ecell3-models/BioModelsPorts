
# created by eml2em program
# from file: BIOMD0000000184.eml, date: Mon Dec 16 22:55:46 2013
#
# BIOMD0000000184 - Lavrentovich2008_Ca_Oscillations
# 
# Lavrentovich M, Hemkin S. 
# A mathematical model of spontaneous calcium(II) oscillations in astrocytes. 
# J. Theor. Biol. 2008 Apr; 251(4): 553-560 
# Department of Chemistry, Kenyon College, Gambier, OH 43022, USA.


##### Steppers #####

Stepper FixedODE1Stepper( DE ) {}
Stepper DiscreteTimeStepper( DT ) {}

##### Model Entities #####

System System( / )
{
	StepperID	DE;
	Name	Default;

	Process ExpressionFluxProcess( R1 )
	{
		Name	vin;
		Expression	"compartment.Value * Param0.Value";
		VariableReferenceList	
			[ P0 Variable:/compartment:X 1 ]
			[ compartment Variable:/compartment:SIZE 0 ]
			[ Param0 Variable:/SBMLParameter:vin 0 ];
	}
	
	Process ExpressionFluxProcess( R2 )
	{
		Name	"Calcium export from cell";
		Expression	"compartment.Value * Param0.Value * (S0.Value / compartment.Value)";
		VariableReferenceList	
			[ S0 Variable:/compartment:X -1 ]
			[ compartment Variable:/compartment:SIZE 0 ]
			[ Param0 Variable:/SBMLParameter:kout 0 ];
	}
	
	Process ExpressionFluxProcess( R3 )
	{
		Name	CICR;
		Expression	"ER.Value * 4 * Param0.Value * pow(Param1.Value, Param2.Value) * (pow(P0.Value / ER.Value, Param2.Value) / ((pow(P0.Value / ER.Value, Param2.Value) + pow(Param1.Value, Param2.Value)) * (pow(P0.Value / ER.Value, Param2.Value) + pow(Param3.Value, Param2.Value)))) * (pow(C0.Value / ER.Value, Param4.Value) / (pow(C0.Value / ER.Value, Param4.Value) + pow(Param5.Value, Param4.Value))) * (S0.Value / ER.Value - P0.Value / ER.Value)";
		VariableReferenceList	
			[ S0 Variable:/ER:Y -1 ]
			[ P0 Variable:/compartment:X 1 ]
			[ C0 Variable:/compartment:Z 0 ]
			[ ER Variable:/ER:SIZE 0 ]
			[ Param0 Variable:/SBMLParameter:vM3 0 ]
			[ Param1 Variable:/SBMLParameter:k_CaA 0 ]
			[ Param2 Variable:/SBMLParameter:n 0 ]
			[ Param3 Variable:/SBMLParameter:k_CaI 0 ]
			[ Param4 Variable:/SBMLParameter:m 0 ]
			[ Param5 Variable:/SBMLParameter:kip3 0 ];
	}
	
	Process ExpressionFluxProcess( R4 )
	{
		Name	serca;
		Expression	"compartment.Value * Param0.Value * pow(S0.Value / compartment.Value, 2) / (pow(S0.Value / compartment.Value, 2) + pow(Param1.Value, 2))";
		VariableReferenceList	
			[ S0 Variable:/compartment:X -1 ]
			[ P0 Variable:/ER:Y 1 ]
			[ compartment Variable:/compartment:SIZE 0 ]
			[ Param0 Variable:/SBMLParameter:vM2 0 ]
			[ Param1 Variable:/SBMLParameter:k2 0 ];
	}
	
	Process ExpressionFluxProcess( R5 )
	{
		Name	"Leak flux";
		Expression	"ER.Value * Param0.Value * (S0.Value / ER.Value - P0.Value / ER.Value)";
		VariableReferenceList	
			[ S0 Variable:/ER:Y -1 ]
			[ P0 Variable:/compartment:X 1 ]
			[ ER Variable:/ER:SIZE 0 ]
			[ Param0 Variable:/SBMLParameter:kf 0 ];
	}
	
	Process ExpressionFluxProcess( R6 )
	{
		Name	PLC;
		Expression	"compartment.Value * Param0.Value * pow(C0.Value / compartment.Value, 2) / (pow(C0.Value / compartment.Value, 2) + pow(Param1.Value, 2))";
		VariableReferenceList	
			[ P0 Variable:/compartment:Z 1 ]
			[ C0 Variable:/compartment:X 0 ]
			[ compartment Variable:/compartment:SIZE 0 ]
			[ Param0 Variable:/SBMLParameter:vp 0 ]
			[ Param1 Variable:/SBMLParameter:kp 0 ];
	}
	
	Process ExpressionFluxProcess( R7 )
	{
		Name	"IP3 degradation";
		Expression	"compartment.Value * Param0.Value * (S0.Value / compartment.Value)";
		VariableReferenceList	
			[ S0 Variable:/compartment:Z -1 ]
			[ compartment Variable:/compartment:SIZE 0 ]
			[ Param0 Variable:/SBMLParameter:kdeg 0 ];
	}
	
	
}

System System( /compartment )
{
	StepperID	DE;
	Name	Cytoplasm;

	Variable Variable( Dimensions )
	{
		Value	3;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Fixed	1;
	}
	
	Variable Variable( X )
	{
		Name	"Cytoplasmic Calcium";
		Value	0.1;
		Fixed	0;
	}
	
	Variable Variable( Z )
	{
		Name	IP3;
		Value	0.1;
		Fixed	0;
	}
	
	
}

System System( /ER )
{
	StepperID	DE;
	Name	"Endoplasmic Reticulum";

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
		Name	"Calcium in ER";
		Value	1.5;
		Fixed	0;
	}
	
	
}

System System( /SBMLParameter )
{
	StepperID	DE;
	Name	"Global Parameter";

	Variable Variable( vin )
	{
		Value	0.05;
		Fixed	1;
	}
	
	Variable Variable( kout )
	{
		Value	0.5;
		Fixed	1;
	}
	
	Variable Variable( vM3 )
	{
		Value	40.0;
		Fixed	1;
	}
	
	Variable Variable( k_CaA )
	{
		Value	0.15;
		Fixed	1;
	}
	
	Variable Variable( n )
	{
		Value	2.02;
		Fixed	1;
	}
	
	Variable Variable( k_CaI )
	{
		Value	0.15;
		Fixed	1;
	}
	
	Variable Variable( m )
	{
		Value	2.2;
		Fixed	1;
	}
	
	Variable Variable( kip3 )
	{
		Value	0.1;
		Fixed	1;
	}
	
	Variable Variable( vM2 )
	{
		Value	15.0;
		Fixed	1;
	}
	
	Variable Variable( k2 )
	{
		Value	0.1;
		Fixed	1;
	}
	
	Variable Variable( kf )
	{
		Value	0.5;
		Fixed	1;
	}
	
	Variable Variable( vp )
	{
		Value	0.05;
		Fixed	1;
	}
	
	Variable Variable( kp )
	{
		Value	0.3;
		Fixed	1;
	}
	
	Variable Variable( kdeg )
	{
		Value	0.08;
		Fixed	1;
	}
	
	
}

