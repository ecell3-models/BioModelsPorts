
# created by eml2em program
# from file: BIOMD0000000025.eml, date: Sat Mar  1 16:52:02 2014
#

Stepper FixedODE1Stepper( Default )
{
	# no property
}

System System( / )
{
	StepperID	Default;
	Name	default;

	Process ExpressionFluxProcess( rPer )
	{
		Name	"Per production";
		Expression	"Vsp.Value * (dClkF_tau1.Value / (K1.Value + dClkF_tau1.Value)) * CELL.Value";
		VariableReferenceList
			[ EmptySet   Variable:/CELL:EmptySet            0 ]
			[ Per        Variable:/CELL:Per                 1 ]
			[ dClkF      Variable:/CELL:dClkF               0 ]
			[ Vsp        Variable:/SBMLParameter:Vsp        0 ]
			[ dClkF_tau1 Variable:/SBMLParameter:dClkF_tau1 0 ]
			[ K1         Variable:/SBMLParameter:K1         0 ]
			[ CELL       Variable:/CELL:SIZE                0 ];
	}
	
	Process ExpressionFluxProcess( rdClk )
	{
		Name	"dClk production";
		Expression	"CELL.Value * Vsc.Value * (K2.Value / (K2.Value + dClkF_tau2.Value))";
		VariableReferenceList
			[ EmptySet   Variable:/CELL:EmptySet            0 ]
			[ dClk       Variable:/CELL:dClk                1 ]
			[ dClkF      Variable:/CELL:dClkF               0 ]
			[ CELL       Variable:/CELL:SIZE                0 ]
			[ Vsc        Variable:/SBMLParameter:Vsc        0 ]
			[ K2         Variable:/SBMLParameter:K2         0 ]
			[ dClkF_tau2 Variable:/SBMLParameter:dClkF_tau2 0 ];
	}
	
	Process ExpressionFluxProcess( rPerD )
	{
		Name	"Per degradation";
		Expression	"kdc.Value * Per.NumberConc * CELL.Value";
		VariableReferenceList
			[ Per      Variable:/CELL:Per          -1 ]
			[ EmptySet Variable:/CELL:EmptySet     0  ]
			[ kdc      Variable:/SBMLParameter:kdc 0  ]
			[ CELL     Variable:/CELL:SIZE         0  ];
	}
	
	Process ExpressionFluxProcess( rdClkD )
	{
		Name	"dClk degradation";
		Expression	"kdp.Value * dClk.NumberConc * CELL.Value";
		VariableReferenceList
			[ dClk     Variable:/CELL:dClk         -1 ]
			[ EmptySet Variable:/CELL:EmptySet     0  ]
			[ kdp      Variable:/SBMLParameter:kdp 0  ]
			[ CELL     Variable:/CELL:SIZE         0  ];
	}
	
	
}

System System( /CELL )
{
	StepperID	Default;

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
		NumberConc	0.0;
		Fixed	1;
	}
	
	Variable Variable( Per )
	{
		NumberConc	5e-16;
		Fixed	0;
	}
	
	Variable Variable( dClk )
	{
		NumberConc	1e-16;
		Fixed	0;
	}
	
	Variable Variable( dClkF )
	{
		Name	"free dClk";
		NumberConc	0.0;
		Fixed	0;
	}
	
	
}

System System( /SBMLParameter )
{
	StepperID	Default;
	Name	"Global Parameter";

	Variable Variable( dClkF_tau1 )
	{
		Name	dClkF_tau1;
		Value	0.0;
	}
	
	Variable Variable( dClkF_tau2 )
	{
		Name	dClkF_tau2;
		Value	0.0;
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
	StepperID	Default;

	Process ExpressionAssignmentProcess( Assignment_dClkF )
	{
		StepperID	Default;
		Name	"Assignment rule for 'dClkF'";
		Expression	"piecewise(0, lt(dClk.NumberConc - Per.NumberConc, 0), dClk.NumberConc - Per.NumberConc)";
		VariableReferenceList
			[ dClkF Variable:/CELL:dClkF 1 ]
			[ dClk  Variable:/CELL:dClk  0 ]
			[ Per   Variable:/CELL:Per   0 ];
	}
	
	Process ExpressionAssignmentProcess( Assignment_dClkF_tau1 )
	{
		StepperID	Default;
		Name	"Assignment rule for 'dClkF_tau1'";
		Expression	"piecewise(0, lt(delay(dClk.NumberConc, tau1.NumberConc) - delay(Per.NumberConc, tau1.NumberConc), 0), delay(dClk.NumberConc, tau1.NumberConc) - delay(Per.NumberConc, tau1.NumberConc))";
		VariableReferenceList
			[ dClkF_tau1 Variable:/SBMLParameter:dClkF_tau1 1 ]
			[ dClk       Variable:/CELL:dClk                0 ]
			[ tau1       Variable:/SBMLParameter:tau1       0 ]
			[ Per        Variable:/CELL:Per                 0 ];
	}
	
	Process ExpressionAssignmentProcess( Assignment_dClkF_tau2 )
	{
		StepperID	Default;
		Name	"Assignment rule for 'dClkF_tau2'";
		Expression	"piecewise(0, lt(delay(dClk.NumberConc, tau2.NumberConc) - delay(Per.NumberConc, tau2.NumberConc), 0), delay(dClk.NumberConc, tau2.NumberConc) - delay(Per.NumberConc, tau2.NumberConc))";
		VariableReferenceList
			[ dClkF_tau2 Variable:/SBMLParameter:dClkF_tau2 1 ]
			[ dClk       Variable:/CELL:dClk                0 ]
			[ tau2       Variable:/SBMLParameter:tau2       0 ]
			[ Per        Variable:/CELL:Per                 0 ];
	}
	
	
}

