
# created by eml2em program
# from file: BIOMD0000000058.eml, date: Sun Mar  2 01:25:10 2014
#

Stepper ODEStepper( Default )
{
	# no property
}

System System( / )
{
	StepperID	Default;
	Name	default;

	Process ExpressionFluxProcess( Jreceptor_Cell1 )
	{
		Name	"IP3R mediated Ca release Cell1";
		kf	28.0;
		p	0.2778;
		Expression	"compartment.Value * kf * pow(p * h1.NumberConc * Phi1_c1.Value / (Phi1_c1.Value * p + Phi_minus1_c1.Value), 4)";
		VariableReferenceList
			[ c1            Variable:/compartment:c1              1 ]
			[ h1            Variable:/compartment:h1              0 ]
			[ compartment   Variable:/compartment:SIZE            0 ]
			[ Phi1_c1       Variable:/SBMLParameter:Phi1_c1       0 ]
			[ Phi_minus1_c1 Variable:/SBMLParameter:Phi_minus1_c1 0 ];
	}
	
	Process ExpressionFluxProcess( Jpump_Cell1 )
	{
		Name	"ATPase pump mediated Ca efflux Cell1";
		Vp	1.2;
		Kp	0.18;
		Expression	"compartment.Value * (Vp * pow(c1.NumberConc, 2) / (pow(Kp, 2) + pow(c1.NumberConc, 2)))";
		VariableReferenceList
			[ c1          Variable:/compartment:c1   -1 ]
			[ compartment Variable:/compartment:SIZE 0  ];
	}
	
	Process ExpressionFluxProcess( Jleak_Cell1 )
	{
		Name	"IP3R independent Ca release Cell1";
		Jleak	0.2;
		Expression	"compartment.Value * Jleak";
		VariableReferenceList
			[ c1          Variable:/compartment:c1   1 ]
			[ compartment Variable:/compartment:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( Inactivated_to_S_Cell1 )
	{
		Name	"Inactivated to Shut state transition Cell1";
		Expression	"compartment.Value * Phi3_c1.Value * (1 - h1.NumberConc)";
		VariableReferenceList
			[ h1          Variable:/compartment:h1        1 ]
			[ compartment Variable:/compartment:SIZE      0 ]
			[ Phi3_c1     Variable:/SBMLParameter:Phi3_c1 0 ];
	}
	
	Process ExpressionFluxProcess( Open_to_Inactivated_Cell1 )
	{
		Name	"Open to Inactivated state transition Cell1";
		p	0.2778;
		Expression	"compartment.Value * Phi1_c1.Value * Phi2_c1.Value * h1.NumberConc * p / (Phi1_c1.Value * p + Phi_minus1_c1.Value)";
		VariableReferenceList
			[ h1            Variable:/compartment:h1              -1 ]
			[ compartment   Variable:/compartment:SIZE            0  ]
			[ Phi1_c1       Variable:/SBMLParameter:Phi1_c1       0  ]
			[ Phi2_c1       Variable:/SBMLParameter:Phi2_c1       0  ]
			[ Phi_minus1_c1 Variable:/SBMLParameter:Phi_minus1_c1 0  ];
	}
	
	Process ExpressionFluxProcess( Jreceptor_Cell2 )
	{
		Name	"IP3R mediated Ca release Cell2";
		kf	28.0;
		p	0.2778;
		Expression	"compartment.Value * kf * pow(p * h2.NumberConc * Phi1_c2.Value / (Phi1_c2.Value * p + Phi_minus1_c2.Value), 4)";
		VariableReferenceList
			[ c2            Variable:/compartment:c2              1 ]
			[ h2            Variable:/compartment:h2              0 ]
			[ compartment   Variable:/compartment:SIZE            0 ]
			[ Phi1_c2       Variable:/SBMLParameter:Phi1_c2       0 ]
			[ Phi_minus1_c2 Variable:/SBMLParameter:Phi_minus1_c2 0 ];
	}
	
	Process ExpressionFluxProcess( Jpump_Cell2 )
	{
		Name	"ATPase pump mediated Ca efflux Cell2";
		Vp	1.2;
		Kp	0.18;
		Expression	"compartment.Value * Vp * pow(c2.NumberConc, 2) / (pow(Kp, 2) + pow(c2.NumberConc, 2))";
		VariableReferenceList
			[ c2          Variable:/compartment:c2   -1 ]
			[ compartment Variable:/compartment:SIZE 0  ];
	}
	
	Process ExpressionFluxProcess( Jleak_Cell2 )
	{
		Name	"IP3R independent Ca release Cell2";
		Jleak	0.2;
		Expression	"compartment.Value * Jleak";
		VariableReferenceList
			[ c2          Variable:/compartment:c2   1 ]
			[ compartment Variable:/compartment:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( Inactivated_to_S_Cell2 )
	{
		Name	"Inactivated to Shut state transition Cell2";
		Expression	"compartment.Value * Phi3_c2.Value * (1 - h2.NumberConc)";
		VariableReferenceList
			[ h2          Variable:/compartment:h2        1 ]
			[ compartment Variable:/compartment:SIZE      0 ]
			[ Phi3_c2     Variable:/SBMLParameter:Phi3_c2 0 ];
	}
	
	Process ExpressionFluxProcess( Open_to_Inactivated_Cell2 )
	{
		Name	"Open to Inactivated state transition Cell2";
		p	0.2778;
		Expression	"compartment.Value * Phi1_c2.Value * Phi2_c2.Value * h2.NumberConc * p / (Phi1_c2.Value * p + Phi_minus1_c2.Value)";
		VariableReferenceList
			[ h2            Variable:/compartment:h2              -1 ]
			[ compartment   Variable:/compartment:SIZE            0  ]
			[ Phi1_c2       Variable:/SBMLParameter:Phi1_c2       0  ]
			[ Phi2_c2       Variable:/SBMLParameter:Phi2_c2       0  ]
			[ Phi_minus1_c2 Variable:/SBMLParameter:Phi_minus1_c2 0  ];
	}
	
	Process ExpressionFluxProcess( diffusion )
	{
		Name	"Diffusion of Ca between cells";
		D	0.01;
		Expression	"compartment.Value * D * (c2.NumberConc - c1.NumberConc)";
		VariableReferenceList
			[ c2          Variable:/compartment:c2   -1 ]
			[ c1          Variable:/compartment:c1   1  ]
			[ compartment Variable:/compartment:SIZE 0  ];
	}
	
	
}

System System( /compartment )
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
	
	Variable Variable( c1 )
	{
		Name	"Calcium ion Cell1";
		NumberConc	0.3;
		Fixed	0;
	}
	
	Variable Variable( h1 )
	{
		Name	"Receptor fraction Cell1";
		NumberConc	0.8;
		Fixed	0;
	}
	
	Variable Variable( c2 )
	{
		Name	"Calcium ion Cell2";
		NumberConc	0.1;
		Fixed	0;
	}
	
	Variable Variable( h2 )
	{
		Name	"Receptor fraction Cell2";
		NumberConc	0.1;
		Fixed	0;
	}
	
	
}

System System( /SBMLParameter )
{
	StepperID	Default;
	Name	"Global Parameter";

	Variable Variable( Phi1_c1 )
	{
		Value	4.7619047619;
	}
	
	Variable Variable( r2 )
	{
		Value	100.0;
		Fixed	1;
	}
	
	Variable Variable( R1 )
	{
		Value	6.0;
		Fixed	1;
	}
	
	Variable Variable( Phi_minus1_c1 )
	{
		Value	0.874751491054;
	}
	
	Variable Variable( k1 )
	{
		Value	44.0;
		Fixed	1;
	}
	
	Variable Variable( R3 )
	{
		Value	50.0;
		Fixed	1;
	}
	
	Variable Variable( Phi2_c1 )
	{
		Value	0.646123260437;
	}
	
	Variable Variable( k2 )
	{
		Value	26.5;
		Fixed	1;
	}
	
	Variable Variable( r4 )
	{
		Value	20.0;
		Fixed	1;
	}
	
	Variable Variable( Phi3_c1 )
	{
		Value	0.842105263158;
	}
	
	Variable Variable( k3 )
	{
		Value	1.6;
		Fixed	1;
	}
	
	Variable Variable( R5 )
	{
		Value	1.6;
		Fixed	1;
	}
	
	Variable Variable( Phi1_c2 )
	{
		Value	1.6393442623;
	}
	
	Variable Variable( Phi_minus1_c2 )
	{
		Value	0.878243512974;
	}
	
	Variable Variable( Phi2_c2 )
	{
		Value	0.568862275449;
	}
	
	Variable Variable( Phi3_c2 )
	{
		Value	0.941176470588;
	}
	
	
}

System System( /SBMLRule )
{
	Name	"System for SBML Rule";
	StepperID	Default;

	Process ExpressionAssignmentProcess( Assignment_Phi1_c1 )
	{
		StepperID	Default;
		Name	"Assignment rule for 'Phi1_c1'";
		Expression	"r2.NumberConc * c1.NumberConc / (R1.NumberConc + c1.NumberConc)";
		VariableReferenceList
			[ Phi1_c1 Variable:/SBMLParameter:Phi1_c1 1 ]
			[ r2      Variable:/SBMLParameter:r2      0 ]
			[ c1      Variable:/compartment:c1        0 ]
			[ R1      Variable:/SBMLParameter:R1      0 ];
	}
	
	Process ExpressionAssignmentProcess( Assignment_Phi_minus1_c1 )
	{
		StepperID	Default;
		Name	"Assignment rule for 'Phi_minus1_c1'";
		Expression	"k1.NumberConc / (R3.NumberConc + c1.NumberConc)";
		VariableReferenceList
			[ Phi_minus1_c1 Variable:/SBMLParameter:Phi_minus1_c1 1 ]
			[ k1            Variable:/SBMLParameter:k1            0 ]
			[ R3            Variable:/SBMLParameter:R3            0 ]
			[ c1            Variable:/compartment:c1              0 ];
	}
	
	Process ExpressionAssignmentProcess( Assignment_Phi2_c1 )
	{
		StepperID	Default;
		Name	"Assignment rule for 'Phi2_c1'";
		Expression	"(k2.NumberConc + r4.NumberConc * c1.NumberConc) / (R3.NumberConc + c1.NumberConc)";
		VariableReferenceList
			[ Phi2_c1 Variable:/SBMLParameter:Phi2_c1 1 ]
			[ k2      Variable:/SBMLParameter:k2      0 ]
			[ r4      Variable:/SBMLParameter:r4      0 ]
			[ c1      Variable:/compartment:c1        0 ]
			[ R3      Variable:/SBMLParameter:R3      0 ];
	}
	
	Process ExpressionAssignmentProcess( Assignment_Phi3_c1 )
	{
		StepperID	Default;
		Name	"Assignment rule for 'Phi3_c1'";
		Expression	"k3.NumberConc / (R5.NumberConc + c1.NumberConc)";
		VariableReferenceList
			[ Phi3_c1 Variable:/SBMLParameter:Phi3_c1 1 ]
			[ k3      Variable:/SBMLParameter:k3      0 ]
			[ R5      Variable:/SBMLParameter:R5      0 ]
			[ c1      Variable:/compartment:c1        0 ];
	}
	
	Process ExpressionAssignmentProcess( Assignment_Phi1_c2 )
	{
		StepperID	Default;
		Name	"Assignment rule for 'Phi1_c2'";
		Expression	"r2.NumberConc * c2.NumberConc / (R1.NumberConc + c2.NumberConc)";
		VariableReferenceList
			[ Phi1_c2 Variable:/SBMLParameter:Phi1_c2 1 ]
			[ r2      Variable:/SBMLParameter:r2      0 ]
			[ c2      Variable:/compartment:c2        0 ]
			[ R1      Variable:/SBMLParameter:R1      0 ];
	}
	
	Process ExpressionAssignmentProcess( Assignment_Phi_minus1_c2 )
	{
		StepperID	Default;
		Name	"Assignment rule for 'Phi_minus1_c2'";
		Expression	"k1.NumberConc / (R3.NumberConc + c2.NumberConc)";
		VariableReferenceList
			[ Phi_minus1_c2 Variable:/SBMLParameter:Phi_minus1_c2 1 ]
			[ k1            Variable:/SBMLParameter:k1            0 ]
			[ R3            Variable:/SBMLParameter:R3            0 ]
			[ c2            Variable:/compartment:c2              0 ];
	}
	
	Process ExpressionAssignmentProcess( Assignment_Phi2_c2 )
	{
		StepperID	Default;
		Name	"Assignment rule for 'Phi2_c2'";
		Expression	"(k2.NumberConc + r4.NumberConc * c2.NumberConc) / (R3.NumberConc + c2.NumberConc)";
		VariableReferenceList
			[ Phi2_c2 Variable:/SBMLParameter:Phi2_c2 1 ]
			[ k2      Variable:/SBMLParameter:k2      0 ]
			[ r4      Variable:/SBMLParameter:r4      0 ]
			[ c2      Variable:/compartment:c2        0 ]
			[ R3      Variable:/SBMLParameter:R3      0 ];
	}
	
	Process ExpressionAssignmentProcess( Assignment_Phi3_c2 )
	{
		StepperID	Default;
		Name	"Assignment rule for 'Phi3_c2'";
		Expression	"k3.NumberConc / (R5.NumberConc + c2.NumberConc)";
		VariableReferenceList
			[ Phi3_c2 Variable:/SBMLParameter:Phi3_c2 1 ]
			[ k3      Variable:/SBMLParameter:k3      0 ]
			[ R5      Variable:/SBMLParameter:R5      0 ]
			[ c2      Variable:/compartment:c2        0 ];
	}
	
	
}

