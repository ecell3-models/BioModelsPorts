
# created by eml2em program
# from file: ../BIOMD0000000201/BIOMD0000000201.eml, date: Mon Dec 16 23:01:26 2013
#

Stepper ODEStepper( DE )
{
	# no property
}

System System( / )
{
	StepperID	DE;
	Name	Default;

	Process ExpressionFluxProcess( n_synth )
	{
		Name	Notch_synthesis;
		Expression	"cytosol.Value * Param0.Value * Param1.Value";
		VariableReferenceList	[ P0 Variable:/cytosol:N 1 ] [ cytosol Variable:/cytosol:SIZE 0 ] [ Param0 Variable:/SBMLParameter:epsilon 0 ] [ Param1 Variable:/SBMLParameter:vsN 0 ];
	}
	
	Process ExpressionFluxProcess( N_degradation )
	{
		Name	N_degradation;
		Expression	"Param0.Value * cytosol.Value * Param1.Value * (S0.Value / cytosol.Value) / (Param2.Value + S0.Value / cytosol.Value)";
		VariableReferenceList	[ S0 Variable:/cytosol:N -1 ] [ Param0 Variable:/SBMLParameter:epsilon 0 ] [ cytosol Variable:/cytosol:SIZE 0 ] [ Param1 Variable:/SBMLParameter:vdN 0 ] [ Param2 Variable:/SBMLParameter:KdN 0 ];
	}
	
	Process ExpressionFluxProcess( N_activation )
	{
		Name	Notch_activation;
		Expression	"Param0.Value * cytosol.Value * Param1.Value * (S0.Value / cytosol.Value) * pow(Param2.Value, Param3.Value) / (pow(Param2.Value, Param3.Value) + pow(C0.Value / cytosol.Value, Param3.Value))";
		VariableReferenceList	[ S0 Variable:/cytosol:N -1 ] [ P0 Variable:/cytosol:Na 1 ] [ C0 Variable:/cytosol:F 0 ] [ Param0 Variable:/SBMLParameter:epsilon 0 ] [ cytosol Variable:/cytosol:SIZE 0 ] [ Param1 Variable:/SBMLParameter:kc 0 ] [ Param2 Variable:/SBMLParameter:KIF 0 ] [ Param3 Variable:/SBMLParameter:j 0 ];
	}
	
	Process ExpressionFluxProcess( Na_degradation )
	{
		Name	Na_degradation;
		Expression	"Param0.Value * cytosol.Value * Param1.Value * (S0.Value / cytosol.Value) / (Param2.Value + S0.Value / cytosol.Value)";
		VariableReferenceList	[ S0 Variable:/cytosol:Na -1 ] [ Param0 Variable:/SBMLParameter:epsilon 0 ] [ cytosol Variable:/cytosol:SIZE 0 ] [ Param1 Variable:/SBMLParameter:VdNa 0 ] [ Param2 Variable:/SBMLParameter:KdNa 0 ];
	}
	
	Process ExpressionFluxProcess( Na_transport )
	{
		Expression	"Param0.Value * cytosol.Value * (Param1.Value * (S0.Value / cytosol.Value) - Param2.Value * NaN)";
		VariableReferenceList	[ S0 Variable:/cytosol:Na -1 ] [ P0 Variable:/cytosol:Nan 1 ] [ Param0 Variable:/SBMLParameter:epsilon 0 ] [ cytosol Variable:/cytosol:SIZE 0 ] [ Param1 Variable:/SBMLParameter:kt1 0 ] [ Param2 Variable:/SBMLParameter:kt2 0 ];
	}
	
	Process ExpressionFluxProcess( Nan_degradation )
	{
		Expression	"Param0.Value * cytosol.Value * Param1.Value * NaN / (Param2.Value + NaN)";
		VariableReferenceList	[ S0 Variable:/cytosol:Nan -1 ] [ Param0 Variable:/SBMLParameter:epsilon 0 ] [ cytosol Variable:/cytosol:SIZE 0 ] [ Param1 Variable:/SBMLParameter:VdNan 0 ] [ Param2 Variable:/SBMLParameter:KdNan 0 ];
	}
	
	Process ExpressionFluxProcess( MF_transkription )
	{
		Expression	"Param0.Value * cytosol.Value * Param1.Value * pow(NaN, Param2.Value) / (pow(Param3.Value, Param2.Value) + pow(NaN, Param2.Value))";
		VariableReferenceList	[ P0 Variable:/cytosol:MF 1 ] [ C0 Variable:/cytosol:Nan 0 ] [ Param0 Variable:/SBMLParameter:epsilon 0 ] [ cytosol Variable:/cytosol:SIZE 0 ] [ Param1 Variable:/SBMLParameter:vsFK 0 ] [ Param2 Variable:/SBMLParameter:p 0 ] [ Param3 Variable:/SBMLParameter:KA 0 ];
	}
	
	Process ExpressionFluxProcess( MF_degradation )
	{
		Expression	"Param0.Value * cytosol.Value * Param1.Value * (S0.Value / cytosol.Value) / (Param2.Value + S0.Value / cytosol.Value)";
		VariableReferenceList	[ S0 Variable:/cytosol:MF -1 ] [ Param0 Variable:/SBMLParameter:epsilon 0 ] [ cytosol Variable:/cytosol:SIZE 0 ] [ Param1 Variable:/SBMLParameter:vmF 0 ] [ Param2 Variable:/SBMLParameter:KdMF 0 ];
	}
	
	Process ExpressionFluxProcess( F_translation )
	{
		Expression	"Param0.Value * cytosol.Value * Param1.Value * (C0.Value / cytosol.Value)";
		VariableReferenceList	[ P0 Variable:/cytosol:F 1 ] [ C0 Variable:/cytosol:MF 0 ] [ Param0 Variable:/SBMLParameter:epsilon 0 ] [ cytosol Variable:/cytosol:SIZE 0 ] [ Param1 Variable:/SBMLParameter:ksF 0 ];
	}
	
	Process ExpressionFluxProcess( F_degradation )
	{
		Expression	"Param0.Value * cytosol.Value * Param1.Value * (S0.Value / cytosol.Value) / (Param2.Value + S0.Value / cytosol.Value)";
		VariableReferenceList	[ S0 Variable:/cytosol:F -1 ] [ Param0 Variable:/SBMLParameter:epsilon 0 ] [ cytosol Variable:/cytosol:SIZE 0 ] [ Param1 Variable:/SBMLParameter:vdF 0 ] [ Param2 Variable:/SBMLParameter:KdF 0 ];
	}
	
	Process ExpressionFluxProcess( AK_dissoc )
	{
		Expression	"Param0.Value * cytosol.Value * (Param1.Value * (S0.Value / cytosol.Value) - Param2.Value * (P0.Value / cytosol.Value) * (P1.Value / cytosol.Value))";
		VariableReferenceList	[ S0 Variable:/cytosol:AK -1 ] [ P0 Variable:/cytosol:A 1 ] [ P1 Variable:/cytosol:K 1 ] [ Param0 Variable:/SBMLParameter:theta 0 ] [ cytosol Variable:/cytosol:SIZE 0 ] [ Param1 Variable:/SBMLParameter:d1 0 ] [ Param2 Variable:/SBMLParameter:a1 0 ];
	}
	
	Process ExpressionFluxProcess( B_synth )
	{
		Expression	"Param0.Value * cytosol.Value * Param1.Value";
		VariableReferenceList	[ P0 Variable:/cytosol:B 1 ] [ Param0 Variable:/SBMLParameter:theta 0 ] [ cytosol Variable:/cytosol:SIZE 0 ] [ Param1 Variable:/SBMLParameter:vsB 0 ];
	}
	
	Process ExpressionFluxProcess( B_degradation )
	{
		Expression	"Param0.Value * cytosol.Value * Param1.Value * (S0.Value / cytosol.Value)";
		VariableReferenceList	[ S0 Variable:/cytosol:B -1 ] [ Param0 Variable:/SBMLParameter:theta 0 ] [ cytosol Variable:/cytosol:SIZE 0 ] [ Param1 Variable:/SBMLParameter:kd1 0 ];
	}
	
	Process ExpressionFluxProcess( B_phosphorylation )
	{
		Expression	"Param0.Value * cytosol.Value * Param1.Value * Param2.Value / (Param2.Value + C1.Value / cytosol.Value) * (S0.Value / cytosol.Value) / (Param3.Value + S0.Value / cytosol.Value) * (C0.Value / cytosol.Value) / (C2.Value / cytosol.Value)";
		VariableReferenceList	[ S0 Variable:/cytosol:B -1 ] [ P0 Variable:/cytosol:Bp 1 ] [ C0 Variable:/cytosol:AK 0 ] [ C1 Variable:/cytosol:D 0 ] [ C2 Variable:/cytosol:Kt 0 ] [ Param0 Variable:/SBMLParameter:theta 0 ] [ cytosol Variable:/cytosol:SIZE 0 ] [ Param1 Variable:/SBMLParameter:VMK 0 ] [ Param2 Variable:/SBMLParameter:KID 0 ] [ Param3 Variable:/SBMLParameter:K1 0 ];
	}
	
	Process ExpressionFluxProcess( BP_dephosphorylation )
	{
		Expression	"Param0.Value * cytosol.Value * Param1.Value * (S0.Value / cytosol.Value) / (Param2.Value + S0.Value / cytosol.Value)";
		VariableReferenceList	[ S0 Variable:/cytosol:Bp -1 ] [ P0 Variable:/cytosol:B 1 ] [ Param0 Variable:/SBMLParameter:theta 0 ] [ cytosol Variable:/cytosol:SIZE 0 ] [ Param1 Variable:/SBMLParameter:VMP 0 ] [ Param2 Variable:/SBMLParameter:K2 0 ];
	}
	
	Process ExpressionFluxProcess( B_shuttling )
	{
		Expression	"Param0.Value * cytosol.Value * (Param1.Value * (S0.Value / cytosol.Value) - Param2.Value * (P0.Value / cytosol.Value))";
		VariableReferenceList	[ S0 Variable:/cytosol:BN -1 ] [ P0 Variable:/cytosol:B 1 ] [ Param0 Variable:/SBMLParameter:theta 0 ] [ cytosol Variable:/cytosol:SIZE 0 ] [ Param1 Variable:/SBMLParameter:kt4 0 ] [ Param2 Variable:/SBMLParameter:kt3 0 ];
	}
	
	Process ExpressionFluxProcess( Bp_degradation )
	{
		Expression	"Param0.Value * cytosol.Value * Param1.Value * (S0.Value / cytosol.Value)";
		VariableReferenceList	[ S0 Variable:/cytosol:Bp -1 ] [ Param0 Variable:/SBMLParameter:theta 0 ] [ cytosol Variable:/cytosol:SIZE 0 ] [ Param1 Variable:/SBMLParameter:kd2 0 ];
	}
	
	Process ExpressionFluxProcess( MAx_trans_basal )
	{
		Expression	"Param0.Value * cytosol.Value * Param1.Value";
		VariableReferenceList	[ P0 Variable:/cytosol:MAx 1 ] [ C0 Variable:/cytosol:BN 0 ] [ Param0 Variable:/SBMLParameter:theta 0 ] [ cytosol Variable:/cytosol:SIZE 0 ] [ Param1 Variable:/SBMLParameter:v0 0 ];
	}
	
	Process ExpressionFluxProcess( MAx_trans_BN )
	{
		Expression	"Param0.Value * cytosol.Value * (Param1.Value * pow(C0.Value / cytosol.Value, Param2.Value) / (pow(Param3.Value, Param2.Value) + pow(C0.Value / cytosol.Value, Param2.Value)))";
		VariableReferenceList	[ P0 Variable:/cytosol:MAx 1 ] [ C0 Variable:/cytosol:BN 0 ] [ Param0 Variable:/SBMLParameter:theta 0 ] [ cytosol Variable:/cytosol:SIZE 0 ] [ Param1 Variable:/SBMLParameter:vMB 0 ] [ Param2 Variable:/SBMLParameter:n 0 ] [ Param3 Variable:/SBMLParameter:KaB 0 ];
	}
	
	Process ExpressionFluxProcess( MAx_trans_Xa )
	{
		Expression	"Param0.Value * cytosol.Value * (Param1.Value * pow(C0.Value / cytosol.Value, Param2.Value) / (pow(Param3.Value, Param2.Value) + pow(C0.Value / cytosol.Value, Param2.Value)))";
		VariableReferenceList	[ P0 Variable:/cytosol:MAx 1 ] [ C0 Variable:/cytosol:Xa 0 ] [ Param0 Variable:/SBMLParameter:theta 0 ] [ cytosol Variable:/cytosol:SIZE 0 ] [ Param1 Variable:/SBMLParameter:vMXa 0 ] [ Param2 Variable:/SBMLParameter:m 0 ] [ Param3 Variable:/SBMLParameter:KaXa 0 ];
	}
	
	Process ExpressionFluxProcess( MAx_degradation )
	{
		Expression	"Param0.Value * cytosol.Value * Param1.Value * (S0.Value / cytosol.Value) / (Param2.Value + S0.Value / cytosol.Value)";
		VariableReferenceList	[ S0 Variable:/cytosol:MAx -1 ] [ Param0 Variable:/SBMLParameter:theta 0 ] [ cytosol Variable:/cytosol:SIZE 0 ] [ Param1 Variable:/SBMLParameter:vmd 0 ] [ Param2 Variable:/SBMLParameter:Kmd 0 ];
	}
	
	Process ExpressionFluxProcess( A_translation )
	{
		Expression	"Param0.Value * cytosol.Value * Param1.Value * (C0.Value / cytosol.Value)";
		VariableReferenceList	[ P0 Variable:/cytosol:A 1 ] [ C0 Variable:/cytosol:MAx 0 ] [ Param0 Variable:/SBMLParameter:theta 0 ] [ cytosol Variable:/cytosol:SIZE 0 ] [ Param1 Variable:/SBMLParameter:ksAx 0 ];
	}
	
	Process ExpressionFluxProcess( A_degradation )
	{
		Expression	"Param0.Value * cytosol.Value * Param1.Value * (S0.Value / cytosol.Value) / (Param2.Value + S0.Value / cytosol.Value)";
		VariableReferenceList	[ S0 Variable:/cytosol:A -1 ] [ Param0 Variable:/SBMLParameter:theta 0 ] [ cytosol Variable:/cytosol:SIZE 0 ] [ Param1 Variable:/SBMLParameter:vdAx 0 ] [ Param2 Variable:/SBMLParameter:KdAx 0 ];
	}
	
	Process ExpressionFluxProcess( Ras_activation )
	{
		Expression	"Param0.Value * cytosol.Value * Param1.Value * pow(C1.Value / cytosol.Value, Param2.Value) / (pow(Param3.Value, Param2.Value) + pow(C1.Value / cytosol.Value, Param2.Value)) * (C0.Value / cytosol.Value) / (Param4.Value + C0.Value / cytosol.Value)";
		VariableReferenceList	[ P0 Variable:/cytosol:Rasa 1 ] [ C0 Variable:/cytosol:Rasi 0 ] [ C1 Variable:/cytosol:Fgf 0 ] [ Param0 Variable:/SBMLParameter:eta 0 ] [ cytosol Variable:/cytosol:SIZE 0 ] [ Param1 Variable:/SBMLParameter:VMaRas 0 ] [ Param2 Variable:/SBMLParameter:r 0 ] [ Param3 Variable:/SBMLParameter:KaFgf 0 ] [ Param4 Variable:/SBMLParameter:KaRas 0 ];
	}
	
	Process ExpressionFluxProcess( Ras_inactivation )
	{
		Expression	"Param0.Value * cytosol.Value * Param1.Value * (S0.Value / cytosol.Value) / (Param2.Value + S0.Value / cytosol.Value)";
		VariableReferenceList	[ S0 Variable:/cytosol:Rasa -1 ] [ Param0 Variable:/SBMLParameter:eta 0 ] [ cytosol Variable:/cytosol:SIZE 0 ] [ Param1 Variable:/SBMLParameter:VMdRas 0 ] [ Param2 Variable:/SBMLParameter:KdRas 0 ];
	}
	
	Process ExpressionFluxProcess( Erk_activation )
	{
		Expression	"Param0.Value * cytosol.Value * Param1.Value * (C1.Value / cytosol.Value) / (C2.Value / cytosol.Value) * (C0.Value / cytosol.Value) / (Param2.Value + C0.Value / cytosol.Value)";
		VariableReferenceList	[ P0 Variable:/cytosol:ERKa 1 ] [ C0 Variable:/cytosol:ERKi 0 ] [ C1 Variable:/cytosol:Rasa 0 ] [ C2 Variable:/cytosol:Rast 0 ] [ Param0 Variable:/SBMLParameter:eta 0 ] [ cytosol Variable:/cytosol:SIZE 0 ] [ Param1 Variable:/SBMLParameter:VMaErk 0 ] [ Param2 Variable:/SBMLParameter:KaErk 0 ];
	}
	
	Process ExpressionFluxProcess( Erk_inactivation )
	{
		Expression	"Param0.Value * cytosol.Value * Param1.Value * (C0.Value / cytosol.Value) * (S0.Value / cytosol.Value) / (Param2.Value + S0.Value / cytosol.Value)";
		VariableReferenceList	[ S0 Variable:/cytosol:ERKa -1 ] [ C0 Variable:/cytosol:Dusp 0 ] [ Param0 Variable:/SBMLParameter:eta 0 ] [ cytosol Variable:/cytosol:SIZE 0 ] [ Param1 Variable:/SBMLParameter:kcDusp 0 ] [ Param2 Variable:/SBMLParameter:KdErk 0 ];
	}
	
	Process ExpressionFluxProcess( X_activation )
	{
		Expression	"Param0.Value * cytosol.Value * Param1.Value * (C0.Value / cytosol.Value) / (C1.Value / cytosol.Value) * (C2.Value / cytosol.Value) / (Param2.Value + C2.Value / cytosol.Value)";
		VariableReferenceList	[ P0 Variable:/cytosol:Xa 1 ] [ C0 Variable:/cytosol:ERKa 0 ] [ C1 Variable:/cytosol:ERKt 0 ] [ C2 Variable:/cytosol:Xi 0 ] [ Param0 Variable:/SBMLParameter:eta 0 ] [ cytosol Variable:/cytosol:SIZE 0 ] [ Param1 Variable:/SBMLParameter:VMaX 0 ] [ Param2 Variable:/SBMLParameter:KaX 0 ];
	}
	
	Process ExpressionFluxProcess( X_inactivation )
	{
		Expression	"Param0.Value * cytosol.Value * Param1.Value * (S0.Value / cytosol.Value) / (Param2.Value + S0.Value / cytosol.Value)";
		VariableReferenceList	[ S0 Variable:/cytosol:Xa -1 ] [ Param0 Variable:/SBMLParameter:eta 0 ] [ cytosol Variable:/cytosol:SIZE 0 ] [ Param1 Variable:/SBMLParameter:VMdX 0 ] [ Param2 Variable:/SBMLParameter:KdX 0 ];
	}
	
	Process ExpressionFluxProcess( MDusp_transkription )
	{
		Expression	"Param0.Value * cytosol.Value * Param1.Value * pow(C0.Value / cytosol.Value, Param2.Value) / (pow(Param3.Value, Param2.Value) + pow(C0.Value / cytosol.Value, Param2.Value))";
		VariableReferenceList	[ P0 Variable:/cytosol:MDusp 1 ] [ C0 Variable:/cytosol:Xa 0 ] [ Param0 Variable:/SBMLParameter:eta 0 ] [ cytosol Variable:/cytosol:SIZE 0 ] [ Param1 Variable:/SBMLParameter:VMsMDusp 0 ] [ Param2 Variable:/SBMLParameter:q 0 ] [ Param3 Variable:/SBMLParameter:KaMDusp 0 ];
	}
	
	Process ExpressionFluxProcess( MDusp_degradation )
	{
		Expression	"Param0.Value * cytosol.Value * Param1.Value * (S0.Value / cytosol.Value) / (Param2.Value + S0.Value / cytosol.Value)";
		VariableReferenceList	[ S0 Variable:/cytosol:MDusp -1 ] [ Param0 Variable:/SBMLParameter:eta 0 ] [ cytosol Variable:/cytosol:SIZE 0 ] [ Param1 Variable:/SBMLParameter:VMdMDusp 0 ] [ Param2 Variable:/SBMLParameter:KdMDusp 0 ];
	}
	
	Process ExpressionFluxProcess( Dusp_translation )
	{
		Expression	"Param0.Value * cytosol.Value * Param1.Value * (C0.Value / cytosol.Value)";
		VariableReferenceList	[ P0 Variable:/cytosol:Dusp 1 ] [ C0 Variable:/cytosol:MDusp 0 ] [ Param0 Variable:/SBMLParameter:eta 0 ] [ cytosol Variable:/cytosol:SIZE 0 ] [ Param1 Variable:/SBMLParameter:ksDusp 0 ];
	}
	
	Process ExpressionFluxProcess( Dusp_degradation )
	{
		Expression	"Param0.Value * cytosol.Value * Param1.Value * (S0.Value / cytosol.Value) / (Param2.Value + S0.Value / cytosol.Value)";
		VariableReferenceList	[ S0 Variable:/cytosol:Dusp -1 ] [ Param0 Variable:/SBMLParameter:eta 0 ] [ cytosol Variable:/cytosol:SIZE 0 ] [ Param1 Variable:/SBMLParameter:vdDusp 0 ] [ Param2 Variable:/SBMLParameter:KdDusp 0 ];
	}
	
	
}

System System( /cytosol )
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
	
	Variable Variable( N )
	{
		Name	"Notch protein";
		Value	0.5;
		Fixed	0;
	}
	
	Variable Variable( Na )
	{
		Name	"cytosolic NicD";
		Value	0.2;
		Fixed	0;
	}
	
	Variable Variable( Nan )
	{
		Name	"nuclear NicD";
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( MF )
	{
		Name	"Lunatic fringe mRNA";
		Value	0.1;
		Fixed	0;
	}
	
	Variable Variable( F )
	{
		Name	"Lunatic Fringe protein";
		Value	0.001;
		Fixed	0;
	}
	
	Variable Variable( Bp )
	{
		Name	"phosph. beta-catenin";
		Value	0.1;
		Fixed	0;
	}
	
	Variable Variable( BN )
	{
		Name	"nuclear beta-catenin";
		Value	0.001;
		Fixed	0;
	}
	
	Variable Variable( A )
	{
		Name	"Axin2 protein";
		Value	0.1;
		Fixed	0;
	}
	
	Variable Variable( K )
	{
		Name	Gsk3;
		Value	3.0;
		Fixed	0;
	}
	
	Variable Variable( B )
	{
		Name	"beta-catenin";
		Value	0.1;
		Fixed	0;
	}
	
	Variable Variable( MAx )
	{
		Name	"Axin2 mRNA";
		Value	0.1;
		Fixed	0;
	}
	
	Variable Variable( Rasa )
	{
		Name	"active Ras";
		Value	0.5;
		Fixed	0;
	}
	
	Variable Variable( ERKa )
	{
		Name	"active ERK";
		Value	0.2;
		Fixed	0;
	}
	
	Variable Variable( Xa )
	{
		Name	"active TF X";
		Value	0.1;
		Fixed	0;
	}
	
	Variable Variable( MDusp )
	{
		Name	"Dusp6 mRNA";
		Value	0.1;
		Fixed	0;
	}
	
	Variable Variable( Dusp )
	{
		Name	"Dusp6 protein";
		Value	0.1;
		Fixed	0;
	}
	
	Variable Variable( Rasi )
	{
		Name	"inactive Ras";
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( ERKi )
	{
		Name	"inactive ERK";
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( Xi )
	{
		Name	"inactive TF X";
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( Rast )
	{
		Name	"Ras total";
		Value	2.0;
		Fixed	0;
	}
	
	Variable Variable( ERKt )
	{
		Name	"ERK total";
		Value	2.0;
		Fixed	0;
	}
	
	Variable Variable( Xt )
	{
		Name	"X total";
		Value	2.0;
		Fixed	0;
	}
	
	Variable Variable( D )
	{
		Name	"Dsh protein";
		Value	2.0;
		Fixed	0;
	}
	
	Variable Variable( AK )
	{
		Name	"Axin2/Gsk3 destruction complex";
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( Kt )
	{
		Name	Kt;
		Value	3.0;
		Fixed	1;
	}
	
	Variable Variable( Fgf )
	{
		Name	Fgf;
		Value	1.0;
		Fixed	1;
	}
	
	
}

System System( /SBMLParameter )
{
	StepperID	DE;
	Name	"Global Parameter";

	Variable Variable( KdN )
	{
		Name	KdN;
		Value	1.4;
		Fixed	1;
	}
	
	Variable Variable( vsN )
	{
		Name	vsN;
		Value	0.23;
		Fixed	1;
	}
	
	Variable Variable( vdN )
	{
		Name	vdN;
		Value	2.82;
		Fixed	1;
	}
	
	Variable Variable( KdNa )
	{
		Name	KdNa;
		Value	0.001;
		Fixed	1;
	}
	
	Variable Variable( VdNa )
	{
		Name	VdNa;
		Value	0.01;
		Fixed	1;
	}
	
	Variable Variable( kt1 )
	{
		Name	kt1;
		Value	0.1;
		Fixed	1;
	}
	
	Variable Variable( kt2 )
	{
		Name	kt2;
		Value	0.1;
		Fixed	1;
	}
	
	Variable Variable( KdNan )
	{
		Name	KdNan;
		Value	0.001;
		Fixed	1;
	}
	
	Variable Variable( VdNan )
	{
		Name	VdNan;
		Value	0.1;
		Fixed	1;
	}
	
	Variable Variable( KdMF )
	{
		Name	KdMF;
		Value	0.768;
		Fixed	1;
	}
	
	Variable Variable( KIG1 )
	{
		Name	KIG1;
		Value	2.5;
		Fixed	1;
	}
	
	Variable Variable( vsFK )
	{
		Name	vsFK;
		Value	Unknown;
	}
	
	Variable Variable( vsF )
	{
		Name	vsF;
		Value	3.0;
		Fixed	1;
	}
	
	Variable Variable( vmF )
	{
		Name	vmF;
		Value	1.92;
		Fixed	1;
	}
	
	Variable Variable( KA )
	{
		Name	KA;
		Value	0.05;
		Fixed	1;
	}
	
	Variable Variable( KdF )
	{
		Name	KdF;
		Value	0.37;
		Fixed	1;
	}
	
	Variable Variable( vdF )
	{
		Name	vdF;
		Value	0.39;
		Fixed	1;
	}
	
	Variable Variable( ksF )
	{
		Name	ksF;
		Value	0.3;
		Fixed	1;
	}
	
	Variable Variable( kd1 )
	{
		Name	kd1;
		Value	0.0;
		Fixed	1;
	}
	
	Variable Variable( vsB )
	{
		Name	vsB;
		Value	0.087;
		Fixed	1;
	}
	
	Variable Variable( kd2 )
	{
		Name	kd2;
		Value	7.062;
		Fixed	1;
	}
	
	Variable Variable( v0 )
	{
		Name	v0;
		Value	0.06;
		Fixed	1;
	}
	
	Variable Variable( vMB )
	{
		Name	vMB;
		Value	1.64;
		Fixed	1;
	}
	
	Variable Variable( vmd )
	{
		Name	vmd;
		Value	0.8;
		Fixed	1;
	}
	
	Variable Variable( KaB )
	{
		Name	KaB;
		Value	0.7;
		Fixed	1;
	}
	
	Variable Variable( KaXa )
	{
		Name	KaXa;
		Value	0.05;
		Fixed	1;
	}
	
	Variable Variable( Kmd )
	{
		Name	Kmd;
		Value	0.48;
		Fixed	1;
	}
	
	Variable Variable( n )
	{
		Name	n;
		Value	2.0;
		Fixed	1;
	}
	
	Variable Variable( m )
	{
		Name	m;
		Value	2.0;
		Fixed	1;
	}
	
	Variable Variable( vMXa )
	{
		Name	vMXa;
		Value	0.5;
		Fixed	1;
	}
	
	Variable Variable( ksAx )
	{
		Name	ksAx;
		Value	0.02;
		Fixed	1;
	}
	
	Variable Variable( vdAx )
	{
		Name	vdAx;
		Value	0.6;
		Fixed	1;
	}
	
	Variable Variable( KdAx )
	{
		Name	KdAx;
		Value	0.63;
		Fixed	1;
	}
	
	Variable Variable( d1 )
	{
		Name	d1;
		Value	0.1;
		Fixed	1;
	}
	
	Variable Variable( a1 )
	{
		Name	a1;
		Value	1.8;
		Fixed	1;
	}
	
	Variable Variable( K1 )
	{
		Name	K1;
		Value	0.28;
		Fixed	1;
	}
	
	Variable Variable( K2 )
	{
		Name	K2;
		Value	0.03;
		Fixed	1;
	}
	
	Variable Variable( kt3 )
	{
		Name	kt3;
		Value	0.7;
		Fixed	1;
	}
	
	Variable Variable( kt4 )
	{
		Name	kt4;
		Value	1.5;
		Fixed	1;
	}
	
	Variable Variable( ksDusp )
	{
		Name	ksDusp;
		Value	0.5;
		Fixed	1;
	}
	
	Variable Variable( vdDusp )
	{
		Name	vdDusp;
		Value	2.0;
		Fixed	1;
	}
	
	Variable Variable( KdDusp )
	{
		Name	KdDusp;
		Value	0.5;
		Fixed	1;
	}
	
	Variable Variable( kcDusp )
	{
		Name	kcDusp;
		Value	1.35;
		Fixed	1;
	}
	
	Variable Variable( KaFgf )
	{
		Name	KaFgf;
		Value	0.5;
		Fixed	1;
	}
	
	Variable Variable( KaRas )
	{
		Name	KaRas;
		Value	0.103;
		Fixed	1;
	}
	
	Variable Variable( KdRas )
	{
		Name	KdRas;
		Value	0.1;
		Fixed	1;
	}
	
	Variable Variable( KdErk )
	{
		Name	KdErk;
		Value	0.05;
		Fixed	1;
	}
	
	Variable Variable( KaErk )
	{
		Name	KaErk;
		Value	0.05;
		Fixed	1;
	}
	
	Variable Variable( KaX )
	{
		Name	KaX;
		Value	0.05;
		Fixed	1;
	}
	
	Variable Variable( KIF )
	{
		Name	KIF;
		Value	0.5;
		Fixed	1;
	}
	
	Variable Variable( KID )
	{
		Name	KID;
		Value	0.5;
		Fixed	1;
	}
	
	Variable Variable( KdX )
	{
		Name	KdX;
		Value	0.05;
		Fixed	1;
	}
	
	Variable Variable( KaMDusp )
	{
		Name	KaMDusp;
		Value	0.5;
		Fixed	1;
	}
	
	Variable Variable( KdMDusp )
	{
		Name	KdMDusp;
		Value	0.5;
		Fixed	1;
	}
	
	Variable Variable( q )
	{
		Name	q;
		Value	2.0;
		Fixed	1;
	}
	
	Variable Variable( r )
	{
		Name	r;
		Value	2.0;
		Fixed	1;
	}
	
	Variable Variable( kc )
	{
		Name	kc;
		Value	3.45;
		Fixed	1;
	}
	
	Variable Variable( j )
	{
		Name	j;
		Value	2.0;
		Fixed	1;
	}
	
	Variable Variable( p )
	{
		Name	p;
		Value	2.0;
		Fixed	1;
	}
	
	Variable Variable( epsilon )
	{
		Name	epsilon;
		Value	0.3;
		Fixed	1;
	}
	
	Variable Variable( theta )
	{
		Name	theta;
		Value	1.5;
		Fixed	1;
	}
	
	Variable Variable( eta )
	{
		Name	eta;
		Value	0.3;
		Fixed	1;
	}
	
	Variable Variable( VMsMDusp )
	{
		Name	VMsMDusp;
		Value	0.9;
		Fixed	1;
	}
	
	Variable Variable( VMdMDusp )
	{
		Name	VMdMDusp;
		Value	0.5;
		Fixed	1;
	}
	
	Variable Variable( VMK )
	{
		Name	VMK;
		Value	5.08;
		Fixed	1;
	}
	
	Variable Variable( VMP )
	{
		Name	VMP;
		Value	1.0;
		Fixed	1;
	}
	
	Variable Variable( VMaRas )
	{
		Name	VMaRas;
		Value	4.968;
		Fixed	1;
	}
	
	Variable Variable( VMdRas )
	{
		Name	VMdRas;
		Value	0.41;
		Fixed	1;
	}
	
	Variable Variable( VMaErk )
	{
		Name	VMaErk;
		Value	3.3;
		Fixed	1;
	}
	
	Variable Variable( VMaX )
	{
		Name	VMaX;
		Value	1.6;
		Fixed	1;
	}
	
	Variable Variable( VMdX )
	{
		Name	VMdX;
		Value	0.5;
		Fixed	1;
	}
	
	
}

System System( /SBMLRule )
{
	Name	"System for SBML Rule";
	StepperID	DE;

	Process ExpressionAssignmentProcess( Rule1 )
	{
		Expression	"P1.Value * (P2.Value / (P2.Value + V0.Value / cytosol.Value))";
		VariableReferenceList	[ P0 Variable:/SBMLParameter:vsFK 1 ] [ P1 Variable:/SBMLParameter:vsF 0 ] [ P2 Variable:/SBMLParameter:KIG1 0 ] [ V0 Variable:/cytosol:K 0 ] [ cytosol Variable:/cytosol:SIZE 0 ];
	}
	
	Process ExpressionAssignmentProcess( Rule2 )
	{
		Expression	"V1.Value / cytosol.Value - V2.Value / cytosol.Value";
		VariableReferenceList	[ V0 Variable:/cytosol:AK 1 ] [ cytosol Variable:/cytosol:SIZE 0 ] [ V1 Variable:/cytosol:Kt 0 ] [ V2 Variable:/cytosol:K 0 ];
	}
	
	Process ExpressionAssignmentProcess( Rule3 )
	{
		Expression	"V1.Value / cytosol.Value - V2.Value / cytosol.Value";
		VariableReferenceList	[ V0 Variable:/cytosol:Rasi 1 ] [ cytosol Variable:/cytosol:SIZE 0 ] [ V1 Variable:/cytosol:Rast 0 ] [ V2 Variable:/cytosol:Rasa 0 ];
	}
	
	Process ExpressionAssignmentProcess( Rule4 )
	{
		Expression	"V1.Value / cytosol.Value - V2.Value / cytosol.Value";
		VariableReferenceList	[ V0 Variable:/cytosol:ERKi 1 ] [ cytosol Variable:/cytosol:SIZE 0 ] [ V1 Variable:/cytosol:ERKt 0 ] [ V2 Variable:/cytosol:ERKa 0 ];
	}
	
	Process ExpressionAssignmentProcess( Rule5 )
	{
		Expression	"V1.Value / cytosol.Value - V2.Value / cytosol.Value";
		VariableReferenceList	[ V0 Variable:/cytosol:Xi 1 ] [ cytosol Variable:/cytosol:SIZE 0 ] [ V1 Variable:/cytosol:Xt 0 ] [ V2 Variable:/cytosol:Xa 0 ];
	}
	
	
}

