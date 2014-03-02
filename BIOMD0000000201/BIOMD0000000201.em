
# created by eml2em program
# from file: BIOMD0000000201.eml, date: Sun Mar  2 20:23:23 2014
#

Stepper ODEStepper( Default )
{
	# no property
}

System System( / )
{
	StepperID	Default;
	Name	default;

	Process ExpressionFluxProcess( n_synth )
	{
		Name	Notch_synthesis;
		Expression	"cytosol.Value * epsilon.Value * vsN.Value";
		VariableReferenceList
			[ N       Variable:/cytosol:N             1 ]
			[ cytosol Variable:/cytosol:SIZE          0 ]
			[ epsilon Variable:/SBMLParameter:epsilon 0 ]
			[ vsN     Variable:/SBMLParameter:vsN     0 ];
	}
	
	Process ExpressionFluxProcess( N_degradation )
	{
		Name	N_degradation;
		Expression	"epsilon.Value * cytosol.Value * vdN.Value * N.NumberConc / (KdN.Value + N.NumberConc)";
		VariableReferenceList
			[ N       Variable:/cytosol:N             -1 ]
			[ epsilon Variable:/SBMLParameter:epsilon 0  ]
			[ cytosol Variable:/cytosol:SIZE          0  ]
			[ vdN     Variable:/SBMLParameter:vdN     0  ]
			[ KdN     Variable:/SBMLParameter:KdN     0  ];
	}
	
	Process ExpressionFluxProcess( N_activation )
	{
		Name	Notch_activation;
		Expression	"epsilon.Value * cytosol.Value * kc.Value * N.NumberConc * pow(KIF.Value, j.Value) / (pow(KIF.Value, j.Value) + pow(F.NumberConc, j.Value))";
		VariableReferenceList
			[ N       Variable:/cytosol:N             -1 ]
			[ Na      Variable:/cytosol:Na            1  ]
			[ F       Variable:/cytosol:F             0  ]
			[ epsilon Variable:/SBMLParameter:epsilon 0  ]
			[ cytosol Variable:/cytosol:SIZE          0  ]
			[ kc      Variable:/SBMLParameter:kc      0  ]
			[ KIF     Variable:/SBMLParameter:KIF     0  ]
			[ j       Variable:/SBMLParameter:j       0  ];
	}
	
	Process ExpressionFluxProcess( Na_degradation )
	{
		Name	Na_degradation;
		Expression	"epsilon.Value * cytosol.Value * VdNa.Value * Na.NumberConc / (KdNa.Value + Na.NumberConc)";
		VariableReferenceList
			[ Na      Variable:/cytosol:Na            -1 ]
			[ epsilon Variable:/SBMLParameter:epsilon 0  ]
			[ cytosol Variable:/cytosol:SIZE          0  ]
			[ VdNa    Variable:/SBMLParameter:VdNa    0  ]
			[ KdNa    Variable:/SBMLParameter:KdNa    0  ];
	}
	
	Process ExpressionFluxProcess( Na_transport )
	{
		Name	"[Na] <-> [Nan];";
		Expression	"epsilon.Value * cytosol.Value * (kt1.Value * Na.NumberConc - kt2.Value * Nan.NumberConc)";
		VariableReferenceList
			[ Na      Variable:/cytosol:Na            -1 ]
			[ Nan     Variable:/cytosol:Nan           1  ]
			[ epsilon Variable:/SBMLParameter:epsilon 0  ]
			[ cytosol Variable:/cytosol:SIZE          0  ]
			[ kt1     Variable:/SBMLParameter:kt1     0  ]
			[ kt2     Variable:/SBMLParameter:kt2     0  ];
	}
	
	Process ExpressionFluxProcess( Nan_degradation )
	{
		Name	"[Nan] -> ;";
		Expression	"epsilon.Value * cytosol.Value * VdNan.Value * Nan.NumberConc / (KdNan.Value + Nan.NumberConc)";
		VariableReferenceList
			[ Nan     Variable:/cytosol:Nan           -1 ]
			[ epsilon Variable:/SBMLParameter:epsilon 0  ]
			[ cytosol Variable:/cytosol:SIZE          0  ]
			[ VdNan   Variable:/SBMLParameter:VdNan   0  ]
			[ KdNan   Variable:/SBMLParameter:KdNan   0  ];
	}
	
	Process ExpressionFluxProcess( MF_transkription )
	{
		Name	"-> [MF]; { Nan };";
		Expression	"epsilon.Value * cytosol.Value * vsFK.Value * pow(Nan.NumberConc, p.Value) / (pow(KA.Value, p.Value) + pow(Nan.NumberConc, p.Value))";
		VariableReferenceList
			[ MF      Variable:/cytosol:MF            1 ]
			[ Nan     Variable:/cytosol:Nan           0 ]
			[ epsilon Variable:/SBMLParameter:epsilon 0 ]
			[ cytosol Variable:/cytosol:SIZE          0 ]
			[ vsFK    Variable:/SBMLParameter:vsFK    0 ]
			[ p       Variable:/SBMLParameter:p       0 ]
			[ KA      Variable:/SBMLParameter:KA      0 ];
	}
	
	Process ExpressionFluxProcess( MF_degradation )
	{
		Name	"[MF] -> ;";
		Expression	"epsilon.Value * cytosol.Value * vmF.Value * MF.NumberConc / (KdMF.Value + MF.NumberConc)";
		VariableReferenceList
			[ MF      Variable:/cytosol:MF            -1 ]
			[ epsilon Variable:/SBMLParameter:epsilon 0  ]
			[ cytosol Variable:/cytosol:SIZE          0  ]
			[ vmF     Variable:/SBMLParameter:vmF     0  ]
			[ KdMF    Variable:/SBMLParameter:KdMF    0  ];
	}
	
	Process ExpressionFluxProcess( F_translation )
	{
		Name	"-> [F]; { MF };";
		Expression	"epsilon.Value * cytosol.Value * ksF.Value * MF.NumberConc";
		VariableReferenceList
			[ F       Variable:/cytosol:F             1 ]
			[ MF      Variable:/cytosol:MF            0 ]
			[ epsilon Variable:/SBMLParameter:epsilon 0 ]
			[ cytosol Variable:/cytosol:SIZE          0 ]
			[ ksF     Variable:/SBMLParameter:ksF     0 ];
	}
	
	Process ExpressionFluxProcess( F_degradation )
	{
		Name	"[F] -> ;";
		Expression	"epsilon.Value * cytosol.Value * vdF.Value * F.NumberConc / (KdF.Value + F.NumberConc)";
		VariableReferenceList
			[ F       Variable:/cytosol:F             -1 ]
			[ epsilon Variable:/SBMLParameter:epsilon 0  ]
			[ cytosol Variable:/cytosol:SIZE          0  ]
			[ vdF     Variable:/SBMLParameter:vdF     0  ]
			[ KdF     Variable:/SBMLParameter:KdF     0  ];
	}
	
	Process ExpressionFluxProcess( AK_dissoc )
	{
		Name	"[AK] <-> [A] + [K];";
		Expression	"theta.Value * cytosol.Value * (d1.Value * AK.NumberConc - a1.Value * A.NumberConc * K.NumberConc)";
		VariableReferenceList
			[ AK      Variable:/cytosol:AK          -1 ]
			[ A       Variable:/cytosol:A           1  ]
			[ K       Variable:/cytosol:K           1  ]
			[ theta   Variable:/SBMLParameter:theta 0  ]
			[ cytosol Variable:/cytosol:SIZE        0  ]
			[ d1      Variable:/SBMLParameter:d1    0  ]
			[ a1      Variable:/SBMLParameter:a1    0  ];
	}
	
	Process ExpressionFluxProcess( B_synth )
	{
		Name	"-> [B];";
		Expression	"theta.Value * cytosol.Value * vsB.Value";
		VariableReferenceList
			[ B       Variable:/cytosol:B           1 ]
			[ theta   Variable:/SBMLParameter:theta 0 ]
			[ cytosol Variable:/cytosol:SIZE        0 ]
			[ vsB     Variable:/SBMLParameter:vsB   0 ];
	}
	
	Process ExpressionFluxProcess( B_degradation )
	{
		Name	"[B] -> ;";
		Expression	"theta.Value * cytosol.Value * kd1.Value * B.NumberConc";
		VariableReferenceList
			[ B       Variable:/cytosol:B           -1 ]
			[ theta   Variable:/SBMLParameter:theta 0  ]
			[ cytosol Variable:/cytosol:SIZE        0  ]
			[ kd1     Variable:/SBMLParameter:kd1   0  ];
	}
	
	Process ExpressionFluxProcess( B_phosphorylation )
	{
		Name	"[B] -> [Bp]; { AK, D, Kt };";
		Expression	"theta.Value * cytosol.Value * VMK.Value * KID.Value / (KID.Value + D.NumberConc) * B.NumberConc / (K1.Value + B.NumberConc) * AK.NumberConc / Kt.NumberConc";
		VariableReferenceList
			[ B       Variable:/cytosol:B           -1 ]
			[ Bp      Variable:/cytosol:Bp          1  ]
			[ AK      Variable:/cytosol:AK          0  ]
			[ D       Variable:/cytosol:D           0  ]
			[ Kt      Variable:/cytosol:Kt          0  ]
			[ theta   Variable:/SBMLParameter:theta 0  ]
			[ cytosol Variable:/cytosol:SIZE        0  ]
			[ VMK     Variable:/SBMLParameter:VMK   0  ]
			[ KID     Variable:/SBMLParameter:KID   0  ]
			[ K1      Variable:/SBMLParameter:K1    0  ];
	}
	
	Process ExpressionFluxProcess( BP_dephosphorylation )
	{
		Name	"[Bp] -> [B];";
		Expression	"theta.Value * cytosol.Value * VMP.Value * Bp.NumberConc / (K2.Value + Bp.NumberConc)";
		VariableReferenceList
			[ Bp      Variable:/cytosol:Bp          -1 ]
			[ B       Variable:/cytosol:B           1  ]
			[ theta   Variable:/SBMLParameter:theta 0  ]
			[ cytosol Variable:/cytosol:SIZE        0  ]
			[ VMP     Variable:/SBMLParameter:VMP   0  ]
			[ K2      Variable:/SBMLParameter:K2    0  ];
	}
	
	Process ExpressionFluxProcess( B_shuttling )
	{
		Name	"[BN] <-> [B];";
		Expression	"theta.Value * cytosol.Value * (kt4.Value * BN.NumberConc - kt3.Value * B.NumberConc)";
		VariableReferenceList
			[ BN      Variable:/cytosol:BN          -1 ]
			[ B       Variable:/cytosol:B           1  ]
			[ theta   Variable:/SBMLParameter:theta 0  ]
			[ cytosol Variable:/cytosol:SIZE        0  ]
			[ kt4     Variable:/SBMLParameter:kt4   0  ]
			[ kt3     Variable:/SBMLParameter:kt3   0  ];
	}
	
	Process ExpressionFluxProcess( Bp_degradation )
	{
		Name	"[Bp] -> ;";
		Expression	"theta.Value * cytosol.Value * kd2.Value * Bp.NumberConc";
		VariableReferenceList
			[ Bp      Variable:/cytosol:Bp          -1 ]
			[ theta   Variable:/SBMLParameter:theta 0  ]
			[ cytosol Variable:/cytosol:SIZE        0  ]
			[ kd2     Variable:/SBMLParameter:kd2   0  ];
	}
	
	Process ExpressionFluxProcess( MAx_trans_basal )
	{
		Name	"-> [MAx]; { BN };";
		Expression	"theta.Value * cytosol.Value * v0.Value";
		VariableReferenceList
			[ MAx     Variable:/cytosol:MAx         1 ]
			[ BN      Variable:/cytosol:BN          0 ]
			[ theta   Variable:/SBMLParameter:theta 0 ]
			[ cytosol Variable:/cytosol:SIZE        0 ]
			[ v0      Variable:/SBMLParameter:v0    0 ];
	}
	
	Process ExpressionFluxProcess( MAx_trans_BN )
	{
		Name	"-> [MAx]; { BN };";
		Expression	"theta.Value * cytosol.Value * (vMB.Value * pow(BN.NumberConc, n.Value) / (pow(KaB.Value, n.Value) + pow(BN.NumberConc, n.Value)))";
		VariableReferenceList
			[ MAx     Variable:/cytosol:MAx         1 ]
			[ BN      Variable:/cytosol:BN          0 ]
			[ theta   Variable:/SBMLParameter:theta 0 ]
			[ cytosol Variable:/cytosol:SIZE        0 ]
			[ vMB     Variable:/SBMLParameter:vMB   0 ]
			[ n       Variable:/SBMLParameter:n     0 ]
			[ KaB     Variable:/SBMLParameter:KaB   0 ];
	}
	
	Process ExpressionFluxProcess( MAx_trans_Xa )
	{
		Name	"-> [MAx]; { Xa };";
		Expression	"theta.Value * cytosol.Value * (vMXa.Value * pow(Xa.NumberConc, m.Value) / (pow(KaXa.Value, m.Value) + pow(Xa.NumberConc, m.Value)))";
		VariableReferenceList
			[ MAx     Variable:/cytosol:MAx         1 ]
			[ Xa      Variable:/cytosol:Xa          0 ]
			[ theta   Variable:/SBMLParameter:theta 0 ]
			[ cytosol Variable:/cytosol:SIZE        0 ]
			[ vMXa    Variable:/SBMLParameter:vMXa  0 ]
			[ m       Variable:/SBMLParameter:m     0 ]
			[ KaXa    Variable:/SBMLParameter:KaXa  0 ];
	}
	
	Process ExpressionFluxProcess( MAx_degradation )
	{
		Name	"[MAx] -> ;";
		Expression	"theta.Value * cytosol.Value * vmd.Value * MAx.NumberConc / (Kmd.Value + MAx.NumberConc)";
		VariableReferenceList
			[ MAx     Variable:/cytosol:MAx         -1 ]
			[ theta   Variable:/SBMLParameter:theta 0  ]
			[ cytosol Variable:/cytosol:SIZE        0  ]
			[ vmd     Variable:/SBMLParameter:vmd   0  ]
			[ Kmd     Variable:/SBMLParameter:Kmd   0  ];
	}
	
	Process ExpressionFluxProcess( A_translation )
	{
		Name	"-> [A]; { MAx };";
		Expression	"theta.Value * cytosol.Value * ksAx.Value * MAx.NumberConc";
		VariableReferenceList
			[ A       Variable:/cytosol:A           1 ]
			[ MAx     Variable:/cytosol:MAx         0 ]
			[ theta   Variable:/SBMLParameter:theta 0 ]
			[ cytosol Variable:/cytosol:SIZE        0 ]
			[ ksAx    Variable:/SBMLParameter:ksAx  0 ];
	}
	
	Process ExpressionFluxProcess( A_degradation )
	{
		Name	"[A] -> ;";
		Expression	"theta.Value * cytosol.Value * vdAx.Value * A.NumberConc / (KdAx.Value + A.NumberConc)";
		VariableReferenceList
			[ A       Variable:/cytosol:A           -1 ]
			[ theta   Variable:/SBMLParameter:theta 0  ]
			[ cytosol Variable:/cytosol:SIZE        0  ]
			[ vdAx    Variable:/SBMLParameter:vdAx  0  ]
			[ KdAx    Variable:/SBMLParameter:KdAx  0  ];
	}
	
	Process ExpressionFluxProcess( Ras_activation )
	{
		Name	"-> [Rasa]; { Rasi, Fgf };";
		Expression	"eta.Value * cytosol.Value * VMaRas.Value * pow(Fgf.NumberConc, r.Value) / (pow(KaFgf.Value, r.Value) + pow(Fgf.NumberConc, r.Value)) * Rasi.NumberConc / (KaRas.Value + Rasi.NumberConc)";
		VariableReferenceList
			[ Rasa    Variable:/cytosol:Rasa         1 ]
			[ Rasi    Variable:/cytosol:Rasi         0 ]
			[ Fgf     Variable:/cytosol:Fgf          0 ]
			[ eta     Variable:/SBMLParameter:eta    0 ]
			[ cytosol Variable:/cytosol:SIZE         0 ]
			[ VMaRas  Variable:/SBMLParameter:VMaRas 0 ]
			[ r       Variable:/SBMLParameter:r      0 ]
			[ KaFgf   Variable:/SBMLParameter:KaFgf  0 ]
			[ KaRas   Variable:/SBMLParameter:KaRas  0 ];
	}
	
	Process ExpressionFluxProcess( Ras_inactivation )
	{
		Name	"[Rasa] -> ;";
		Expression	"eta.Value * cytosol.Value * VMdRas.Value * Rasa.NumberConc / (KdRas.Value + Rasa.NumberConc)";
		VariableReferenceList
			[ Rasa    Variable:/cytosol:Rasa         -1 ]
			[ eta     Variable:/SBMLParameter:eta    0  ]
			[ cytosol Variable:/cytosol:SIZE         0  ]
			[ VMdRas  Variable:/SBMLParameter:VMdRas 0  ]
			[ KdRas   Variable:/SBMLParameter:KdRas  0  ];
	}
	
	Process ExpressionFluxProcess( Erk_activation )
	{
		Name	"-> [ERKa]; { ERKi, Rasa, Rast };";
		Expression	"eta.Value * cytosol.Value * VMaErk.Value * Rasa.NumberConc / Rast.NumberConc * ERKi.NumberConc / (KaErk.Value + ERKi.NumberConc)";
		VariableReferenceList
			[ ERKa    Variable:/cytosol:ERKa         1 ]
			[ ERKi    Variable:/cytosol:ERKi         0 ]
			[ Rasa    Variable:/cytosol:Rasa         0 ]
			[ Rast    Variable:/cytosol:Rast         0 ]
			[ eta     Variable:/SBMLParameter:eta    0 ]
			[ cytosol Variable:/cytosol:SIZE         0 ]
			[ VMaErk  Variable:/SBMLParameter:VMaErk 0 ]
			[ KaErk   Variable:/SBMLParameter:KaErk  0 ];
	}
	
	Process ExpressionFluxProcess( Erk_inactivation )
	{
		Name	"[ERKa] -> ; { Dusp };";
		Expression	"eta.Value * cytosol.Value * kcDusp.Value * Dusp.NumberConc * ERKa.NumberConc / (KdErk.Value + ERKa.NumberConc)";
		VariableReferenceList
			[ ERKa    Variable:/cytosol:ERKa         -1 ]
			[ Dusp    Variable:/cytosol:Dusp         0  ]
			[ eta     Variable:/SBMLParameter:eta    0  ]
			[ cytosol Variable:/cytosol:SIZE         0  ]
			[ kcDusp  Variable:/SBMLParameter:kcDusp 0  ]
			[ KdErk   Variable:/SBMLParameter:KdErk  0  ];
	}
	
	Process ExpressionFluxProcess( X_activation )
	{
		Name	"-> [Xa]; { ERKa, ERKt, Xi };";
		Expression	"eta.Value * cytosol.Value * VMaX.Value * ERKa.NumberConc / ERKt.NumberConc * Xi.NumberConc / (KaX.Value + Xi.NumberConc)";
		VariableReferenceList
			[ Xa      Variable:/cytosol:Xa         1 ]
			[ ERKa    Variable:/cytosol:ERKa       0 ]
			[ ERKt    Variable:/cytosol:ERKt       0 ]
			[ Xi      Variable:/cytosol:Xi         0 ]
			[ eta     Variable:/SBMLParameter:eta  0 ]
			[ cytosol Variable:/cytosol:SIZE       0 ]
			[ VMaX    Variable:/SBMLParameter:VMaX 0 ]
			[ KaX     Variable:/SBMLParameter:KaX  0 ];
	}
	
	Process ExpressionFluxProcess( X_inactivation )
	{
		Name	"[Xa] -> ;";
		Expression	"eta.Value * cytosol.Value * VMdX.Value * Xa.NumberConc / (KdX.Value + Xa.NumberConc)";
		VariableReferenceList
			[ Xa      Variable:/cytosol:Xa         -1 ]
			[ eta     Variable:/SBMLParameter:eta  0  ]
			[ cytosol Variable:/cytosol:SIZE       0  ]
			[ VMdX    Variable:/SBMLParameter:VMdX 0  ]
			[ KdX     Variable:/SBMLParameter:KdX  0  ];
	}
	
	Process ExpressionFluxProcess( MDusp_transkription )
	{
		Name	"-> [MDusp]; { Xa };";
		Expression	"eta.Value * cytosol.Value * VMsMDusp.Value * pow(Xa.NumberConc, q.Value) / (pow(KaMDusp.Value, q.Value) + pow(Xa.NumberConc, q.Value))";
		VariableReferenceList
			[ MDusp    Variable:/cytosol:MDusp          1 ]
			[ Xa       Variable:/cytosol:Xa             0 ]
			[ eta      Variable:/SBMLParameter:eta      0 ]
			[ cytosol  Variable:/cytosol:SIZE           0 ]
			[ VMsMDusp Variable:/SBMLParameter:VMsMDusp 0 ]
			[ q        Variable:/SBMLParameter:q        0 ]
			[ KaMDusp  Variable:/SBMLParameter:KaMDusp  0 ];
	}
	
	Process ExpressionFluxProcess( MDusp_degradation )
	{
		Name	"[MDusp] -> ;";
		Expression	"eta.Value * cytosol.Value * VMdMDusp.Value * MDusp.NumberConc / (KdMDusp.Value + MDusp.NumberConc)";
		VariableReferenceList
			[ MDusp    Variable:/cytosol:MDusp          -1 ]
			[ eta      Variable:/SBMLParameter:eta      0  ]
			[ cytosol  Variable:/cytosol:SIZE           0  ]
			[ VMdMDusp Variable:/SBMLParameter:VMdMDusp 0  ]
			[ KdMDusp  Variable:/SBMLParameter:KdMDusp  0  ];
	}
	
	Process ExpressionFluxProcess( Dusp_translation )
	{
		Name	"-> [Dusp]; { MDusp };";
		Expression	"eta.Value * cytosol.Value * ksDusp.Value * MDusp.NumberConc";
		VariableReferenceList
			[ Dusp    Variable:/cytosol:Dusp         1 ]
			[ MDusp   Variable:/cytosol:MDusp        0 ]
			[ eta     Variable:/SBMLParameter:eta    0 ]
			[ cytosol Variable:/cytosol:SIZE         0 ]
			[ ksDusp  Variable:/SBMLParameter:ksDusp 0 ];
	}
	
	Process ExpressionFluxProcess( Dusp_degradation )
	{
		Name	"[Dusp] -> ;";
		Expression	"eta.Value * cytosol.Value * vdDusp.Value * Dusp.NumberConc / (KdDusp.Value + Dusp.NumberConc)";
		VariableReferenceList
			[ Dusp    Variable:/cytosol:Dusp         -1 ]
			[ eta     Variable:/SBMLParameter:eta    0  ]
			[ cytosol Variable:/cytosol:SIZE         0  ]
			[ vdDusp  Variable:/SBMLParameter:vdDusp 0  ]
			[ KdDusp  Variable:/SBMLParameter:KdDusp 0  ];
	}
	
	
}

System System( /cytosol )
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
	
	Variable Variable( N )
	{
		Name	"Notch protein";
		NumberConc	0.5;
		Fixed	0;
	}
	
	Variable Variable( Na )
	{
		Name	"cytosolic NicD";
		NumberConc	0.2;
		Fixed	0;
	}
	
	Variable Variable( Nan )
	{
		Name	"nuclear NicD";
		NumberConc	0.0;
		Fixed	0;
	}
	
	Variable Variable( MF )
	{
		Name	"Lunatic fringe mRNA";
		NumberConc	0.1;
		Fixed	0;
	}
	
	Variable Variable( F )
	{
		Name	"Lunatic Fringe protein";
		NumberConc	0.001;
		Fixed	0;
	}
	
	Variable Variable( Bp )
	{
		Name	"phosph. beta-catenin";
		NumberConc	0.1;
		Fixed	0;
	}
	
	Variable Variable( BN )
	{
		Name	"nuclear beta-catenin";
		NumberConc	0.001;
		Fixed	0;
	}
	
	Variable Variable( A )
	{
		Name	"Axin2 protein";
		NumberConc	0.1;
		Fixed	0;
	}
	
	Variable Variable( K )
	{
		Name	Gsk3;
		NumberConc	3.0;
		Fixed	0;
	}
	
	Variable Variable( B )
	{
		Name	"beta-catenin";
		NumberConc	0.1;
		Fixed	0;
	}
	
	Variable Variable( MAx )
	{
		Name	"Axin2 mRNA";
		NumberConc	0.1;
		Fixed	0;
	}
	
	Variable Variable( Rasa )
	{
		Name	"active Ras";
		NumberConc	0.5;
		Fixed	0;
	}
	
	Variable Variable( ERKa )
	{
		Name	"active ERK";
		NumberConc	0.2;
		Fixed	0;
	}
	
	Variable Variable( Xa )
	{
		Name	"active TF X";
		NumberConc	0.1;
		Fixed	0;
	}
	
	Variable Variable( MDusp )
	{
		Name	"Dusp6 mRNA";
		NumberConc	0.1;
		Fixed	0;
	}
	
	Variable Variable( Dusp )
	{
		Name	"Dusp6 protein";
		NumberConc	0.1;
		Fixed	0;
	}
	
	Variable Variable( Rasi )
	{
		Name	"inactive Ras";
		Value	1.5;
		Fixed	0;
	}
	
	Variable Variable( ERKi )
	{
		Name	"inactive ERK";
		Value	1.8;
		Fixed	0;
	}
	
	Variable Variable( Xi )
	{
		Name	"inactive TF X";
		Value	1.9;
		Fixed	0;
	}
	
	Variable Variable( Rast )
	{
		Name	"Ras total";
		NumberConc	2.0;
		Fixed	0;
	}
	
	Variable Variable( ERKt )
	{
		Name	"ERK total";
		NumberConc	2.0;
		Fixed	0;
	}
	
	Variable Variable( Xt )
	{
		Name	"X total";
		NumberConc	2.0;
		Fixed	0;
	}
	
	Variable Variable( D )
	{
		Name	"Dsh protein";
		NumberConc	2.0;
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
		NumberConc	3.0;
		Fixed	1;
	}
	
	Variable Variable( Fgf )
	{
		Name	Fgf;
		NumberConc	1.0;
		Fixed	1;
	}
	
	
}

System System( /SBMLParameter )
{
	StepperID	Default;
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
		Value	1.36363636364;
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
	StepperID	Default;

	Process ExpressionAssignmentProcess( Assignment_vsFK )
	{
		StepperID	Default;
		Name	"Assignment rule for 'vsFK'";
		Expression	"vsF.NumberConc * (KIG1.NumberConc / (KIG1.NumberConc + K.NumberConc))";
		VariableReferenceList
			[ vsFK Variable:/SBMLParameter:vsFK 1 ]
			[ vsF  Variable:/SBMLParameter:vsF  0 ]
			[ KIG1 Variable:/SBMLParameter:KIG1 0 ]
			[ K    Variable:/cytosol:K          0 ];
	}
	
	Process ExpressionAssignmentProcess( Assignment_AK )
	{
		StepperID	Default;
		Name	"Assignment rule for 'AK'";
		Expression	"Kt.NumberConc - K.NumberConc";
		VariableReferenceList
			[ AK Variable:/cytosol:AK 1 ]
			[ Kt Variable:/cytosol:Kt 0 ]
			[ K  Variable:/cytosol:K  0 ];
	}
	
	Process ExpressionAssignmentProcess( Assignment_Rasi )
	{
		StepperID	Default;
		Name	"Assignment rule for 'Rasi'";
		Expression	"Rast.NumberConc - Rasa.NumberConc";
		VariableReferenceList
			[ Rasi Variable:/cytosol:Rasi 1 ]
			[ Rast Variable:/cytosol:Rast 0 ]
			[ Rasa Variable:/cytosol:Rasa 0 ];
	}
	
	Process ExpressionAssignmentProcess( Assignment_ERKi )
	{
		StepperID	Default;
		Name	"Assignment rule for 'ERKi'";
		Expression	"ERKt.NumberConc - ERKa.NumberConc";
		VariableReferenceList
			[ ERKi Variable:/cytosol:ERKi 1 ]
			[ ERKt Variable:/cytosol:ERKt 0 ]
			[ ERKa Variable:/cytosol:ERKa 0 ];
	}
	
	Process ExpressionAssignmentProcess( Assignment_Xi )
	{
		StepperID	Default;
		Name	"Assignment rule for 'Xi'";
		Expression	"Xt.NumberConc - Xa.NumberConc";
		VariableReferenceList
			[ Xi Variable:/cytosol:Xi 1 ]
			[ Xt Variable:/cytosol:Xt 0 ]
			[ Xa Variable:/cytosol:Xa 0 ];
	}
	
	
}

