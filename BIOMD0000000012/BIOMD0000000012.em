
# created by eml2em program
# from file: BIOMD0000000012.eml, date: Sat Mar  1 16:50:32 2014
#

Stepper ODEStepper( Default )
{
	# no property
}

System System( / )
{
	StepperID	Default;
	Name	default;

	Process ExpressionFluxProcess( Reaction1 )
	{
		Name	"degradation of LacI transcripts";
		Expression	"kd_mRNA.Value * X.NumberConc";
		VariableReferenceList
			[ X       Variable:/cell:X                -1 ]
			[ kd_mRNA Variable:/SBMLParameter:kd_mRNA 0  ];
	}
	
	Process ExpressionFluxProcess( Reaction2 )
	{
		Name	"degradation of TetR transcripts";
		Expression	"kd_mRNA.Value * Y.NumberConc";
		VariableReferenceList
			[ Y       Variable:/cell:Y                -1 ]
			[ kd_mRNA Variable:/SBMLParameter:kd_mRNA 0  ];
	}
	
	Process ExpressionFluxProcess( Reaction3 )
	{
		Name	"degradation of CI transcripts";
		Expression	"kd_mRNA.Value * Z.NumberConc";
		VariableReferenceList
			[ Z       Variable:/cell:Z                -1 ]
			[ kd_mRNA Variable:/SBMLParameter:kd_mRNA 0  ];
	}
	
	Process ExpressionFluxProcess( Reaction4 )
	{
		Name	"translation of LacI";
		Expression	"k_tl.Value * X.NumberConc";
		VariableReferenceList
			[ PX   Variable:/cell:PX            1 ]
			[ X    Variable:/cell:X             0 ]
			[ k_tl Variable:/SBMLParameter:k_tl 0 ];
	}
	
	Process ExpressionFluxProcess( Reaction5 )
	{
		Name	"translation of TetR";
		Expression	"k_tl.Value * Y.NumberConc";
		VariableReferenceList
			[ PY   Variable:/cell:PY            1 ]
			[ Y    Variable:/cell:Y             0 ]
			[ k_tl Variable:/SBMLParameter:k_tl 0 ];
	}
	
	Process ExpressionFluxProcess( Reaction6 )
	{
		Name	"translation of CI";
		Expression	"k_tl.Value * Z.NumberConc";
		VariableReferenceList
			[ PZ   Variable:/cell:PZ            1 ]
			[ Z    Variable:/cell:Z             0 ]
			[ k_tl Variable:/SBMLParameter:k_tl 0 ];
	}
	
	Process ExpressionFluxProcess( Reaction7 )
	{
		Name	"degradation of LacI";
		Expression	"kd_prot.Value * PX.NumberConc";
		VariableReferenceList
			[ PX      Variable:/cell:PX               -1 ]
			[ kd_prot Variable:/SBMLParameter:kd_prot 0  ];
	}
	
	Process ExpressionFluxProcess( Reaction8 )
	{
		Name	"degradation of TetR";
		Expression	"kd_prot.Value * PY.NumberConc";
		VariableReferenceList
			[ PY      Variable:/cell:PY               -1 ]
			[ kd_prot Variable:/SBMLParameter:kd_prot 0  ];
	}
	
	Process ExpressionFluxProcess( Reaction9 )
	{
		Name	"degradation of CI";
		Expression	"kd_prot.Value * PZ.NumberConc";
		VariableReferenceList
			[ PZ      Variable:/cell:PZ               -1 ]
			[ kd_prot Variable:/SBMLParameter:kd_prot 0  ];
	}
	
	Process ExpressionFluxProcess( Reaction10 )
	{
		Name	"transcription of LacI";
		Expression	"a0_tr.Value + a_tr.Value * pow(KM.Value, n.Value) / (pow(KM.Value, n.Value) + pow(PZ.NumberConc, n.Value))";
		VariableReferenceList
			[ X     Variable:/cell:X              1 ]
			[ PZ    Variable:/cell:PZ             0 ]
			[ a0_tr Variable:/SBMLParameter:a0_tr 0 ]
			[ a_tr  Variable:/SBMLParameter:a_tr  0 ]
			[ KM    Variable:/SBMLParameter:KM    0 ]
			[ n     Variable:/SBMLParameter:n     0 ];
	}
	
	Process ExpressionFluxProcess( Reaction11 )
	{
		Name	"transcription of TetR";
		Expression	"a0_tr.Value + a_tr.Value * pow(KM.Value, n.Value) / (pow(KM.Value, n.Value) + pow(PX.NumberConc, n.Value))";
		VariableReferenceList
			[ Y     Variable:/cell:Y              1 ]
			[ PX    Variable:/cell:PX             0 ]
			[ a0_tr Variable:/SBMLParameter:a0_tr 0 ]
			[ a_tr  Variable:/SBMLParameter:a_tr  0 ]
			[ KM    Variable:/SBMLParameter:KM    0 ]
			[ n     Variable:/SBMLParameter:n     0 ];
	}
	
	Process ExpressionFluxProcess( Reaction12 )
	{
		Name	"transcription of CI";
		Expression	"a0_tr.Value + a_tr.Value * pow(KM.Value, n.Value) / (pow(KM.Value, n.Value) + pow(PY.NumberConc, n.Value))";
		VariableReferenceList
			[ Z     Variable:/cell:Z              1 ]
			[ PY    Variable:/cell:PY             0 ]
			[ a0_tr Variable:/SBMLParameter:a0_tr 0 ]
			[ a_tr  Variable:/SBMLParameter:a_tr  0 ]
			[ KM    Variable:/SBMLParameter:KM    0 ]
			[ n     Variable:/SBMLParameter:n     0 ];
	}
	
	
}

System System( /cell )
{
	StepperID	Default;

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
	StepperID	Default;
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
		Value	2.88539008178;
	}
	
	Variable Variable( kd_mRNA )
	{
		Name	kd_mRNA;
		Value	0.34657359028;
	}
	
	Variable Variable( kd_prot )
	{
		Name	kd_prot;
		Value	0.069314718056;
	}
	
	Variable Variable( k_tl )
	{
		Name	k_tl;
		Value	6.9314718056;
	}
	
	Variable Variable( a_tr )
	{
		Name	a_tr;
		Value	29.97;
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
		Value	0.03;
	}
	
	
}

System System( /SBMLRule )
{
	Name	"System for SBML Rule";
	StepperID	Default;

	Process ExpressionAssignmentProcess( Assignment_t_ave )
	{
		StepperID	Default;
		Name	"Assignment rule for 't_ave'";
		Expression	"tau_mRNA.NumberConc / log(2)";
		VariableReferenceList
			[ t_ave    Variable:/SBMLParameter:t_ave    1 ]
			[ tau_mRNA Variable:/SBMLParameter:tau_mRNA 0 ];
	}
	
	Process ExpressionAssignmentProcess( Assignment_beta )
	{
		StepperID	Default;
		Name	"Assignment rule for 'beta'";
		Expression	"tau_mRNA.NumberConc / tau_prot.NumberConc";
		VariableReferenceList
			[ beta     Variable:/SBMLParameter:beta     1 ]
			[ tau_mRNA Variable:/SBMLParameter:tau_mRNA 0 ]
			[ tau_prot Variable:/SBMLParameter:tau_prot 0 ];
	}
	
	Process ExpressionAssignmentProcess( Assignment_k_tl )
	{
		StepperID	Default;
		Name	"Assignment rule for 'k_tl'";
		Expression	"eff.NumberConc / t_ave.NumberConc";
		VariableReferenceList
			[ k_tl  Variable:/SBMLParameter:k_tl  1 ]
			[ eff   Variable:/SBMLParameter:eff   0 ]
			[ t_ave Variable:/SBMLParameter:t_ave 0 ];
	}
	
	Process ExpressionAssignmentProcess( Assignment_a_tr )
	{
		StepperID	Default;
		Name	"Assignment rule for 'a_tr'";
		Expression	"(ps_a.NumberConc - ps_0.NumberConc) * 60";
		VariableReferenceList
			[ a_tr Variable:/SBMLParameter:a_tr 1 ]
			[ ps_a Variable:/SBMLParameter:ps_a 0 ]
			[ ps_0 Variable:/SBMLParameter:ps_0 0 ];
	}
	
	Process ExpressionAssignmentProcess( Assignment_a0_tr )
	{
		StepperID	Default;
		Name	"Assignment rule for 'a0_tr'";
		Expression	"ps_0.NumberConc * 60";
		VariableReferenceList
			[ a0_tr Variable:/SBMLParameter:a0_tr 1 ]
			[ ps_0  Variable:/SBMLParameter:ps_0  0 ];
	}
	
	Process ExpressionAssignmentProcess( Assignment_kd_prot )
	{
		StepperID	Default;
		Name	"Assignment rule for 'kd_prot'";
		Expression	"log(2) / tau_prot.NumberConc";
		VariableReferenceList
			[ kd_prot  Variable:/SBMLParameter:kd_prot  1 ]
			[ tau_prot Variable:/SBMLParameter:tau_prot 0 ];
	}
	
	Process ExpressionAssignmentProcess( Assignment_kd_mRNA )
	{
		StepperID	Default;
		Name	"Assignment rule for 'kd_mRNA'";
		Expression	"log(2) / tau_mRNA.NumberConc";
		VariableReferenceList
			[ kd_mRNA  Variable:/SBMLParameter:kd_mRNA  1 ]
			[ tau_mRNA Variable:/SBMLParameter:tau_mRNA 0 ];
	}
	
	Process ExpressionAssignmentProcess( Assignment_alpha )
	{
		StepperID	Default;
		Name	"Assignment rule for 'alpha'";
		Expression	"a_tr.NumberConc * eff.NumberConc * tau_prot.NumberConc / (log(2) * KM.NumberConc)";
		VariableReferenceList
			[ alpha    Variable:/SBMLParameter:alpha    1 ]
			[ a_tr     Variable:/SBMLParameter:a_tr     0 ]
			[ eff      Variable:/SBMLParameter:eff      0 ]
			[ tau_prot Variable:/SBMLParameter:tau_prot 0 ]
			[ KM       Variable:/SBMLParameter:KM       0 ];
	}
	
	Process ExpressionAssignmentProcess( Assignment_alpha0 )
	{
		StepperID	Default;
		Name	"Assignment rule for 'alpha0'";
		Expression	"a0_tr.NumberConc * eff.NumberConc * tau_prot.NumberConc / (log(2) * KM.NumberConc)";
		VariableReferenceList
			[ alpha0   Variable:/SBMLParameter:alpha0   1 ]
			[ a0_tr    Variable:/SBMLParameter:a0_tr    0 ]
			[ eff      Variable:/SBMLParameter:eff      0 ]
			[ tau_prot Variable:/SBMLParameter:tau_prot 0 ]
			[ KM       Variable:/SBMLParameter:KM       0 ];
	}
	
	
}

