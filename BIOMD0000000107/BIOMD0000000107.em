
# created by eml2em program
# from file: BIOMD0000000107.eml, date: Mon Dec 16 22:55:22 2013
#
# BIOMD0000000107 - Novak1993_M_phase_control
# 
# Novak B, Tyson JJ. 
# Numerical analysis of a comprehensive model of M-phase control in Xenopus oocyte extracts and intact embryos. 
# J. Cell. Sci. 1993 Dec; 106 ( Pt 4): 1153-1168 
# Department of Biology, Virginia Polytechnic Institute and State University, Blacksburg 24060-0406.


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
		Name	"cyclin synthesis";
		Expression	"Param0.Value";
		VariableReferenceList	
			[ P0 Variable:/cytoplasm:cyclin 1 ]
			[ Param0 Variable:/SBMLParameter:k1AA 0 ];
	}
	
	Process ExpressionFluxProcess( R2 )
	{
		Name	"cyclin degradation";
		Expression	"Param0.Value * (S0.Value / cytoplasm.Value)";
		VariableReferenceList	
			[ S0 Variable:/cytoplasm:cyclin -1 ]
			[ Param0 Variable:/SBMLParameter:k2 0 ]
			[ cytoplasm Variable:/cytoplasm:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( R3 )
	{
		Name	"cyclin-cdc2 dimer formation";
		Expression	"Param0.Value * (S0.Value / cytoplasm.Value) * (C0.Value / cytoplasm.Value)";
		VariableReferenceList	
			[ S0 Variable:/cytoplasm:cyclin -1 ]
			[ P0 Variable:/cytoplasm:dimer 1 ]
			[ C0 Variable:/cytoplasm:cdc2 0 ]
			[ Param0 Variable:/SBMLParameter:k3 0 ]
			[ cytoplasm Variable:/cytoplasm:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( R4 )
	{
		Name	"Thr161 dephosphorylation";
		Expression	"Param0.Value * (S0.Value / cytoplasm.Value)";
		VariableReferenceList	
			[ S0 Variable:/cytoplasm:dimer_p -1 ]
			[ P0 Variable:/cytoplasm:dimer 1 ]
			[ Param0 Variable:/SBMLParameter:kinh 0 ]
			[ cytoplasm Variable:/cytoplasm:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( R5 )
	{
		Name	"Tyr15 phosphorylation";
		Expression	"Param0.Value * (S0.Value / cytoplasm.Value)";
		VariableReferenceList	
			[ S0 Variable:/cytoplasm:dimer -1 ]
			[ P0 Variable:/cytoplasm:p_dimer 1 ]
			[ Param0 Variable:/SBMLParameter:kwee 0 ]
			[ cytoplasm Variable:/cytoplasm:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( R6 )
	{
		Name	"Thr161 phosphorylation";
		Expression	"Param0.Value * (S0.Value / cytoplasm.Value)";
		VariableReferenceList	
			[ S0 Variable:/cytoplasm:dimer -1 ]
			[ P0 Variable:/cytoplasm:dimer_p 1 ]
			[ Param0 Variable:/SBMLParameter:kcak 0 ]
			[ cytoplasm Variable:/cytoplasm:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( R7 )
	{
		Name	"cyclin degradation";
		Expression	"Param0.Value * (S0.Value / cytoplasm.Value)";
		VariableReferenceList	
			[ S0 Variable:/cytoplasm:dimer -1 ]
			[ Param0 Variable:/SBMLParameter:k2 0 ]
			[ cytoplasm Variable:/cytoplasm:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( R8 )
	{
		Name	"Tyr15 dephosphorylation";
		Expression	"Param0.Value * (S0.Value / cytoplasm.Value)";
		VariableReferenceList	
			[ S0 Variable:/cytoplasm:p_dimer -1 ]
			[ P0 Variable:/cytoplasm:dimer 1 ]
			[ Param0 Variable:/SBMLParameter:k25 0 ]
			[ cytoplasm Variable:/cytoplasm:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( R9 )
	{
		Name	"Thr161 phosphorylation";
		Expression	"Param0.Value * (S0.Value / cytoplasm.Value)";
		VariableReferenceList	
			[ S0 Variable:/cytoplasm:p_dimer -1 ]
			[ P0 Variable:/cytoplasm:p_dimer_p 1 ]
			[ Param0 Variable:/SBMLParameter:kcak 0 ]
			[ cytoplasm Variable:/cytoplasm:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( R10 )
	{
		Name	"cyclin degradation";
		Expression	"Param0.Value * (S0.Value / cytoplasm.Value)";
		VariableReferenceList	
			[ S0 Variable:/cytoplasm:p_dimer -1 ]
			[ Param0 Variable:/SBMLParameter:k2 0 ]
			[ cytoplasm Variable:/cytoplasm:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( R11 )
	{
		Name	"Thr161 dephosphorylation";
		Expression	"Param0.Value * (S0.Value / cytoplasm.Value)";
		VariableReferenceList	
			[ S0 Variable:/cytoplasm:p_dimer_p -1 ]
			[ P0 Variable:/cytoplasm:p_dimer 1 ]
			[ Param0 Variable:/SBMLParameter:kinh 0 ]
			[ cytoplasm Variable:/cytoplasm:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( R12 )
	{
		Name	"Tyr15 phosphorylation";
		Expression	"Param0.Value * (S0.Value / cytoplasm.Value)";
		VariableReferenceList	
			[ S0 Variable:/cytoplasm:dimer_p -1 ]
			[ P0 Variable:/cytoplasm:p_dimer_p 1 ]
			[ Param0 Variable:/SBMLParameter:kwee 0 ]
			[ cytoplasm Variable:/cytoplasm:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( R13 )
	{
		Name	"Tyr15 dephosphorylation";
		Expression	"Param0.Value * (S0.Value / cytoplasm.Value)";
		VariableReferenceList	
			[ S0 Variable:/cytoplasm:p_dimer_p -1 ]
			[ P0 Variable:/cytoplasm:dimer_p 1 ]
			[ Param0 Variable:/SBMLParameter:k25 0 ]
			[ cytoplasm Variable:/cytoplasm:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( R14 )
	{
		Name	"cyclin degradation";
		Expression	"Param0.Value * (S0.Value / cytoplasm.Value)";
		VariableReferenceList	
			[ S0 Variable:/cytoplasm:p_dimer_p -1 ]
			[ Param0 Variable:/SBMLParameter:k2 0 ]
			[ cytoplasm Variable:/cytoplasm:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( R15 )
	{
		Name	"cyclin degradation";
		Expression	"Param0.Value * (S0.Value / cytoplasm.Value)";
		VariableReferenceList	
			[ S0 Variable:/cytoplasm:dimer_p -1 ]
			[ Param0 Variable:/SBMLParameter:k2 0 ]
			[ cytoplasm Variable:/cytoplasm:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( R17 )
	{
		Name	"cdc25 activation";
		Expression	"Param0.Value * (C0.Value / cytoplasm.Value) * (Param1.Value - P0.Value / cytoplasm.Value) / (Param2.Value + Param1.Value - P0.Value / cytoplasm.Value)";
		VariableReferenceList	
			[ P0 Variable:/cytoplasm:cdc25_p 1 ]
			[ C0 Variable:/cytoplasm:dimer_p 0 ]
			[ Param0 Variable:/SBMLParameter:ka 0 ]
			[ cytoplasm Variable:/cytoplasm:SIZE 0 ]
			[ Param1 Variable:/SBMLParameter:total_cdc25 0 ]
			[ Param2 Variable:/SBMLParameter:K_a 0 ];
	}
	
	Process ExpressionFluxProcess( R18 )
	{
		Name	"cdc25 deactivation";
		Expression	"Param0.Value * (S0.Value / cytoplasm.Value) / (Param1.Value + S0.Value / cytoplasm.Value)";
		VariableReferenceList	
			[ S0 Variable:/cytoplasm:cdc25_p -1 ]
			[ Param0 Variable:/SBMLParameter:kbPPase 0 ]
			[ cytoplasm Variable:/cytoplasm:SIZE 0 ]
			[ Param1 Variable:/SBMLParameter:K_b 0 ];
	}
	
	Process ExpressionFluxProcess( R19 )
	{
		Name	"wee1 deactivation";
		Expression	"Param0.Value * (C0.Value / cytoplasm.Value) * (Param1.Value - P0.Value / cytoplasm.Value) / (Param2.Value + Param1.Value - P0.Value / cytoplasm.Value)";
		VariableReferenceList	
			[ P0 Variable:/cytoplasm:wee1_p 1 ]
			[ C0 Variable:/cytoplasm:dimer_p 0 ]
			[ Param0 Variable:/SBMLParameter:ke 0 ]
			[ cytoplasm Variable:/cytoplasm:SIZE 0 ]
			[ Param1 Variable:/SBMLParameter:total_wee1 0 ]
			[ Param2 Variable:/SBMLParameter:K_e 0 ];
	}
	
	Process ExpressionFluxProcess( R20 )
	{
		Name	"wee1 activation";
		Expression	"Param0.Value * (S0.Value / cytoplasm.Value) / (Param1.Value + S0.Value / cytoplasm.Value)";
		VariableReferenceList	
			[ S0 Variable:/cytoplasm:wee1_p -1 ]
			[ Param0 Variable:/SBMLParameter:kfPPase 0 ]
			[ cytoplasm Variable:/cytoplasm:SIZE 0 ]
			[ Param1 Variable:/SBMLParameter:K_f 0 ];
	}
	
	Process ExpressionFluxProcess( R21 )
	{
		Name	"intermediary enzyme activation";
		Expression	"Param0.Value * (C0.Value / cytoplasm.Value) * (Param1.Value - P0.Value / cytoplasm.Value) / (Param2.Value + Param1.Value - P0.Value / cytoplasm.Value)";
		VariableReferenceList	
			[ P0 Variable:/cytoplasm:IE_p 1 ]
			[ C0 Variable:/cytoplasm:dimer_p 0 ]
			[ Param0 Variable:/SBMLParameter:kg 0 ]
			[ cytoplasm Variable:/cytoplasm:SIZE 0 ]
			[ Param1 Variable:/SBMLParameter:total_IE 0 ]
			[ Param2 Variable:/SBMLParameter:K_g 0 ];
	}
	
	Process ExpressionFluxProcess( R22 )
	{
		Name	"intermediary enzyme deactivation";
		Expression	"Param0.Value * (S0.Value / cytoplasm.Value) / (Param1.Value + S0.Value / cytoplasm.Value)";
		VariableReferenceList	
			[ S0 Variable:/cytoplasm:IE_p -1 ]
			[ Param0 Variable:/SBMLParameter:khPPAse 0 ]
			[ cytoplasm Variable:/cytoplasm:SIZE 0 ]
			[ Param1 Variable:/SBMLParameter:K_h 0 ];
	}
	
	Process ExpressionFluxProcess( R23 )
	{
		Name	"ubiquitin conjugating enzyme activation";
		Expression	"Param0.Value * (C0.Value / cytoplasm.Value) * (Param1.Value - P0.Value / cytoplasm.Value) / (Param2.Value + Param1.Value - P0.Value / cytoplasm.Value)";
		VariableReferenceList	
			[ P0 Variable:/cytoplasm:UbE_star 1 ]
			[ C0 Variable:/cytoplasm:IE_p 0 ]
			[ Param0 Variable:/SBMLParameter:kc 0 ]
			[ cytoplasm Variable:/cytoplasm:SIZE 0 ]
			[ Param1 Variable:/SBMLParameter:total_UbE 0 ]
			[ Param2 Variable:/SBMLParameter:K_c 0 ];
	}
	
	Process ExpressionFluxProcess( R24 )
	{
		Name	"ubiquitin conjugating enzyme deactivation";
		Expression	"Param0.Value * (S0.Value / cytoplasm.Value) / (Param1.Value + S0.Value / cytoplasm.Value)";
		VariableReferenceList	
			[ S0 Variable:/cytoplasm:UbE_star -1 ]
			[ Param0 Variable:/SBMLParameter:kd_anti_IE 0 ]
			[ cytoplasm Variable:/cytoplasm:SIZE 0 ]
			[ Param1 Variable:/SBMLParameter:K_d 0 ];
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
	
	Variable Variable( cyclin )
	{
		Name	cyclin;
		Value	100.0;
		Fixed	0;
	}
	
	Variable Variable( dimer )
	{
		Name	"cyclin-cdc2 dimer";
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( dimer_p )
	{
		Name	"Thr161 phosphorylated dimer(active MPF)";
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( p_dimer )
	{
		Name	"Tyr15 phosphorylated dimer";
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( p_dimer_p )
	{
		Name	"Thr161-Tyr15 phosphorylated dimer";
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( cdc25_p )
	{
		Name	"phosphorylated cdc25";
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( wee1_p )
	{
		Name	"phosphorylated wee1";
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( IE_p )
	{
		Name	"phosphorylated intermediary enzyme";
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( UbE_star )
	{
		Name	"ubiquitin conjugating enzyme";
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( cdc2 )
	{
		Name	cdc2;
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( cdc25 )
	{
		Name	cdc25;
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( wee1 )
	{
		Name	wee1;
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( IE )
	{
		Name	"intermediary enzyme";
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( UbE )
	{
		Name	"ubiquitin conjugating enzyme";
		Value	0.0;
		Fixed	0;
	}
	
	
}

System System( /SBMLParameter )
{
	StepperID	DE;
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
		Value	0.0;
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
		Value	0.0;
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
		Value	0.0;
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
		Value	0.0;
	}
	
	Variable Variable( Y15P )
	{
		Value	0.0;
	}
	
	
}

System System( /SBMLRule )
{
	Name	"System for SBML Rule";
	StepperID	DT;

	Process ExpressionAssignmentProcess( Rule1 )
	{
		Expression	"P0.Value - (V1.Value / cytoplasm.Value + V2.Value / cytoplasm.Value + V3.Value / cytoplasm.Value + V4.Value / cytoplasm.Value)";
		VariableReferenceList	
			[ V0 Variable:/cytoplasm:cdc2 1 ]
			[ cytoplasm Variable:/cytoplasm:SIZE 0 ]
			[ P0 Variable:/SBMLParameter:total_cdc2 0 ]
			[ V1 Variable:/cytoplasm:dimer 0 ]
			[ V2 Variable:/cytoplasm:p_dimer 0 ]
			[ V3 Variable:/cytoplasm:p_dimer_p 0 ]
			[ V4 Variable:/cytoplasm:dimer_p 0 ];
	}
	
	Process ExpressionAssignmentProcess( Rule2 )
	{
		Expression	"P0.Value - V1.Value / cytoplasm.Value";
		VariableReferenceList	
			[ V0 Variable:/cytoplasm:cdc25 1 ]
			[ cytoplasm Variable:/cytoplasm:SIZE 0 ]
			[ P0 Variable:/SBMLParameter:total_cdc25 0 ]
			[ V1 Variable:/cytoplasm:cdc25_p 0 ];
	}
	
	Process ExpressionAssignmentProcess( Rule3 )
	{
		Expression	"P0.Value - V1.Value / cytoplasm.Value";
		VariableReferenceList	
			[ V0 Variable:/cytoplasm:wee1 1 ]
			[ cytoplasm Variable:/cytoplasm:SIZE 0 ]
			[ P0 Variable:/SBMLParameter:total_wee1 0 ]
			[ V1 Variable:/cytoplasm:wee1_p 0 ];
	}
	
	Process ExpressionAssignmentProcess( Rule4 )
	{
		Expression	"P0.Value - V1.Value / cytoplasm.Value";
		VariableReferenceList	
			[ V0 Variable:/cytoplasm:IE 1 ]
			[ cytoplasm Variable:/cytoplasm:SIZE 0 ]
			[ P0 Variable:/SBMLParameter:total_IE 0 ]
			[ V1 Variable:/cytoplasm:IE_p 0 ];
	}
	
	Process ExpressionAssignmentProcess( Rule5 )
	{
		Expression	"P0.Value - V1.Value / cytoplasm.Value";
		VariableReferenceList	
			[ V0 Variable:/cytoplasm:UbE 1 ]
			[ cytoplasm Variable:/cytoplasm:SIZE 0 ]
			[ P0 Variable:/SBMLParameter:total_UbE 0 ]
			[ V1 Variable:/cytoplasm:UbE_star 0 ];
	}
	
	Process ExpressionAssignmentProcess( Rule6 )
	{
		Expression	"P1.Value * (P2.Value - V0.Value / cytoplasm.Value) + P3.Value * (V0.Value / cytoplasm.Value)";
		VariableReferenceList	
			[ P0 Variable:/SBMLParameter:k25 1 ]
			[ P1 Variable:/SBMLParameter:V25_prime 0 ]
			[ P2 Variable:/SBMLParameter:total_cdc25 0 ]
			[ V0 Variable:/cytoplasm:cdc25_p 0 ]
			[ cytoplasm Variable:/cytoplasm:SIZE 0 ]
			[ P3 Variable:/SBMLParameter:V25_double_prime 0 ];
	}
	
	Process ExpressionAssignmentProcess( Rule7 )
	{
		Expression	"P1.Value * (V0.Value / cytoplasm.Value) + P2.Value * (P3.Value - V0.Value / cytoplasm.Value)";
		VariableReferenceList	
			[ P0 Variable:/SBMLParameter:kwee 1 ]
			[ P1 Variable:/SBMLParameter:Vwee_prime 0 ]
			[ V0 Variable:/cytoplasm:wee1_p 0 ]
			[ cytoplasm Variable:/cytoplasm:SIZE 0 ]
			[ P2 Variable:/SBMLParameter:Vwee_double_prime 0 ]
			[ P3 Variable:/SBMLParameter:total_wee1 0 ];
	}
	
	Process ExpressionAssignmentProcess( Rule8 )
	{
		Expression	"P1.Value * (P2.Value - V0.Value / cytoplasm.Value) + P3.Value * (V0.Value / cytoplasm.Value)";
		VariableReferenceList	
			[ P0 Variable:/SBMLParameter:k2 1 ]
			[ P1 Variable:/SBMLParameter:V2_prime 0 ]
			[ P2 Variable:/SBMLParameter:total_UbE 0 ]
			[ V0 Variable:/cytoplasm:UbE_star 0 ]
			[ cytoplasm Variable:/cytoplasm:SIZE 0 ]
			[ P3 Variable:/SBMLParameter:V2_double_prime 0 ];
	}
	
	Process ExpressionAssignmentProcess( Rule9 )
	{
		Expression	"V0.Value / cytoplasm.Value + V1.Value / cytoplasm.Value + V2.Value / cytoplasm.Value + V3.Value / cytoplasm.Value + V4.Value / cytoplasm.Value";
		VariableReferenceList	
			[ P0 Variable:/SBMLParameter:total_cyclin 1 ]
			[ V0 Variable:/cytoplasm:cyclin 0 ]
			[ cytoplasm Variable:/cytoplasm:SIZE 0 ]
			[ V1 Variable:/cytoplasm:dimer 0 ]
			[ V2 Variable:/cytoplasm:dimer_p 0 ]
			[ V3 Variable:/cytoplasm:p_dimer 0 ]
			[ V4 Variable:/cytoplasm:p_dimer_p 0 ];
	}
	
	Process ExpressionAssignmentProcess( Rule10 )
	{
		Expression	"V0.Value / cytoplasm.Value + V1.Value / cytoplasm.Value";
		VariableReferenceList	
			[ P0 Variable:/SBMLParameter:Y15P 1 ]
			[ V0 Variable:/cytoplasm:p_dimer 0 ]
			[ cytoplasm Variable:/cytoplasm:SIZE 0 ]
			[ V1 Variable:/cytoplasm:p_dimer_p 0 ];
	}
	
	
}

