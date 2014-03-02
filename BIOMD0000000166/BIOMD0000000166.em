
# created by eml2em program
# from file: BIOMD0000000166.eml, date: Sun Mar  2 12:16:46 2014
#

Stepper ODEStepper( Default )
{
	# no property
}

System System( / )
{
	StepperID	Default;
	Name	default;

	Process ExpressionFluxProcess( TF_synthesis )
	{
		Name	"TF Synthesis";
		Expression	"kf.Value * pow(X.NumberConc, 2) / (pow(X.NumberConc, 2) + Kd.Value)";
		VariableReferenceList
			[ X  Variable:/cytoplasm:X      1 ]
			[ kf Variable:/SBMLParameter:kf 0 ]
			[ Kd Variable:/SBMLParameter:Kd 0 ];
	}
	
	Process ExpressionFluxProcess( TF_degradation )
	{
		Name	"TF degradation";
		kd	1.0;
		Expression	"kd * X.NumberConc";
		VariableReferenceList
			[ X Variable:/cytoplasm:X -1 ];
	}
	
	Process ExpressionFluxProcess( TF_synthesis_basal )
	{
		Name	TF_synthesis_basal;
		Rbas	0.1;
		Expression	Rbas;
		VariableReferenceList
			[ X Variable:/cytoplasm:X 1 ];
	}
	
	Process ExpressionFluxProcess( Calcium_Influx )
	{
		Name	Calcium_Influx;
		v0	1.0;
		Expression	v0;
		VariableReferenceList
			[ Z Variable:/cytoplasm:Z 1 ];
	}
	
	Process ExpressionFluxProcess( Calcium_Influx_stimulation )
	{
		Name	"Calcium Influx by stimulation";
		v1	5.7;
		beta	0.3;
		Expression	"v1 * beta";
		VariableReferenceList
			[ Z Variable:/cytoplasm:Z 1 ];
	}
	
	Process ExpressionFluxProcess( Calcium_into_store )
	{
		Name	"Calcium Influx";
		Vm2	30.0;
		K2	0.5;
		n	2.0;
		Expression	"Vm2 * pow(Z.NumberConc, n) / (pow(K2, n) + pow(Z.NumberConc, n))";
		VariableReferenceList
			[ Z Variable:/cytoplasm:Z -1 ]
			[ Y Variable:/store:Y     1  ];
	}
	
	Process ExpressionFluxProcess( Calcium_into_cytoplasm )
	{
		Name	"Calcium influx to cytoplasm";
		Vm3	325.0;
		Kr	1.7;
		K_A	0.46;
		m	2.0;
		p	4.0;
		Expression	"Vm3 * pow(Y.NumberConc, m) / (pow(Kr, m) + pow(Y.NumberConc, m)) * pow(Z.NumberConc, p) / (pow(K_A, p) + pow(Z.NumberConc, p))";
		VariableReferenceList
			[ Y Variable:/store:Y     -1 ]
			[ Z Variable:/cytoplasm:Z 1  ];
	}
	
	Process ExpressionFluxProcess( Leakage )
	{
		Name	"Calcium Leakage";
		k1	0.7;
		Expression	"k1 * Y.NumberConc";
		VariableReferenceList
			[ Y Variable:/store:Y     -1 ]
			[ Z Variable:/cytoplasm:Z 1  ];
	}
	
	Process ExpressionFluxProcess( Leakage_from_cytoplasm )
	{
		Name	"Leakage from cytoplasm";
		k	10.0;
		Expression	"k * Z.NumberConc";
		VariableReferenceList
			[ Z Variable:/cytoplasm:Z -1 ];
	}
	
	
}

System System( /cytoplasm )
{
	StepperID	Default;
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
		NumberConc	15.0;
		Fixed	0;
	}
	
	Variable Variable( Z )
	{
		Name	"Calcium in cytoplasm";
		NumberConc	0.25;
		Fixed	0;
	}
	
	
}

System System( /store )
{
	StepperID	Default;
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
		NumberConc	0.0;
		Fixed	0;
	}
	
	
}

System System( /SBMLParameter )
{
	StepperID	Default;
	Name	"Global Parameter";

	Variable Variable( kf )
	{
		Name	kf;
		Value	9.17647058824;
	}
	
	Variable Variable( Kd )
	{
		Name	Kd;
		Value	9.41176470588;
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
	StepperID	Default;

	Process ExpressionAssignmentProcess( Assignment_kf )
	{
		StepperID	Default;
		Name	"Assignment rule for 'kf'";
		Expression	"kf0.NumberConc * (1 + gamma.NumberConc * pow(Z.NumberConc, 4) / (pow(Ka.NumberConc, 4) + pow(Z.NumberConc, 4)))";
		VariableReferenceList
			[ kf    Variable:/SBMLParameter:kf    1 ]
			[ kf0   Variable:/SBMLParameter:kf0   0 ]
			[ gamma Variable:/SBMLParameter:gamma 0 ]
			[ Z     Variable:/cytoplasm:Z         0 ]
			[ Ka    Variable:/SBMLParameter:Ka    0 ];
	}
	
	Process ExpressionAssignmentProcess( Assignment_Kd )
	{
		StepperID	Default;
		Name	"Assignment rule for 'Kd'";
		Expression	"Kd0.NumberConc / (1 + pow(Z.NumberConc, 4) / pow(Kb.NumberConc, 4))";
		VariableReferenceList
			[ Kd  Variable:/SBMLParameter:Kd  1 ]
			[ Kd0 Variable:/SBMLParameter:Kd0 0 ]
			[ Z   Variable:/cytoplasm:Z       0 ]
			[ Kb  Variable:/SBMLParameter:Kb  0 ];
	}
	
	
}

