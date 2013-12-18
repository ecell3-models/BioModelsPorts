
# created by eml2em program
# from file: BIOMD0000000188.eml, date: Mon Dec 16 22:55:53 2013
#
# BIOMD0000000188 - Proctor2008_p53_Mdm2_ATM
# 
# Proctor CJ, Gray DA. 
# Explaining oscillations and variability in the p53-Mdm2 system. 
# BMC Syst Biol 2008; 2: 75 
# Centre for Integrated Systems Biology of Ageing and Nutrition, Institute for Ageing and Health, Newcastle University, Newcastle upon Tyne, UK.


##### Steppers #####

Stepper FixedODE1Stepper( DE )    { StepInterval  0.001; }
Stepper DiscreteTimeStepper( DT ) { StepInterval  0.001; }

##### Model Entities #####

System System( / )
{
	StepperID	DE;
	Name	Default;

	Process ExpressionFluxProcess( p53mRNASynthesis )
	{
		Expression	"Param0.Value * (S0.Value / cell.Value)";
		VariableReferenceList	
			[ S0 Variable:/cell:Source 0 ]
			[ P0 Variable:/cell:p53_mRNA 1 ]
			[ Param0 Variable:/SBMLParameter:ksynp53mRNA 0 ]
			[ cell Variable:/cell:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( p53mRNADegradation )
	{
		Expression	"Param0.Value * (S0.Value / cell.Value)";
		VariableReferenceList	
			[ S0 Variable:/cell:p53_mRNA -1 ]
			[ P0 Variable:/cell:Sink 0 ]
			[ Param0 Variable:/SBMLParameter:kdegp53mRNA 0 ]
			[ cell Variable:/cell:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( Mdm2Synthesis )
	{
		Expression	"Param0.Value * (P0.Value / cell.Value)";
		VariableReferenceList	
			[ S0 Variable:/cell:Mdm2_mRNA -1 ]
			[ P0 Variable:/cell:Mdm2_mRNA 1 ]
			[ P1 Variable:/cell:Mdm2 1 ]
			[ P2 Variable:/cell:mdm2syn 1 ]
			[ Param0 Variable:/SBMLParameter:ksynMdm2 0 ]
			[ cell Variable:/cell:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( Mdm2mRNASynthesis1 )
	{
		Expression	"Param0.Value * (P0.Value / cell.Value)";
		VariableReferenceList	
			[ S0 Variable:/cell:p53 -1 ]
			[ P0 Variable:/cell:p53 1 ]
			[ P1 Variable:/cell:Mdm2_mRNA 1 ]
			[ P2 Variable:/cell:Mdm2mRNAsyn 1 ]
			[ Param0 Variable:/SBMLParameter:ksynMdm2mRNA 0 ]
			[ cell Variable:/cell:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( Mdm2mRNASynthesis2 )
	{
		Expression	"Param0.Value * (P0.Value / cell.Value)";
		VariableReferenceList	
			[ S0 Variable:/cell:p53_P -1 ]
			[ P0 Variable:/cell:p53_P 1 ]
			[ P1 Variable:/cell:Mdm2_mRNA 1 ]
			[ P2 Variable:/cell:Mdm2mRNAsyn 1 ]
			[ Param0 Variable:/SBMLParameter:ksynMdm2mRNA 0 ]
			[ cell Variable:/cell:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( Mdm2mRNADegradation )
	{
		Expression	"Param0.Value * (S0.Value / cell.Value)";
		VariableReferenceList	
			[ S0 Variable:/cell:Mdm2_mRNA -1 ]
			[ P0 Variable:/cell:Sink 0 ]
			[ P1 Variable:/cell:Mdm2mRNAdeg 1 ]
			[ Param0 Variable:/SBMLParameter:kdegMdm2mRNA 0 ]
			[ cell Variable:/cell:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( Mdm2Degradation )
	{
		Expression	"Param0.Value * (S0.Value / cell.Value) * Param1.Value";
		VariableReferenceList	
			[ S0 Variable:/cell:Mdm2 -1 ]
			[ P0 Variable:/cell:Sink 0 ]
			[ P1 Variable:/cell:mdm2deg 1 ]
			[ Param0 Variable:/SBMLParameter:kdegMdm2 0 ]
			[ cell Variable:/cell:SIZE 0 ]
			[ Param1 Variable:/SBMLParameter:kproteff 0 ];
	}
	
	Process ExpressionFluxProcess( p53Synthesis )
	{
		Expression	"Param0.Value * (P1.Value / cell.Value)";
		VariableReferenceList	
			[ S0 Variable:/cell:p53_mRNA -1 ]
			[ P0 Variable:/cell:p53 1 ]
			[ P1 Variable:/cell:p53_mRNA 1 ]
			[ P2 Variable:/cell:p53syn 1 ]
			[ Param0 Variable:/SBMLParameter:ksynp53 0 ]
			[ cell Variable:/cell:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( p53Degradation )
	{
		Expression	"Param0.Value * (S0.Value / cell.Value) * Param1.Value";
		VariableReferenceList	
			[ S0 Variable:/cell:Mdm2_p53 -1 ]
			[ P0 Variable:/cell:Mdm2 1 ]
			[ P1 Variable:/cell:p53deg 1 ]
			[ Param0 Variable:/SBMLParameter:kdegp53 0 ]
			[ cell Variable:/cell:SIZE 0 ]
			[ Param1 Variable:/SBMLParameter:kproteff 0 ];
	}
	
	Process ExpressionFluxProcess( P53_Mdm2Binding )
	{
		Expression	"Param0.Value * (S0.Value / cell.Value) * (S1.Value / cell.Value)";
		VariableReferenceList	
			[ S0 Variable:/cell:p53 -1 ]
			[ S1 Variable:/cell:Mdm2 -1 ]
			[ P0 Variable:/cell:Mdm2_p53 1 ]
			[ Param0 Variable:/SBMLParameter:kbinMdm2p53 0 ]
			[ cell Variable:/cell:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( P53_Mdm2Release )
	{
		Expression	"Param0.Value * (S0.Value / cell.Value)";
		VariableReferenceList	
			[ S0 Variable:/cell:Mdm2_p53 -1 ]
			[ P0 Variable:/cell:p53 1 ]
			[ P1 Variable:/cell:Mdm2 1 ]
			[ Param0 Variable:/SBMLParameter:krelMdm2p53 0 ]
			[ cell Variable:/cell:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( DNAdamage )
	{
		Expression	"Param0.Value * Param1.Value";
		VariableReferenceList	
			[ P0 Variable:/cell:damDNA 1 ]
			[ Param0 Variable:/SBMLParameter:kdam 0 ]
			[ Param1 Variable:/SBMLParameter:IR 0 ];
	}
	
	Process ExpressionFluxProcess( DNArepair )
	{
		Expression	"Param0.Value * (S0.Value / cell.Value)";
		VariableReferenceList	
			[ S0 Variable:/cell:damDNA -1 ]
			[ P0 Variable:/cell:Sink 0 ]
			[ Param0 Variable:/SBMLParameter:krepair 0 ]
			[ cell Variable:/cell:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( ATMactivation )
	{
		Expression	"Param0.Value * (P0.Value / cell.Value) * (S1.Value / cell.Value)";
		VariableReferenceList	
			[ S0 Variable:/cell:damDNA -1 ]
			[ S1 Variable:/cell:ATMI -1 ]
			[ P0 Variable:/cell:damDNA 1 ]
			[ P1 Variable:/cell:ATMA 1 ]
			[ Param0 Variable:/SBMLParameter:kactATM 0 ]
			[ cell Variable:/cell:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( p53phoshorylation )
	{
		Expression	"Param0.Value * (S0.Value / cell.Value) * (P1.Value / cell.Value)";
		VariableReferenceList	
			[ S0 Variable:/cell:p53 -1 ]
			[ S1 Variable:/cell:ATMA -1 ]
			[ P0 Variable:/cell:p53_P 1 ]
			[ P1 Variable:/cell:ATMA 1 ]
			[ Param0 Variable:/SBMLParameter:kphosp53 0 ]
			[ cell Variable:/cell:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( p53dephosorylation )
	{
		Expression	"Param0.Value * (S0.Value / cell.Value)";
		VariableReferenceList	
			[ S0 Variable:/cell:p53_P -1 ]
			[ P0 Variable:/cell:p53 1 ]
			[ Param0 Variable:/SBMLParameter:kdephosp53 0 ]
			[ cell Variable:/cell:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( Mdm2phoshorylation )
	{
		Expression	"Param0.Value * (S0.Value / cell.Value) * (P1.Value / cell.Value)";
		VariableReferenceList	
			[ S0 Variable:/cell:Mdm2 -1 ]
			[ S1 Variable:/cell:ATMA -1 ]
			[ P0 Variable:/cell:Mdm2_P 1 ]
			[ P1 Variable:/cell:ATMA 1 ]
			[ Param0 Variable:/SBMLParameter:kphosMdm2 0 ]
			[ cell Variable:/cell:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( Mdm2dephosorylation )
	{
		Expression	"Param0.Value * (S0.Value / cell.Value)";
		VariableReferenceList	
			[ S0 Variable:/cell:Mdm2_P -1 ]
			[ P0 Variable:/cell:Mdm2 1 ]
			[ Param0 Variable:/SBMLParameter:kdephosMdm2 0 ]
			[ cell Variable:/cell:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( Mdm2Pdegradation )
	{
		Expression	"Param0.Value * (S0.Value / cell.Value)";
		VariableReferenceList	
			[ S0 Variable:/cell:Mdm2_P -1 ]
			[ P0 Variable:/cell:Sink 0 ]
			[ P1 Variable:/cell:mdm2deg 1 ]
			[ Param0 Variable:/SBMLParameter:kdegATMMdm2 0 ]
			[ cell Variable:/cell:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( ATMInactivation )
	{
		Expression	"Param0.Value * (S0.Value / cell.Value)";
		VariableReferenceList	
			[ S0 Variable:/cell:ATMA -1 ]
			[ P0 Variable:/cell:ATMI 1 ]
			[ Param0 Variable:/SBMLParameter:kinactATM 0 ]
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
	StepperID	DE;
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
	StepperID	DT;

	Process ExpressionAssignmentProcess( Rule1 )
	{
		Expression	"V1.Value / cell.Value + V2.Value / cell.Value + V3.Value / cell.Value";
		VariableReferenceList	
			[ V0 Variable:/cell:totp53 1 ]
			[ cell Variable:/cell:SIZE 0 ]
			[ V1 Variable:/cell:p53 0 ]
			[ V2 Variable:/cell:Mdm2_p53 0 ]
			[ V3 Variable:/cell:p53_P 0 ];
	}
	
	Process ExpressionAssignmentProcess( Rule2 )
	{
		Expression	"V1.Value / cell.Value + V2.Value / cell.Value + V3.Value / cell.Value";
		VariableReferenceList	
			[ V0 Variable:/cell:totMdm2 1 ]
			[ cell Variable:/cell:SIZE 0 ]
			[ V1 Variable:/cell:Mdm2 0 ]
			[ V2 Variable:/cell:Mdm2_p53 0 ]
			[ V3 Variable:/cell:Mdm2_P 0 ];
	}
	
	
}

System System( /SBMLEvent )
{
	Name	"System for SBML Event";
	StepperID	DE;

	Variable Variable( time )
	{
		Value	0.0;
	}

	Process ExpressionFluxProcess( clock )
	{
		Expression	"1.0";
		VariableReferenceList	
			[ P0 Variable:/SBMLEvent:time 1 ];
	}
	
	Process ExpressionAssignmentProcess( stressCell )
	{
		StepperID	DT;
		Expression	"and( geq( V1.Value, 3600 ), lt( V1.Value, 3660 )) * 25.0";
		VariableReferenceList	
			[ V0 Variable:/SBMLParameter:IR 1 ]
			[ V1 Variable:/SBMLEvent:time 0 ];
	}
	
}

