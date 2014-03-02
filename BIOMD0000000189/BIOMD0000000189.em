
# created by eml2em program
# from file: BIOMD0000000189.eml, date: Sun Mar  2 12:22:32 2014
#

Stepper FixedODE1Stepper( Default )
{
	# no property
}

System System( / )
{
	StepperID	Default;
	Name	default;

	Process ExpressionFluxProcess( Mdm2Synthesis )
	{
		Name	"[Mdm2_mRNA] -> [Mdm2_mRNA] + [Mdm2] + [mdm2syn];";
		Expression	"ksynMdm2.Value * Mdm2_mRNA.NumberConc";
		VariableReferenceList
			[ Mdm2_mRNA Variable:/cell:Mdm2_mRNA         0 ]
			[ Mdm2      Variable:/cell:Mdm2              1 ]
			[ mdm2syn   Variable:/cell:mdm2syn           1 ]
			[ ksynMdm2  Variable:/SBMLParameter:ksynMdm2 0 ];
	}
	
	Process ExpressionFluxProcess( Mdm2mRNASynthesis )
	{
		Name	"[p53] -> [p53] + [Mdm2_mRNA] + [Mdm2mRNAsyn];";
		Expression	"ksynMdm2mRNA.Value * p53.NumberConc";
		VariableReferenceList
			[ p53          Variable:/cell:p53                   0 ]
			[ Mdm2_mRNA    Variable:/cell:Mdm2_mRNA             1 ]
			[ Mdm2mRNAsyn  Variable:/cell:Mdm2mRNAsyn           1 ]
			[ ksynMdm2mRNA Variable:/SBMLParameter:ksynMdm2mRNA 0 ];
	}
	
	Process ExpressionFluxProcess( Mdm2mRNADegradation )
	{
		Name	"[Mdm2_mRNA] -> [Sink] + [Mdm2mRNAdeg];";
		Expression	"kdegMdm2mRNA.Value * Mdm2_mRNA.NumberConc";
		VariableReferenceList
			[ Mdm2_mRNA    Variable:/cell:Mdm2_mRNA             -1 ]
			[ Sink         Variable:/cell:Sink                  0  ]
			[ Mdm2mRNAdeg  Variable:/cell:Mdm2mRNAdeg           1  ]
			[ kdegMdm2mRNA Variable:/SBMLParameter:kdegMdm2mRNA 0  ];
	}
	
	Process ExpressionFluxProcess( Mdm2Degradation )
	{
		Name	"[Mdm2] -> [Sink] + [mdm2deg];";
		Expression	"kdegMdm2.Value * Mdm2.NumberConc * kproteff.Value";
		VariableReferenceList
			[ Mdm2     Variable:/cell:Mdm2              -1 ]
			[ Sink     Variable:/cell:Sink              0  ]
			[ mdm2deg  Variable:/cell:mdm2deg           1  ]
			[ kdegMdm2 Variable:/SBMLParameter:kdegMdm2 0  ]
			[ kproteff Variable:/SBMLParameter:kproteff 0  ];
	}
	
	Process ExpressionFluxProcess( p53Synthesis )
	{
		Name	"[Source] -> [p53] + [p53syn];";
		Expression	"ksynp53.Value * Source.NumberConc";
		VariableReferenceList
			[ Source  Variable:/cell:Source           0 ]
			[ p53     Variable:/cell:p53              1 ]
			[ p53syn  Variable:/cell:p53syn           1 ]
			[ ksynp53 Variable:/SBMLParameter:ksynp53 0 ];
	}
	
	Process ExpressionFluxProcess( p53Degradation )
	{
		Name	"[Mdm2_p53] -> [Mdm2] + [p53deg];";
		Expression	"kdegp53.Value * Mdm2_p53.NumberConc * kproteff.Value";
		VariableReferenceList
			[ Mdm2_p53 Variable:/cell:Mdm2_p53          -1 ]
			[ Mdm2     Variable:/cell:Mdm2              1  ]
			[ p53deg   Variable:/cell:p53deg            1  ]
			[ kdegp53  Variable:/SBMLParameter:kdegp53  0  ]
			[ kproteff Variable:/SBMLParameter:kproteff 0  ];
	}
	
	Process ExpressionFluxProcess( P53_Mdm2Binding )
	{
		Name	"[p53] + [Mdm2] -> [Mdm2_p53];";
		Expression	"kbinMdm2p53.Value * p53.NumberConc * Mdm2.NumberConc";
		VariableReferenceList
			[ p53         Variable:/cell:p53                  -1 ]
			[ Mdm2        Variable:/cell:Mdm2                 -1 ]
			[ Mdm2_p53    Variable:/cell:Mdm2_p53             1  ]
			[ kbinMdm2p53 Variable:/SBMLParameter:kbinMdm2p53 0  ];
	}
	
	Process ExpressionFluxProcess( P53_Mdm2Release )
	{
		Name	"[Mdm2_p53] -> [p53] + [Mdm2];";
		Expression	"krelMdm2p53.Value * Mdm2_p53.NumberConc";
		VariableReferenceList
			[ Mdm2_p53    Variable:/cell:Mdm2_p53             -1 ]
			[ p53         Variable:/cell:p53                  1  ]
			[ Mdm2        Variable:/cell:Mdm2                 1  ]
			[ krelMdm2p53 Variable:/SBMLParameter:krelMdm2p53 0  ];
	}
	
	Process ExpressionFluxProcess( DNAdamage )
	{
		Name	"-> [damDNA] + [totdamDNA];";
		Expression	"kdam.Value * IR.Value";
		VariableReferenceList
			[ damDNA    Variable:/cell:damDNA        1 ]
			[ totdamDNA Variable:/cell:totdamDNA     1 ]
			[ kdam      Variable:/SBMLParameter:kdam 0 ]
			[ IR        Variable:/SBMLParameter:IR   0 ];
	}
	
	Process ExpressionFluxProcess( DNArepair )
	{
		Name	"[damDNA] -> [Sink];";
		Expression	"krepair.Value * damDNA.NumberConc";
		VariableReferenceList
			[ damDNA  Variable:/cell:damDNA           -1 ]
			[ Sink    Variable:/cell:Sink             0  ]
			[ krepair Variable:/SBMLParameter:krepair 0  ];
	}
	
	Process ExpressionFluxProcess( ARFactivation )
	{
		Name	"[damDNA] -> [damDNA] + [ARF];";
		Expression	"kactARF.Value * damDNA.NumberConc";
		VariableReferenceList
			[ damDNA  Variable:/cell:damDNA           0 ]
			[ ARF     Variable:/cell:ARF              1 ]
			[ kactARF Variable:/SBMLParameter:kactARF 0 ];
	}
	
	Process ExpressionFluxProcess( ARF_Mdm2Binding )
	{
		Name	"[ARF] + [Mdm2] -> [ARF_Mdm2];";
		Expression	"kbinARFMdm2.Value * ARF.NumberConc * Mdm2.NumberConc";
		VariableReferenceList
			[ ARF         Variable:/cell:ARF                  -1 ]
			[ Mdm2        Variable:/cell:Mdm2                 -1 ]
			[ ARF_Mdm2    Variable:/cell:ARF_Mdm2             1  ]
			[ kbinARFMdm2 Variable:/SBMLParameter:kbinARFMdm2 0  ];
	}
	
	Process ExpressionFluxProcess( ARF_Mdm2Degradation )
	{
		Name	"[ARF_Mdm2] -> [ARF] + [mdm2deg];";
		Expression	"kdegARFMdm2.Value * ARF_Mdm2.NumberConc * kproteff.Value";
		VariableReferenceList
			[ ARF_Mdm2    Variable:/cell:ARF_Mdm2             -1 ]
			[ ARF         Variable:/cell:ARF                  1  ]
			[ mdm2deg     Variable:/cell:mdm2deg              1  ]
			[ kdegARFMdm2 Variable:/SBMLParameter:kdegARFMdm2 0  ]
			[ kproteff    Variable:/SBMLParameter:kproteff    0  ];
	}
	
	Process ExpressionFluxProcess( ARFDegradation )
	{
		Name	"[ARF] -> [Sink];";
		Expression	"kdegARF.Value * ARF.NumberConc * kproteff.Value";
		VariableReferenceList
			[ ARF      Variable:/cell:ARF               -1 ]
			[ Sink     Variable:/cell:Sink              0  ]
			[ kdegARF  Variable:/SBMLParameter:kdegARF  0  ]
			[ kproteff Variable:/SBMLParameter:kproteff 0  ];
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
	
	Variable Variable( Mdm2 )
	{
		Value	5.0;
		Fixed	0;
	}
	
	Variable Variable( p53 )
	{
		Value	5.0;
		Fixed	0;
	}
	
	Variable Variable( Mdm2_p53 )
	{
		Value	95.0;
		Fixed	0;
	}
	
	Variable Variable( Mdm2_mRNA )
	{
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( ARF )
	{
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( ARF_Mdm2 )
	{
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( damDNA )
	{
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( Sink )
	{
		Value	1.0;
		Fixed	1;
	}
	
	Variable Variable( Source )
	{
		Value	1.0;
		Fixed	1;
	}
	
	Variable Variable( p53deg )
	{
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( p53syn )
	{
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( mdm2deg )
	{
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( mdm2syn )
	{
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( Mdm2mRNAdeg )
	{
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( Mdm2mRNAsyn )
	{
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( totdamDNA )
	{
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( totp53 )
	{
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( totMdm2 )
	{
		Value	0.0;
		Fixed	0;
	}
	
	
}

System System( /SBMLParameter )
{
	StepperID	Default;
	Name	"Global Parameter";

	Variable Variable( IR )
	{
		Value	0.0;
	}
	
	Variable Variable( ksynMdm2 )
	{
		Value	0.000495;
		Fixed	1;
	}
	
	Variable Variable( kdegMdm2 )
	{
		Value	0.000433;
		Fixed	1;
	}
	
	Variable Variable( ksynp53 )
	{
		Value	0.078;
		Fixed	1;
	}
	
	Variable Variable( kdegp53 )
	{
		Value	0.000825;
		Fixed	1;
	}
	
	Variable Variable( kbinMdm2p53 )
	{
		Value	0.001155;
		Fixed	1;
	}
	
	Variable Variable( krelMdm2p53 )
	{
		Value	1.155e-05;
		Fixed	1;
	}
	
	Variable Variable( ksynMdm2mRNA )
	{
		Value	0.0001;
		Fixed	1;
	}
	
	Variable Variable( kdegMdm2mRNA )
	{
		Value	0.0001;
		Fixed	1;
	}
	
	Variable Variable( kbinARFMdm2 )
	{
		Value	0.01;
		Fixed	1;
	}
	
	Variable Variable( kdegARFMdm2 )
	{
		Value	0.001;
		Fixed	1;
	}
	
	Variable Variable( kdegARF )
	{
		Value	0.0001;
		Fixed	1;
	}
	
	Variable Variable( kactARF )
	{
		Value	3.3e-05;
		Fixed	1;
	}
	
	Variable Variable( kdam )
	{
		Value	0.08;
		Fixed	1;
	}
	
	Variable Variable( krepair )
	{
		Value	2e-05;
		Fixed	1;
	}
	
	Variable Variable( kproteff )
	{
		Value	1.0;
		Fixed	1;
	}
	
	
}

System System( /SBMLRule )
{
	Name	"System for SBML Rule";
	StepperID	Default;

	Process ExpressionAssignmentProcess( Assignment_totp53 )
	{
		StepperID	Default;
		Name	"Assignment rule for 'totp53'";
		Expression	"p53.NumberConc + Mdm2_p53.NumberConc";
		VariableReferenceList
			[ totp53   Variable:/cell:totp53   1 ]
			[ p53      Variable:/cell:p53      0 ]
			[ Mdm2_p53 Variable:/cell:Mdm2_p53 0 ];
	}
	
	Process ExpressionAssignmentProcess( Assignment_totMdm2 )
	{
		StepperID	Default;
		Name	"Assignment rule for 'totMdm2'";
		Expression	"Mdm2.NumberConc + Mdm2_p53.NumberConc + ARF_Mdm2.NumberConc";
		VariableReferenceList
			[ totMdm2  Variable:/cell:totMdm2  1 ]
			[ Mdm2     Variable:/cell:Mdm2     0 ]
			[ Mdm2_p53 Variable:/cell:Mdm2_p53 0 ]
			[ ARF_Mdm2 Variable:/cell:ARF_Mdm2 0 ];
	}
	
	
}

System System( /SBMLEvent )
{
	Name	"System for SBML Event";
	StepperID	Default;

	Process ExpressionEventProcess( stressCell )
	{
		StepperID	Default;
		Name	stressCell;
		EventAssignmentList
			[ IR 25 ];
		Trigger	"geq(<t>, 3600)";
		Delay	0.0;
		VariableReferenceList
			[ IR Variable:/SBMLParameter:IR 1 ];
	}
	
	Process ExpressionEventProcess( stopStress )
	{
		StepperID	Default;
		Name	stopStress;
		EventAssignmentList
			[ IR 0 ];
		Trigger	"geq(<t>, 3660)";
		Delay	0.0;
		VariableReferenceList
			[ IR Variable:/SBMLParameter:IR 1 ];
	}
	
	
}

