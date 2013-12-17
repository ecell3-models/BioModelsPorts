
# created by eml2em program
# from file: BIOMD0000000025.eml, date: Mon Dec 16 22:40:18 2013
#
# BIOMD0000000025 - Smolen2002_CircClock
# 
# Smolen P, Baxter DA, Byrne JH. 
# A reduced model clarifies the role of feedback loops and time delays in the Drosophila circadian oscillator. 
# Biophys. J. 2002 Nov; 83(5): 2349-2359 
# Department of Neurobiology and Anatomy, W. M. Keck Center for the Neurobiology of Learning and Memory, The University of Texas-Houston Medical School, Houston, TX 77225, USA.


##### Steppers #####

Stepper FixedODE1Stepper( DE ) {}
Stepper DiscreteTimeStepper( DT ) {}

##### Model Entities #####

System System( / )
{
	StepperID	DE;
	Name	Default;

	Process ExpressionFluxProcess( rPer )
	{
		Name	"Per production";
		Expression	"Param0.Value * (Param1.Value / (Param2.Value + Param1.Value)) * CELL.Value";
		VariableReferenceList	
			[ S0 Variable:/CELL:EmptySet 0 ]
			[ P0 Variable:/CELL:Per 1 ]
			[ C0 Variable:/CELL:dClkF 0 ]
			[ Param0 Variable:/SBMLParameter:Vsp 0 ]
			[ Param1 Variable:/SBMLParameter:dClkF_tau1 0 ]
			[ Param2 Variable:/SBMLParameter:K1 0 ]
			[ CELL Variable:/CELL:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( rdClk )
	{
		Name	"dClk production";
		Expression	"CELL.Value * Param0.Value * (Param1.Value / (Param1.Value + Param2.Value))";
		VariableReferenceList	
			[ S0 Variable:/CELL:EmptySet 0 ]
			[ P0 Variable:/CELL:dClk 1 ]
			[ C0 Variable:/CELL:dClkF 0 ]
			[ CELL Variable:/CELL:SIZE 0 ]
			[ Param0 Variable:/SBMLParameter:Vsc 0 ]
			[ Param1 Variable:/SBMLParameter:K2 0 ]
			[ Param2 Variable:/SBMLParameter:dClkF_tau2 0 ];
	}
	
	Process ExpressionFluxProcess( rPerD )
	{
		Name	"Per degradation";
		Expression	"Param0.Value * (S0.Value / CELL.Value) * CELL.Value";
		VariableReferenceList	
			[ S0 Variable:/CELL:Per -1 ]
			[ P0 Variable:/CELL:EmptySet 0 ]
			[ Param0 Variable:/SBMLParameter:kdc 0 ]
			[ CELL Variable:/CELL:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( rdClkD )
	{
		Name	"dClk degradation";
		Expression	"Param0.Value * (S0.Value / CELL.Value) * CELL.Value";
		VariableReferenceList	
			[ S0 Variable:/CELL:dClk -1 ]
			[ P0 Variable:/CELL:EmptySet 0 ]
			[ Param0 Variable:/SBMLParameter:kdp 0 ]
			[ CELL Variable:/CELL:SIZE 0 ];
	}
	
	
}

System System( /CELL )
{
	StepperID	DE;

	Variable Variable( Dimensions )
	{
		Value	3;
	}
	
	Variable Variable( SIZE )
	{
		Value	1e-15;
		Fixed	1;
	}
	
	Variable Variable( EmptySet )
	{
		Value	0.0;
		Fixed	1;
	}
	
	Variable Variable( Per )
	{
		Value	5e-31;
		Fixed	0;
	}
	
	Variable Variable( dClk )
	{
		Value	1e-31;
		Fixed	0;
	}
	
	Variable Variable( dClkF )
	{
		Name	"free dClk";
		Value	0.0;
		Fixed	0;
	}
	
	
}

System System( /SBMLParameter )
{
	StepperID	DE;
	Name	"Global Parameter";

	Variable Variable( dClkF_tau1 )
	{
		Name	dClkF_tau1;
		Value	0.0;  ####FIXME_INITIAL_VALUE####
	}
	
	Variable Variable( dClkF_tau2 )
	{
		Name	dClkF_tau2;
		Value	0.0;  ####FIXME_INITIAL_VALUE####
	}
	
	Variable Variable( tau1 )
	{
		Name	tau1;
		Value	10.0;
		Fixed	1;
	}
	
	Variable Variable( tau2 )
	{
		Name	tau2;
		Value	10.0;
		Fixed	1;
	}
	
	Variable Variable( Vsp )
	{
		Name	Vsp;
		Value	0.5;
		Fixed	1;
	}
	
	Variable Variable( K1 )
	{
		Name	K1;
		Value	0.3;
		Fixed	1;
	}
	
	Variable Variable( Vsc )
	{
		Name	Vsc;
		Value	0.25;
		Fixed	1;
	}
	
	Variable Variable( K2 )
	{
		Name	K2;
		Value	0.1;
		Fixed	1;
	}
	
	Variable Variable( kdc )
	{
		Name	kdc;
		Value	0.5;
		Fixed	1;
	}
	
	Variable Variable( kdp )
	{
		Name	kdp;
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
		Expression	"geq(E0.Value - E1.Value, 0) * (E0.Value - E1.Value)";
		VariableReferenceList	
			[ V0 Variable:/CELL:dClkF 1 ]
			[ E0 Variable:/CELL:dClk 0 ]
			[ E1 Variable:/CELL:Per 0 ]
			[ CELL Variable:/CELL:SIZE 0 ];
	}
	
	Process ExpressionAssignmentProcess( Rule2 )
	{
		Expression	"geq(delay(E0.Value, E2.Value) - delay(E1.Value, E2.Value), 0) * ( delay(E0.Value, E2.Value) - delay(E1.Value, E2.Value)))";
		VariableReferenceList	
			[ E0 Variable:/CELL:dClk 0 ]
			[ E1 Variable:/CELL:Per 0 ]
			[ E2 Variable:/SBMLParameter:tau1 0 ]
			[ P0 Variable:/SBMLParameter:dClkF_tau1 1 ];
	}
	
	Process ExpressionAssignmentProcess( Rule3 )
	{
		Expression	"piecewise(0, lt(delay(E0.Value, E2.Value) - delay(E1.Value, E2.Value), 0), delay(E0.Value, E2.Value) - delay(E1.Value, E2.Value))";
		VariableReferenceList	
			[ E0 Variable:/CELL:dClk 0 ]
			[ E1 Variable:/CELL:Per 0 ]
			[ E2 Variable:/SBMLParameter:tau2 0 ]
			[ P0 Variable:/SBMLParameter:dClkF_tau2 1 ];
	}
	
	
}

