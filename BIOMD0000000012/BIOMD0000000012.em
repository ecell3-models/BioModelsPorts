
# created by eml2em program
# from file: BIOMD0000000012.eml, date: Mon Dec 16 21:20:17 2013
#
# BIOMD0000000012 - Elowitz2000 - Repressilator
# 
# Goldbeter A. 
# Elowitz MB, Leibler S. 
# A synthetic oscillatory network of transcriptional regulators. 
# Nature 2000 Jan; 403(6767): 335-338 
# Department of Molecular Biology and Physics, Princeton University, New Jersey 08544, USA.


##### Steppers #####

Stepper FixedODE1Stepper( DE ) {}
Stepper DiscreteTimeStepper( DT ) {}

##### Model Entities #####
Stepper ODEStepper( DE )
{
	# no property
}

System System( / )
{
	StepperID	DE;
	Name	Default;

	Process ExpressionFluxProcess( Reaction1 )
	{
		Name	"degradation of LacI transcripts";
		Expression	"Param0.Value * (S0.Value / cell.Value)";
		VariableReferenceList	
			[ S0 Variable:/cell:X -1 ]
			[ Param0 Variable:/SBMLParameter:kd_mRNA 0 ]
			[ cell Variable:/cell:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( Reaction2 )
	{
		Name	"degradation of TetR transcripts";
		Expression	"Param0.Value * (S0.Value / cell.Value)";
		VariableReferenceList	
			[ S0 Variable:/cell:Y -1 ]
			[ Param0 Variable:/SBMLParameter:kd_mRNA 0 ]
			[ cell Variable:/cell:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( Reaction3 )
	{
		Name	"degradation of CI transcripts";
		Expression	"Param0.Value * (S0.Value / cell.Value)";
		VariableReferenceList	
			[ S0 Variable:/cell:Z -1 ]
			[ Param0 Variable:/SBMLParameter:kd_mRNA 0 ]
			[ cell Variable:/cell:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( Reaction4 )
	{
		Name	"translation of LacI";
		Expression	"Param0.Value * (C0.Value / cell.Value)";
		VariableReferenceList	
			[ P0 Variable:/cell:PX 1 ]
			[ C0 Variable:/cell:X 0 ]
			[ Param0 Variable:/SBMLParameter:k_tl 0 ]
			[ cell Variable:/cell:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( Reaction5 )
	{
		Name	"translation of TetR";
		Expression	"Param0.Value * (C0.Value / cell.Value)";
		VariableReferenceList	
			[ P0 Variable:/cell:PY 1 ]
			[ C0 Variable:/cell:Y 0 ]
			[ Param0 Variable:/SBMLParameter:k_tl 0 ]
			[ cell Variable:/cell:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( Reaction6 )
	{
		Name	"translation of CI";
		Expression	"Param0.Value * (C0.Value / cell.Value)";
		VariableReferenceList	
			[ P0 Variable:/cell:PZ 1 ]
			[ C0 Variable:/cell:Z 0 ]
			[ Param0 Variable:/SBMLParameter:k_tl 0 ]
			[ cell Variable:/cell:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( Reaction7 )
	{
		Name	"degradation of LacI";
		Expression	"Param0.Value * (S0.Value / cell.Value)";
		VariableReferenceList	
			[ S0 Variable:/cell:PX -1 ]
			[ Param0 Variable:/SBMLParameter:kd_prot 0 ]
			[ cell Variable:/cell:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( Reaction8 )
	{
		Name	"degradation of TetR";
		Expression	"Param0.Value * (S0.Value / cell.Value)";
		VariableReferenceList	
			[ S0 Variable:/cell:PY -1 ]
			[ Param0 Variable:/SBMLParameter:kd_prot 0 ]
			[ cell Variable:/cell:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( Reaction9 )
	{
		Name	"degradation of CI";
		Expression	"Param0.Value * (S0.Value / cell.Value)";
		VariableReferenceList	
			[ S0 Variable:/cell:PZ -1 ]
			[ Param0 Variable:/SBMLParameter:kd_prot 0 ]
			[ cell Variable:/cell:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( Reaction10 )
	{
		Name	"transcription of LacI";
		Expression	"Param0.Value + Param1.Value * pow(Param2.Value, Param3.Value) / (pow(Param2.Value, Param3.Value) + pow(C0.Value / cell.Value, Param3.Value))";
		VariableReferenceList	
			[ P0 Variable:/cell:X 1 ]
			[ C0 Variable:/cell:PZ 0 ]
			[ Param0 Variable:/SBMLParameter:a0_tr 0 ]
			[ Param1 Variable:/SBMLParameter:a_tr 0 ]
			[ Param2 Variable:/SBMLParameter:KM 0 ]
			[ Param3 Variable:/SBMLParameter:n 0 ]
			[ cell Variable:/cell:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( Reaction11 )
	{
		Name	"transcription of TetR";
		Expression	"Param0.Value + Param1.Value * pow(Param2.Value, Param3.Value) / (pow(Param2.Value, Param3.Value) + pow(C0.Value / cell.Value, Param3.Value))";
		VariableReferenceList	
			[ P0 Variable:/cell:Y 1 ]
			[ C0 Variable:/cell:PX 0 ]
			[ Param0 Variable:/SBMLParameter:a0_tr 0 ]
			[ Param1 Variable:/SBMLParameter:a_tr 0 ]
			[ Param2 Variable:/SBMLParameter:KM 0 ]
			[ Param3 Variable:/SBMLParameter:n 0 ]
			[ cell Variable:/cell:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( Reaction12 )
	{
		Name	"transcription of CI";
		Expression	"Param0.Value + Param1.Value * pow(Param2.Value, Param3.Value) / (pow(Param2.Value, Param3.Value) + pow(C0.Value / cell.Value, Param3.Value))";
		VariableReferenceList	
			[ P0 Variable:/cell:Z 1 ]
			[ C0 Variable:/cell:PY 0 ]
			[ Param0 Variable:/SBMLParameter:a0_tr 0 ]
			[ Param1 Variable:/SBMLParameter:a_tr 0 ]
			[ Param2 Variable:/SBMLParameter:KM 0 ]
			[ Param3 Variable:/SBMLParameter:n 0 ]
			[ cell Variable:/cell:SIZE 0 ];
	}
	
	
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
	
	Variable Variable( PX )
	{
		Name	"LacI protein";
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( PY )
	{
		Name	"TetR protein";
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( PZ )
	{
		Name	"cI protein";
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( X )
	{
		Name	"LacI mRNA";
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( Y )
	{
		Name	"TetR mRNA";
		Value	20.0;
		Fixed	0;
	}
	
	Variable Variable( Z )
	{
		Name	"cI mRNA";
		Value	0.0;
		Fixed	0;
	}
	
	
}

System System( /SBMLParameter )
{
	StepperID	DE;
	Name	"Global Parameter";

	Variable Variable( beta )
	{
		Name	beta;
		Value	0.2;
	}
	
	Variable Variable( alpha0 )
	{
		Name	alpha0;
		Value	0.2164;
	}
	
	Variable Variable( alpha )
	{
		Name	alpha;
		Value	216.404;
	}
	
	Variable Variable( eff )
	{
		Name	"translation efficiency";
		Value	20.0;
		Fixed	1;
	}
	
	Variable Variable( n )
	{
		Name	n;
		Value	2.0;
		Fixed	1;
	}
	
	Variable Variable( KM )
	{
		Name	KM;
		Value	40.0;
		Fixed	1;
	}
	
	Variable Variable( tau_mRNA )
	{
		Name	"mRNA half life";
		Value	2.0;
		Fixed	1;
	}
	
	Variable Variable( tau_prot )
	{
		Name	"protein half life";
		Value	10.0;
		Fixed	1;
	}
	
	Variable Variable( t_ave )
	{
		Name	"average mRNA life time";
		Value	2.88539008178;  ## Calculated
	}
	
	Variable Variable( kd_mRNA )
	{
		Name	kd_mRNA;
		Value	0.34657359028;  ## Calculated
	}
	
	Variable Variable( kd_prot )
	{
		Name	kd_prot;
		Value	0.069314718056;  ## Calculated
	}
	
	Variable Variable( k_tl )
	{
		Name	k_tl;
		Value	6.9314718056;  ## Calculated
	}
	
	Variable Variable( a_tr )
	{
		Name	a_tr;
		Value	29.97;  ## Calculated
	}
	
	Variable Variable( ps_a )
	{
		Name	tps_active;
		Value	0.5;
		Fixed	1;
	}
	
	Variable Variable( ps_0 )
	{
		Name	tps_repr;
		Value	0.0005;
		Fixed	1;
	}
	
	Variable Variable( a0_tr )
	{
		Name	a0_tr;
		Value	0.03;  ## Calculated
	}
	
	
}

System System( /SBMLRule )
{
	Name	"System for SBML Rule";
	StepperID	DT;

	Process ExpressionAssignmentProcess( Rule1 )
	{
		Expression	"P1.Value / log(2)";
		VariableReferenceList	
			[ P0 Variable:/SBMLParameter:t_ave 1 ]
			[ P1 Variable:/SBMLParameter:tau_mRNA 0 ];
	}
	
	Process ExpressionAssignmentProcess( Rule2 )
	{
		Expression	"P1.Value / P2.Value";
		VariableReferenceList	
			[ P0 Variable:/SBMLParameter:beta 1 ]
			[ P1 Variable:/SBMLParameter:tau_mRNA 0 ]
			[ P2 Variable:/SBMLParameter:tau_prot 0 ];
	}
	
	Process ExpressionAssignmentProcess( Rule3 )
	{
		Expression	"P1.Value / P2.Value";
		VariableReferenceList	
			[ P0 Variable:/SBMLParameter:k_tl 1 ]
			[ P1 Variable:/SBMLParameter:eff 0 ]
			[ P2 Variable:/SBMLParameter:t_ave 0 ];
	}
	
	Process ExpressionAssignmentProcess( Rule4 )
	{
		Expression	"(P1.Value - P2.Value) * 60";
		VariableReferenceList	
			[ P0 Variable:/SBMLParameter:a_tr 1 ]
			[ P1 Variable:/SBMLParameter:ps_a 0 ]
			[ P2 Variable:/SBMLParameter:ps_0 0 ];
	}
	
	Process ExpressionAssignmentProcess( Rule5 )
	{
		Expression	"P1.Value * 60";
		VariableReferenceList	
			[ P0 Variable:/SBMLParameter:a0_tr 1 ]
			[ P1 Variable:/SBMLParameter:ps_0 0 ];
	}
	
	Process ExpressionAssignmentProcess( Rule6 )
	{
		Expression	"log(2) / P1.Value";
		VariableReferenceList	
			[ P0 Variable:/SBMLParameter:kd_prot 1 ]
			[ P1 Variable:/SBMLParameter:tau_prot 0 ];
	}
	
	Process ExpressionAssignmentProcess( Rule7 )
	{
		Expression	"log(2) / P1.Value";
		VariableReferenceList	
			[ P0 Variable:/SBMLParameter:kd_mRNA 1 ]
			[ P1 Variable:/SBMLParameter:tau_mRNA 0 ];
	}
	
	Process ExpressionAssignmentProcess( Rule8 )
	{
		Expression	"P1.Value * P2.Value * P3.Value / (log(2) * P4.Value)";
		VariableReferenceList	
			[ P0 Variable:/SBMLParameter:alpha 1 ]
			[ P1 Variable:/SBMLParameter:a_tr 0 ]
			[ P2 Variable:/SBMLParameter:eff 0 ]
			[ P3 Variable:/SBMLParameter:tau_prot 0 ]
			[ P4 Variable:/SBMLParameter:KM 0 ];
	}
	
	Process ExpressionAssignmentProcess( Rule9 )
	{
		Expression	"P1.Value * P2.Value * P3.Value / (log(2) * P4.Value)";
		VariableReferenceList	
			[ P0 Variable:/SBMLParameter:alpha0 1 ]
			[ P1 Variable:/SBMLParameter:a0_tr 0 ]
			[ P2 Variable:/SBMLParameter:eff 0 ]
			[ P3 Variable:/SBMLParameter:tau_prot 0 ]
			[ P4 Variable:/SBMLParameter:KM 0 ];
	}
	
	
}

