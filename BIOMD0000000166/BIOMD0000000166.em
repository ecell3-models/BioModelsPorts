
# created by eml2em program
# from file: BIOMD0000000166.eml, date: Mon Dec 16 22:55:38 2013
#
# BIOMD0000000166 - Zhu2007_TF_modulated_by_Calcium
# 
# Zhu CL, Zheng Y, Jia Y. 
# A theoretical study on activation of transcription factor modulated by intracellular Ca2+ oscillations. 
# Biophys. Chem. 2007 Aug; 129(1): 49-55 
# Department of Physics, Jianghan University, Wuhan 430056, China.


##### Steppers #####

Stepper FixedODE1Stepper( DE ) {}
Stepper DiscreteTimeStepper( DT ) {}

##### Model Entities #####

System System( / )
{
	StepperID	DE;
	Name	Default;

	Process ExpressionFluxProcess( TF_synthesis )
	{
		Name	"TF Synthesis";
		Expression	"Param0.Value * pow(P0.Value / cytoplasm.Value, 2) / (pow(P0.Value / cytoplasm.Value, 2) + Param1.Value)";
		VariableReferenceList	
			[ P0 Variable:/cytoplasm:X 1 ]
			[ Param0 Variable:/SBMLParameter:kf 0 ]
			[ cytoplasm Variable:/cytoplasm:SIZE 0 ]
			[ Param1 Variable:/SBMLParameter:Kd 0 ];
	}
	
	Process ExpressionFluxProcess( TF_degradation )
	{
		Name	"TF degradation";
		kd	1.0;
		Expression	"kd * (S0.Value / cytoplasm.Value)";
		VariableReferenceList	
			[ S0 Variable:/cytoplasm:X -1 ]
			[ cytoplasm Variable:/cytoplasm:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( TF_synthesis_basal )
	{
		Name	TF_synthesis_basal;
		Rbas	0.1;
		Expression	Rbas;
		VariableReferenceList	
			[ P0 Variable:/cytoplasm:X 1 ];
	}
	
	Process ExpressionFluxProcess( Calcium_Influx )
	{
		Name	Calcium_Influx;
		v0	1.0;
		Expression	v0;
		VariableReferenceList	
			[ P0 Variable:/cytoplasm:Z 1 ];
	}
	
	Process ExpressionFluxProcess( Calcium_Influx_stimulation )
	{
		Name	"Calcium Influx by stimulation";
		v1	5.7;
		beta	0.3;
		Expression	"v1 * beta";
		VariableReferenceList	
			[ P0 Variable:/cytoplasm:Z 1 ];
	}
	
	Process ExpressionFluxProcess( Calcium_into_store )
	{
		Name	"Calcium Influx";
		Vm2	30.0;
		K2	0.5;
		n	2.0;
		Expression	"Vm2 * pow(S0.Value / cytoplasm.Value, n) / (pow(K2, n) + pow(S0.Value / cytoplasm.Value, n))";
		VariableReferenceList	
			[ S0 Variable:/cytoplasm:Z -1 ]
			[ P0 Variable:/store:Y 1 ]
			[ cytoplasm Variable:/cytoplasm:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( Calcium_into_cytoplasm )
	{
		Name	"Calcium influx to cytoplasm";
		Vm3	325.0;
		Kr	1.7;
		K_A	0.46;
		m	2.0;
		p	4.0;
		Expression	"Vm3 * pow(S0.Value / store.Value, m) / (pow(Kr, m) + pow(S0.Value / store.Value, m)) * pow(P0.Value / store.Value, p) / (pow(K_A, p) + pow(P0.Value / store.Value, p))";
		VariableReferenceList	
			[ S0 Variable:/store:Y -1 ]
			[ P0 Variable:/cytoplasm:Z 1 ]
			[ store Variable:/store:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( Leakage )
	{
		Name	"Calcium Leakage";
		k1	0.7;
		Expression	"k1 * (S0.Value / store.Value)";
		VariableReferenceList	
			[ S0 Variable:/store:Y -1 ]
			[ P0 Variable:/cytoplasm:Z 1 ]
			[ store Variable:/store:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( Leakage_from_cytoplasm )
	{
		Name	"Leakage from cytoplasm";
		k	10.0;
		Expression	"k * (S0.Value / cytoplasm.Value)";
		VariableReferenceList	
			[ S0 Variable:/cytoplasm:Z -1 ]
			[ cytoplasm Variable:/cytoplasm:SIZE 0 ];
	}
	
	
}

System System( /cytoplasm )
{
	StepperID	DE;
	Name	cytoplasm;

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
		Name	TF_A;
		Value	15.0;
		Fixed	0;
	}
	
	Variable Variable( Z )
	{
		Name	"Calcium in cytoplasm";
		Value	0.25;
		Fixed	0;
	}
	
	
}

System System( /store )
{
	StepperID	DE;
	Name	store;

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
		Name	"Calcium in store";
		Value	0.0;
		Fixed	0;
	}
	
	
}

System System( /SBMLParameter )
{
	StepperID	DE;
	Name	"Global Parameter";

	Variable Variable( kf )
	{
		Name	kf;
		Value	8.90757086485;  ## Calculated
	}
	
	Variable Variable( Kd )
	{
		Name	Kd;
		Value	9.46156095095;  ## Calculated
	}
	
	Variable Variable( kf0 )
	{
		Value	6.0;
		Fixed	1;
	}
	
	Variable Variable( gamma )
	{
		Value	9.0;
		Fixed	1;
	}
	
	Variable Variable( Ka )
	{
		Name	Ka;
		Value	0.5;
		Fixed	1;
	}
	
	Variable Variable( Kb )
	{
		Name	Kb;
		Value	0.5;
		Fixed	1;
	}
	
	Variable Variable( Kd0 )
	{
		Value	10.0;
		Fixed	1;
	}
	
	
}

System System( /SBMLRule )
{
	Name	"System for SBML Rule";
	StepperID	DT;

	Process ExpressionAssignmentProcess( Rule1 )
	{
		Expression	"P1.Value * (1 + P2.Value * pow(V0.Value / cytoplasm.Value, 4) / (pow(P3.Value, 4) + pow(V0.Value / cytoplasm.Value, 4)))";
		VariableReferenceList	
			[ P0 Variable:/SBMLParameter:kf 1 ]
			[ P1 Variable:/SBMLParameter:kf0 0 ]
			[ P2 Variable:/SBMLParameter:gamma 0 ]
			[ V0 Variable:/cytoplasm:Z 0 ]
			[ cytoplasm Variable:/cytoplasm:SIZE 0 ]
			[ P3 Variable:/SBMLParameter:Ka 0 ];
	}
	
	Process ExpressionAssignmentProcess( Rule2 )
	{
		Expression	"P1.Value / (1 + pow(V0.Value / cytoplasm.Value, 4) / pow(P2.Value, 4))";
		VariableReferenceList	
			[ P0 Variable:/SBMLParameter:Kd 1 ]
			[ P1 Variable:/SBMLParameter:Kd0 0 ]
			[ V0 Variable:/cytoplasm:Z 0 ]
			[ cytoplasm Variable:/cytoplasm:SIZE 0 ]
			[ P2 Variable:/SBMLParameter:Kb 0 ];
	}
	
	
}

