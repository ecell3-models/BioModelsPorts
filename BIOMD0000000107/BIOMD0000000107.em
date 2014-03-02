
# created by eml2em program
# from file: BIOMD0000000107.eml, date: Sun Mar  2 09:04:38 2014
#

Stepper ODEStepper( Default )
{
	# no property
}

System System( / )
{
	StepperID	Default;
	Name	default;

	Process ExpressionFluxProcess( R1 )
	{
		Name	"cyclin synthesis";
		Expression	"k1AA.Value";
		VariableReferenceList
			[ cyclin Variable:/cytoplasm:cyclin   1 ]
			[ k1AA   Variable:/SBMLParameter:k1AA 0 ];
	}
	
	Process ExpressionFluxProcess( R2 )
	{
		Name	"cyclin degradation";
		Expression	"k2.Value * cyclin.NumberConc";
		VariableReferenceList
			[ cyclin Variable:/cytoplasm:cyclin -1 ]
			[ k2     Variable:/SBMLParameter:k2 0  ];
	}
	
	Process ExpressionFluxProcess( R3 )
	{
		Name	"cyclin-cdc2 dimer formation";
		Expression	"k3.Value * cyclin.NumberConc * cdc2.NumberConc";
		VariableReferenceList
			[ cyclin Variable:/cytoplasm:cyclin -1 ]
			[ dimer  Variable:/cytoplasm:dimer  1  ]
			[ cdc2   Variable:/cytoplasm:cdc2   0  ]
			[ k3     Variable:/SBMLParameter:k3 0  ];
	}
	
	Process ExpressionFluxProcess( R4 )
	{
		Name	"Thr161 dephosphorylation";
		Expression	"kinh.Value * dimer_p.NumberConc";
		VariableReferenceList
			[ dimer_p Variable:/cytoplasm:dimer_p  -1 ]
			[ dimer   Variable:/cytoplasm:dimer    1  ]
			[ kinh    Variable:/SBMLParameter:kinh 0  ];
	}
	
	Process ExpressionFluxProcess( R5 )
	{
		Name	"Tyr15 phosphorylation";
		Expression	"kwee.Value * dimer.NumberConc";
		VariableReferenceList
			[ dimer   Variable:/cytoplasm:dimer    -1 ]
			[ p_dimer Variable:/cytoplasm:p_dimer  1  ]
			[ kwee    Variable:/SBMLParameter:kwee 0  ];
	}
	
	Process ExpressionFluxProcess( R6 )
	{
		Name	"Thr161 phosphorylation";
		Expression	"kcak.Value * dimer.NumberConc";
		VariableReferenceList
			[ dimer   Variable:/cytoplasm:dimer    -1 ]
			[ dimer_p Variable:/cytoplasm:dimer_p  1  ]
			[ kcak    Variable:/SBMLParameter:kcak 0  ];
	}
	
	Process ExpressionFluxProcess( R7 )
	{
		Name	"cyclin degradation";
		Expression	"k2.Value * dimer.NumberConc";
		VariableReferenceList
			[ dimer Variable:/cytoplasm:dimer  -1 ]
			[ k2    Variable:/SBMLParameter:k2 0  ];
	}
	
	Process ExpressionFluxProcess( R8 )
	{
		Name	"Tyr15 dephosphorylation";
		Expression	"k25.Value * p_dimer.NumberConc";
		VariableReferenceList
			[ p_dimer Variable:/cytoplasm:p_dimer -1 ]
			[ dimer   Variable:/cytoplasm:dimer   1  ]
			[ k25     Variable:/SBMLParameter:k25 0  ];
	}
	
	Process ExpressionFluxProcess( R9 )
	{
		Name	"Thr161 phosphorylation";
		Expression	"kcak.Value * p_dimer.NumberConc";
		VariableReferenceList
			[ p_dimer   Variable:/cytoplasm:p_dimer   -1 ]
			[ p_dimer_p Variable:/cytoplasm:p_dimer_p 1  ]
			[ kcak      Variable:/SBMLParameter:kcak  0  ];
	}
	
	Process ExpressionFluxProcess( R10 )
	{
		Name	"cyclin degradation";
		Expression	"k2.Value * p_dimer.NumberConc";
		VariableReferenceList
			[ p_dimer Variable:/cytoplasm:p_dimer -1 ]
			[ k2      Variable:/SBMLParameter:k2  0  ];
	}
	
	Process ExpressionFluxProcess( R11 )
	{
		Name	"Thr161 dephosphorylation";
		Expression	"kinh.Value * p_dimer_p.NumberConc";
		VariableReferenceList
			[ p_dimer_p Variable:/cytoplasm:p_dimer_p -1 ]
			[ p_dimer   Variable:/cytoplasm:p_dimer   1  ]
			[ kinh      Variable:/SBMLParameter:kinh  0  ];
	}
	
	Process ExpressionFluxProcess( R12 )
	{
		Name	"Tyr15 phosphorylation";
		Expression	"kwee.Value * dimer_p.NumberConc";
		VariableReferenceList
			[ dimer_p   Variable:/cytoplasm:dimer_p   -1 ]
			[ p_dimer_p Variable:/cytoplasm:p_dimer_p 1  ]
			[ kwee      Variable:/SBMLParameter:kwee  0  ];
	}
	
	Process ExpressionFluxProcess( R13 )
	{
		Name	"Tyr15 dephosphorylation";
		Expression	"k25.Value * p_dimer_p.NumberConc";
		VariableReferenceList
			[ p_dimer_p Variable:/cytoplasm:p_dimer_p -1 ]
			[ dimer_p   Variable:/cytoplasm:dimer_p   1  ]
			[ k25       Variable:/SBMLParameter:k25   0  ];
	}
	
	Process ExpressionFluxProcess( R14 )
	{
		Name	"cyclin degradation";
		Expression	"k2.Value * p_dimer_p.NumberConc";
		VariableReferenceList
			[ p_dimer_p Variable:/cytoplasm:p_dimer_p -1 ]
			[ k2        Variable:/SBMLParameter:k2    0  ];
	}
	
	Process ExpressionFluxProcess( R15 )
	{
		Name	"cyclin degradation";
		Expression	"k2.Value * dimer_p.NumberConc";
		VariableReferenceList
			[ dimer_p Variable:/cytoplasm:dimer_p -1 ]
			[ k2      Variable:/SBMLParameter:k2  0  ];
	}
	
	Process ExpressionFluxProcess( R17 )
	{
		Name	"cdc25 activation";
		Expression	"ka.Value * dimer_p.NumberConc * (total_cdc25.Value - cdc25_p.NumberConc) / (K_a.Value + total_cdc25.Value - cdc25_p.NumberConc)";
		VariableReferenceList
			[ cdc25_p     Variable:/cytoplasm:cdc25_p         1 ]
			[ dimer_p     Variable:/cytoplasm:dimer_p         0 ]
			[ ka          Variable:/SBMLParameter:ka          0 ]
			[ total_cdc25 Variable:/SBMLParameter:total_cdc25 0 ]
			[ K_a         Variable:/SBMLParameter:K_a         0 ];
	}
	
	Process ExpressionFluxProcess( R18 )
	{
		Name	"cdc25 deactivation";
		Expression	"kbPPase.Value * cdc25_p.NumberConc / (K_b.Value + cdc25_p.NumberConc)";
		VariableReferenceList
			[ cdc25_p Variable:/cytoplasm:cdc25_p     -1 ]
			[ kbPPase Variable:/SBMLParameter:kbPPase 0  ]
			[ K_b     Variable:/SBMLParameter:K_b     0  ];
	}
	
	Process ExpressionFluxProcess( R19 )
	{
		Name	"wee1 deactivation";
		Expression	"ke.Value * dimer_p.NumberConc * (total_wee1.Value - wee1_p.NumberConc) / (K_e.Value + total_wee1.Value - wee1_p.NumberConc)";
		VariableReferenceList
			[ wee1_p     Variable:/cytoplasm:wee1_p         1 ]
			[ dimer_p    Variable:/cytoplasm:dimer_p        0 ]
			[ ke         Variable:/SBMLParameter:ke         0 ]
			[ total_wee1 Variable:/SBMLParameter:total_wee1 0 ]
			[ K_e        Variable:/SBMLParameter:K_e        0 ];
	}
	
	Process ExpressionFluxProcess( R20 )
	{
		Name	"wee1 activation";
		Expression	"kfPPase.Value * wee1_p.NumberConc / (K_f.Value + wee1_p.NumberConc)";
		VariableReferenceList
			[ wee1_p  Variable:/cytoplasm:wee1_p      -1 ]
			[ kfPPase Variable:/SBMLParameter:kfPPase 0  ]
			[ K_f     Variable:/SBMLParameter:K_f     0  ];
	}
	
	Process ExpressionFluxProcess( R21 )
	{
		Name	"intermediary enzyme activation";
		Expression	"kg.Value * dimer_p.NumberConc * (total_IE.Value - IE_p.NumberConc) / (K_g.Value + total_IE.Value - IE_p.NumberConc)";
		VariableReferenceList
			[ IE_p     Variable:/cytoplasm:IE_p         1 ]
			[ dimer_p  Variable:/cytoplasm:dimer_p      0 ]
			[ kg       Variable:/SBMLParameter:kg       0 ]
			[ total_IE Variable:/SBMLParameter:total_IE 0 ]
			[ K_g      Variable:/SBMLParameter:K_g      0 ];
	}
	
	Process ExpressionFluxProcess( R22 )
	{
		Name	"intermediary enzyme deactivation";
		Expression	"khPPAse.Value * IE_p.NumberConc / (K_h.Value + IE_p.NumberConc)";
		VariableReferenceList
			[ IE_p    Variable:/cytoplasm:IE_p        -1 ]
			[ khPPAse Variable:/SBMLParameter:khPPAse 0  ]
			[ K_h     Variable:/SBMLParameter:K_h     0  ];
	}
	
	Process ExpressionFluxProcess( R23 )
	{
		Name	"ubiquitin conjugating enzyme activation";
		Expression	"kc.Value * IE_p.NumberConc * (total_UbE.Value - UbE_star.NumberConc) / (K_c.Value + total_UbE.Value - UbE_star.NumberConc)";
		VariableReferenceList
			[ UbE_star  Variable:/cytoplasm:UbE_star      1 ]
			[ IE_p      Variable:/cytoplasm:IE_p          0 ]
			[ kc        Variable:/SBMLParameter:kc        0 ]
			[ total_UbE Variable:/SBMLParameter:total_UbE 0 ]
			[ K_c       Variable:/SBMLParameter:K_c       0 ];
	}
	
	Process ExpressionFluxProcess( R24 )
	{
		Name	"ubiquitin conjugating enzyme deactivation";
		Expression	"kd_anti_IE.Value * UbE_star.NumberConc / (K_d.Value + UbE_star.NumberConc)";
		VariableReferenceList
			[ UbE_star   Variable:/cytoplasm:UbE_star       -1 ]
			[ kd_anti_IE Variable:/SBMLParameter:kd_anti_IE 0  ]
			[ K_d        Variable:/SBMLParameter:K_d        0  ];
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
	
	Variable Variable( cyclin )
	{
		Name	cyclin;
		NumberConc	100.0;
		Fixed	0;
	}
	
	Variable Variable( dimer )
	{
		Name	"cyclin-cdc2 dimer";
		NumberConc	0.0;
		Fixed	0;
	}
	
	Variable Variable( dimer_p )
	{
		Name	"Thr161 phosphorylated dimer(active MPF)";
		NumberConc	0.0;
		Fixed	0;
	}
	
	Variable Variable( p_dimer )
	{
		Name	"Tyr15 phosphorylated dimer";
		NumberConc	0.0;
		Fixed	0;
	}
	
	Variable Variable( p_dimer_p )
	{
		Name	"Thr161-Tyr15 phosphorylated dimer";
		NumberConc	0.0;
		Fixed	0;
	}
	
	Variable Variable( cdc25_p )
	{
		Name	"phosphorylated cdc25";
		NumberConc	0.0;
		Fixed	0;
	}
	
	Variable Variable( wee1_p )
	{
		Name	"phosphorylated wee1";
		NumberConc	0.0;
		Fixed	0;
	}
	
	Variable Variable( IE_p )
	{
		Name	"phosphorylated intermediary enzyme";
		NumberConc	0.0;
		Fixed	0;
	}
	
	Variable Variable( UbE_star )
	{
		Name	"ubiquitin conjugating enzyme";
		NumberConc	0.0;
		Fixed	0;
	}
	
	Variable Variable( cdc2 )
	{
		Name	cdc2;
		NumberConc	0.0;
		Fixed	0;
	}
	
	Variable Variable( cdc25 )
	{
		Name	cdc25;
		NumberConc	0.0;
		Fixed	0;
	}
	
	Variable Variable( wee1 )
	{
		Name	wee1;
		NumberConc	0.0;
		Fixed	0;
	}
	
	Variable Variable( IE )
	{
		Name	"intermediary enzyme";
		NumberConc	0.0;
		Fixed	0;
	}
	
	Variable Variable( UbE )
	{
		Name	"ubiquitin conjugating enzyme";
		NumberConc	0.0;
		Fixed	0;
	}
	
	
}

System System( /SBMLParameter )
{
	StepperID	Default;
	Name	"Global Parameter";

	Variable Variable( total_cdc2 )
	{
		Value	100.0;
		Fixed	1;
	}
	
	Variable Variable( total_cdc25 )
	{
		Value	1.0;
		Fixed	1;
	}
	
	Variable Variable( total_wee1 )
	{
		Value	1.0;
		Fixed	1;
	}
	
	Variable Variable( total_IE )
	{
		Value	1.0;
		Fixed	1;
	}
	
	Variable Variable( total_UbE )
	{
		Value	1.0;
		Fixed	1;
	}
	
	Variable Variable( k25 )
	{
		Value	0.1;
	}
	
	Variable Variable( V25_prime )
	{
		Value	0.1;
		Fixed	1;
	}
	
	Variable Variable( V25_double_prime )
	{
		Value	2.0;
		Fixed	1;
	}
	
	Variable Variable( kwee )
	{
		Value	1.0;
	}
	
	Variable Variable( Vwee_prime )
	{
		Value	0.1;
		Fixed	1;
	}
	
	Variable Variable( Vwee_double_prime )
	{
		Value	1.0;
		Fixed	1;
	}
	
	Variable Variable( k2 )
	{
		Value	0.015;
	}
	
	Variable Variable( V2_prime )
	{
		Value	0.015;
		Fixed	1;
	}
	
	Variable Variable( V2_double_prime )
	{
		Value	1.0;
		Fixed	1;
	}
	
	Variable Variable( k1AA )
	{
		Value	1.0;
		Fixed	1;
	}
	
	Variable Variable( k3 )
	{
		Value	0.01;
		Fixed	1;
	}
	
	Variable Variable( kinh )
	{
		Value	0.025;
		Fixed	1;
	}
	
	Variable Variable( kcak )
	{
		Value	0.25;
		Fixed	1;
	}
	
	Variable Variable( ka )
	{
		Value	0.01;
		Fixed	1;
	}
	
	Variable Variable( K_a )
	{
		Value	0.1;
		Fixed	1;
	}
	
	Variable Variable( kbPPase )
	{
		Value	0.125;
		Fixed	1;
	}
	
	Variable Variable( K_b )
	{
		Value	0.1;
		Fixed	1;
	}
	
	Variable Variable( ke )
	{
		Value	0.0133;
		Fixed	1;
	}
	
	Variable Variable( K_e )
	{
		Value	0.3;
		Fixed	1;
	}
	
	Variable Variable( kfPPase )
	{
		Value	0.1;
		Fixed	1;
	}
	
	Variable Variable( K_f )
	{
		Value	0.3;
		Fixed	1;
	}
	
	Variable Variable( kg )
	{
		Value	0.0065;
		Fixed	1;
	}
	
	Variable Variable( K_g )
	{
		Value	0.01;
		Fixed	1;
	}
	
	Variable Variable( khPPAse )
	{
		Value	0.087;
		Fixed	1;
	}
	
	Variable Variable( K_h )
	{
		Value	0.01;
		Fixed	1;
	}
	
	Variable Variable( kc )
	{
		Value	0.1;
		Fixed	1;
	}
	
	Variable Variable( K_c )
	{
		Value	0.01;
		Fixed	1;
	}
	
	Variable Variable( kd_anti_IE )
	{
		Value	0.095;
		Fixed	1;
	}
	
	Variable Variable( K_d )
	{
		Value	0.01;
		Fixed	1;
	}
	
	Variable Variable( total_cyclin )
	{
		Value	100.0;
	}
	
	Variable Variable( Y15P )
	{
		Value	0.0;
	}
	
	
}

System System( /SBMLRule )
{
	Name	"System for SBML Rule";
	StepperID	Default;

	Process ExpressionAssignmentProcess( Assignment_cdc2 )
	{
		StepperID	Default;
		Name	"Assignment rule for 'cdc2'";
		Expression	"total_cdc2.NumberConc - (dimer.NumberConc + p_dimer.NumberConc + p_dimer_p.NumberConc + dimer_p.NumberConc)";
		VariableReferenceList
			[ cdc2       Variable:/cytoplasm:cdc2           1 ]
			[ total_cdc2 Variable:/SBMLParameter:total_cdc2 0 ]
			[ dimer      Variable:/cytoplasm:dimer          0 ]
			[ p_dimer    Variable:/cytoplasm:p_dimer        0 ]
			[ p_dimer_p  Variable:/cytoplasm:p_dimer_p      0 ]
			[ dimer_p    Variable:/cytoplasm:dimer_p        0 ];
	}
	
	Process ExpressionAssignmentProcess( Assignment_cdc25 )
	{
		StepperID	Default;
		Name	"Assignment rule for 'cdc25'";
		Expression	"total_cdc25.NumberConc - cdc25_p.NumberConc";
		VariableReferenceList
			[ cdc25       Variable:/cytoplasm:cdc25           1 ]
			[ total_cdc25 Variable:/SBMLParameter:total_cdc25 0 ]
			[ cdc25_p     Variable:/cytoplasm:cdc25_p         0 ];
	}
	
	Process ExpressionAssignmentProcess( Assignment_wee1 )
	{
		StepperID	Default;
		Name	"Assignment rule for 'wee1'";
		Expression	"total_wee1.NumberConc - wee1_p.NumberConc";
		VariableReferenceList
			[ wee1       Variable:/cytoplasm:wee1           1 ]
			[ total_wee1 Variable:/SBMLParameter:total_wee1 0 ]
			[ wee1_p     Variable:/cytoplasm:wee1_p         0 ];
	}
	
	Process ExpressionAssignmentProcess( Assignment_IE )
	{
		StepperID	Default;
		Name	"Assignment rule for 'IE'";
		Expression	"total_IE.NumberConc - IE_p.NumberConc";
		VariableReferenceList
			[ IE       Variable:/cytoplasm:IE           1 ]
			[ total_IE Variable:/SBMLParameter:total_IE 0 ]
			[ IE_p     Variable:/cytoplasm:IE_p         0 ];
	}
	
	Process ExpressionAssignmentProcess( Assignment_UbE )
	{
		StepperID	Default;
		Name	"Assignment rule for 'UbE'";
		Expression	"total_UbE.NumberConc - UbE_star.NumberConc";
		VariableReferenceList
			[ UbE       Variable:/cytoplasm:UbE           1 ]
			[ total_UbE Variable:/SBMLParameter:total_UbE 0 ]
			[ UbE_star  Variable:/cytoplasm:UbE_star      0 ];
	}
	
	Process ExpressionAssignmentProcess( Assignment_k25 )
	{
		StepperID	Default;
		Name	"Assignment rule for 'k25'";
		Expression	"V25_prime.NumberConc * (total_cdc25.NumberConc - cdc25_p.NumberConc) + V25_double_prime.NumberConc * cdc25_p.NumberConc";
		VariableReferenceList
			[ k25              Variable:/SBMLParameter:k25              1 ]
			[ V25_prime        Variable:/SBMLParameter:V25_prime        0 ]
			[ total_cdc25      Variable:/SBMLParameter:total_cdc25      0 ]
			[ cdc25_p          Variable:/cytoplasm:cdc25_p              0 ]
			[ V25_double_prime Variable:/SBMLParameter:V25_double_prime 0 ];
	}
	
	Process ExpressionAssignmentProcess( Assignment_kwee )
	{
		StepperID	Default;
		Name	"Assignment rule for 'kwee'";
		Expression	"Vwee_prime.NumberConc * wee1_p.NumberConc + Vwee_double_prime.NumberConc * (total_wee1.NumberConc - wee1_p.NumberConc)";
		VariableReferenceList
			[ kwee              Variable:/SBMLParameter:kwee              1 ]
			[ Vwee_prime        Variable:/SBMLParameter:Vwee_prime        0 ]
			[ wee1_p            Variable:/cytoplasm:wee1_p                0 ]
			[ Vwee_double_prime Variable:/SBMLParameter:Vwee_double_prime 0 ]
			[ total_wee1        Variable:/SBMLParameter:total_wee1        0 ];
	}
	
	Process ExpressionAssignmentProcess( Assignment_k2 )
	{
		StepperID	Default;
		Name	"Assignment rule for 'k2'";
		Expression	"V2_prime.NumberConc * (total_UbE.NumberConc - UbE_star.NumberConc) + V2_double_prime.NumberConc * UbE_star.NumberConc";
		VariableReferenceList
			[ k2              Variable:/SBMLParameter:k2              1 ]
			[ V2_prime        Variable:/SBMLParameter:V2_prime        0 ]
			[ total_UbE       Variable:/SBMLParameter:total_UbE       0 ]
			[ UbE_star        Variable:/cytoplasm:UbE_star            0 ]
			[ V2_double_prime Variable:/SBMLParameter:V2_double_prime 0 ];
	}
	
	Process ExpressionAssignmentProcess( Assignment_total_cyclin )
	{
		StepperID	Default;
		Name	"Assignment rule for 'total_cyclin'";
		Expression	"cyclin.NumberConc + dimer.NumberConc + dimer_p.NumberConc + p_dimer.NumberConc + p_dimer_p.NumberConc";
		VariableReferenceList
			[ total_cyclin Variable:/SBMLParameter:total_cyclin 1 ]
			[ cyclin       Variable:/cytoplasm:cyclin           0 ]
			[ dimer        Variable:/cytoplasm:dimer            0 ]
			[ dimer_p      Variable:/cytoplasm:dimer_p          0 ]
			[ p_dimer      Variable:/cytoplasm:p_dimer          0 ]
			[ p_dimer_p    Variable:/cytoplasm:p_dimer_p        0 ];
	}
	
	Process ExpressionAssignmentProcess( Assignment_Y15P )
	{
		StepperID	Default;
		Name	"Assignment rule for 'Y15P'";
		Expression	"p_dimer.NumberConc + p_dimer_p.NumberConc";
		VariableReferenceList
			[ Y15P      Variable:/SBMLParameter:Y15P  1 ]
			[ p_dimer   Variable:/cytoplasm:p_dimer   0 ]
			[ p_dimer_p Variable:/cytoplasm:p_dimer_p 0 ];
	}
	
	
}

