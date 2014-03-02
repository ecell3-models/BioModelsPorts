
# created by eml2em program
# from file: BIOMD0000000188.eml, date: Sun Mar  2 12:20:02 2014
#

Stepper FixedODE1Stepper( Default )
{
	# no property
}

System System( / )
{
	StepperID	Default;
	Name	default;

	Process ExpressionFluxProcess( p53mRNASynthesis )
	{
		Name	"[Source] -> [p53_mRNA];";
		Expression	"ksynp53mRNA.Value * Source.NumberConc";
		VariableReferenceList
			[ Source      Variable:/cell:Source               0 ]
			[ p53_mRNA    Variable:/cell:p53_mRNA             1 ]
			[ ksynp53mRNA Variable:/SBMLParameter:ksynp53mRNA 0 ];
	}
	
	Process ExpressionFluxProcess( p53mRNADegradation )
	{
		Name	"[p53_mRNA] -> [Sink];";
		Expression	"kdegp53mRNA.Value * p53_mRNA.NumberConc";
		VariableReferenceList
			[ p53_mRNA    Variable:/cell:p53_mRNA             -1 ]
			[ Sink        Variable:/cell:Sink                 0  ]
			[ kdegp53mRNA Variable:/SBMLParameter:kdegp53mRNA 0  ];
	}
	
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
	
	Process ExpressionFluxProcess( Mdm2mRNASynthesis1 )
	{
		Name	"[p53] -> [p53] + [Mdm2_mRNA] + [Mdm2mRNAsyn];";
		Expression	"ksynMdm2mRNA.Value * p53.NumberConc";
		VariableReferenceList
			[ p53          Variable:/cell:p53                   0 ]
			[ Mdm2_mRNA    Variable:/cell:Mdm2_mRNA             1 ]
			[ Mdm2mRNAsyn  Variable:/cell:Mdm2mRNAsyn           1 ]
			[ ksynMdm2mRNA Variable:/SBMLParameter:ksynMdm2mRNA 0 ];
	}
	
	Process ExpressionFluxProcess( Mdm2mRNASynthesis2 )
	{
		Name	"[p53_P] -> [p53_P] + [Mdm2_mRNA] + [Mdm2mRNAsyn];";
		Expression	"ksynMdm2mRNA.Value * p53_P.NumberConc";
		VariableReferenceList
			[ p53_P        Variable:/cell:p53_P                 0 ]
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
		Name	"[p53_mRNA] -> [p53] + [p53_mRNA] + [p53syn];";
		Expression	"ksynp53.Value * p53_mRNA.NumberConc";
		VariableReferenceList
			[ p53_mRNA Variable:/cell:p53_mRNA         0 ]
			[ p53      Variable:/cell:p53              1 ]
			[ p53syn   Variable:/cell:p53syn           1 ]
			[ ksynp53  Variable:/SBMLParameter:ksynp53 0 ];
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
		Name	"-> [damDNA];";
		Expression	"kdam.Value * IR.Value";
		VariableReferenceList
			[ damDNA Variable:/cell:damDNA        1 ]
			[ kdam   Variable:/SBMLParameter:kdam 0 ]
			[ IR     Variable:/SBMLParameter:IR   0 ];
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
	
	Process ExpressionFluxProcess( ATMactivation )
	{
		Name	"[damDNA] + [ATMI] -> [damDNA] + [ATMA];";
		Expression	"kactATM.Value * damDNA.NumberConc * ATMI.NumberConc";
		VariableReferenceList
			[ damDNA  Variable:/cell:damDNA           0  ]
			[ ATMI    Variable:/cell:ATMI             -1 ]
			[ ATMA    Variable:/cell:ATMA             1  ]
			[ kactATM Variable:/SBMLParameter:kactATM 0  ];
	}
	
	Process ExpressionFluxProcess( p53phoshorylation )
	{
		Name	"[p53] + [ATMA] -> [p53_P] + [ATMA];";
		Expression	"kphosp53.Value * p53.NumberConc * ATMA.NumberConc";
		VariableReferenceList
			[ p53      Variable:/cell:p53               -1 ]
			[ ATMA     Variable:/cell:ATMA              0  ]
			[ p53_P    Variable:/cell:p53_P             1  ]
			[ kphosp53 Variable:/SBMLParameter:kphosp53 0  ];
	}
	
	Process ExpressionFluxProcess( p53dephosorylation )
	{
		Name	"[p53_P] -> [p53];";
		Expression	"kdephosp53.Value * p53_P.NumberConc";
		VariableReferenceList
			[ p53_P      Variable:/cell:p53_P               -1 ]
			[ p53        Variable:/cell:p53                 1  ]
			[ kdephosp53 Variable:/SBMLParameter:kdephosp53 0  ];
	}
	
	Process ExpressionFluxProcess( Mdm2phoshorylation )
	{
		Name	"[Mdm2] + [ATMA] -> [Mdm2_P] + [ATMA];";
		Expression	"kphosMdm2.Value * Mdm2.NumberConc * ATMA.NumberConc";
		VariableReferenceList
			[ Mdm2      Variable:/cell:Mdm2               -1 ]
			[ ATMA      Variable:/cell:ATMA               0  ]
			[ Mdm2_P    Variable:/cell:Mdm2_P             1  ]
			[ kphosMdm2 Variable:/SBMLParameter:kphosMdm2 0  ];
	}
	
	Process ExpressionFluxProcess( Mdm2dephosorylation )
	{
		Name	"[Mdm2_P] -> [Mdm2];";
		Expression	"kdephosMdm2.Value * Mdm2_P.NumberConc";
		VariableReferenceList
			[ Mdm2_P      Variable:/cell:Mdm2_P               -1 ]
			[ Mdm2        Variable:/cell:Mdm2                 1  ]
			[ kdephosMdm2 Variable:/SBMLParameter:kdephosMdm2 0  ];
	}
	
	Process ExpressionFluxProcess( Mdm2Pdegradation )
	{
		Name	"[Mdm2_P] -> [Sink] + [mdm2deg];";
		Expression	"kdegATMMdm2.Value * Mdm2_P.NumberConc";
		VariableReferenceList
			[ Mdm2_P      Variable:/cell:Mdm2_P               -1 ]
			[ Sink        Variable:/cell:Sink                 0  ]
			[ mdm2deg     Variable:/cell:mdm2deg              1  ]
			[ kdegATMMdm2 Variable:/SBMLParameter:kdegATMMdm2 0  ];
	}
	
	Process ExpressionFluxProcess( ATMInactivation )
	{
		Name	"[ATMA] -> [ATMI];";
		Expression	"kinactATM.Value * ATMA.NumberConc";
		VariableReferenceList
			[ ATMA      Variable:/cell:ATMA               -1 ]
			[ ATMI      Variable:/cell:ATMI               1  ]
			[ kinactATM Variable:/SBMLParameter:kinactATM 0  ];
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
		Value	10.0;
		Fixed	0;
	}
	
	Variable Variable( p53_mRNA )
	{
		Value	10.0;
		Fixed	0;
	}
	
	Variable Variable( ATMA )
	{
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( ATMI )
	{
		Value	200.0;
		Fixed	0;
	}
	
	Variable Variable( p53_P )
	{
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( Mdm2_P )
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
		Value	0.006;
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
	
	Variable Variable( kactATM )
	{
		Value	0.0001;
		Fixed	1;
	}
	
	Variable Variable( kdegATMMdm2 )
	{
		Value	0.0004;
		Fixed	1;
	}
	
	Variable Variable( kinactATM )
	{
		Value	0.0005;
		Fixed	1;
	}
	
	Variable Variable( kphosp53 )
	{
		Value	0.0005;
		Fixed	1;
	}
	
	Variable Variable( kdephosp53 )
	{
		Value	0.5;
		Fixed	1;
	}
	
	Variable Variable( kphosMdm2 )
	{
		Value	2.0;
		Fixed	1;
	}
	
	Variable Variable( kdephosMdm2 )
	{
		Value	0.5;
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
	
	Variable Variable( ksynp53mRNA )
	{
		Value	0.001;
		Fixed	1;
	}
	
	Variable Variable( kdegp53mRNA )
	{
		Value	0.0001;
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
		Expression	"p53.NumberConc + Mdm2_p53.NumberConc + p53_P.NumberConc";
		VariableReferenceList
			[ totp53   Variable:/cell:totp53   1 ]
			[ p53      Variable:/cell:p53      0 ]
			[ Mdm2_p53 Variable:/cell:Mdm2_p53 0 ]
			[ p53_P    Variable:/cell:p53_P    0 ];
	}
	
	Process ExpressionAssignmentProcess( Assignment_totMdm2 )
	{
		StepperID	Default;
		Name	"Assignment rule for 'totMdm2'";
		Expression	"Mdm2.NumberConc + Mdm2_p53.NumberConc + Mdm2_P.NumberConc";
		VariableReferenceList
			[ totMdm2  Variable:/cell:totMdm2  1 ]
			[ Mdm2     Variable:/cell:Mdm2     0 ]
			[ Mdm2_p53 Variable:/cell:Mdm2_p53 0 ]
			[ Mdm2_P   Variable:/cell:Mdm2_P   0 ];
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

