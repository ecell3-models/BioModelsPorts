# BIOMD0000000236 - Westermark2003_Pancreatic_GlycOsc_extended
# 
# Westermark PO, Lansner A. 
# A model of phosphofructokinase and glycolytic oscillations in the pancreatic beta-cell. 
# Biophys. J. 2003 Jul; 85(1): 126-139 
# PSCI/SANS, NADA, Royal Institute of Technology (KTH), SE-100 44 Stockholm, Sweden.


##### Steppers #####

Stepper FixedODE1Stepper( ODE ) {}
Stepper DiscreteTimeStepper( DT ) {}


##### Model Entities #####

System System( / )
{
	StepperID ODE;

	Variable Variable( SIZE ){ Value 1.0; }

	#### Global Parameters (26) ####

	Variable Variable( Vgk )       { Value 0.05555; }   # Vgk_min*dw_per_ml/min_to_sec = Vgk
	Variable Variable( hGK )       { Value 1.7; }
	Variable Variable( KeqGPI )    { Value 0.3; }
	Variable Variable( KeqTPI )    { Value 0.045455; }
	Variable Variable( Vpfk )      { Value 0.5555; }    # Vpfk_min*dw_per_ml/min_to_sec = Vpfk
	Variable Variable( Vfba )      { Value 0.138875; }  # Vfba_min*dw_per_ml/min_to_sec = Vfba
	Variable Variable( Vgapdh )    { Value 1.38875; }   # Vgapdh_min*dw_per_ml/min_to_sec = Vgapdh
	Variable Variable( Sgk )       { Value 8.0; }
	Variable Variable( Spfk )      { Value 4.0; }
	Variable Variable( Sfba )      { Value 0.0050; }
	Variable Variable( Sgapdh )    { Value 0.0050; }
	Variable Variable( Xpfk )      { Value 0.01; }
	Variable Variable( alpha )     { Value 5.0; }
	Variable Variable( hx )        { Value 2.5; }
	Variable Variable( hpfk )      { Value 2.5; }
	Variable Variable( hact )      { Value 1.0; }
	Variable Variable( dw_per_ml ) { Value 0.3333; }
	Variable Variable( min_to_sec ){ Value 60.0; }
	Variable Variable( Vgk_min )   { Value 10.0; }
	Variable Variable( Vpfk_min )  { Value 100.0; }
	Variable Variable( Vfba_min )  { Value 25.0; }
	Variable Variable( Vgapdh_min ){ Value 250.0; }
	Variable Variable( Pfba )      { Value 0.5; }
	Variable Variable( Qfba )      { Value 0.275; }
	Variable Variable( KeqFBA )    { Value 0.1; }
	Variable Variable( sigma )     { Value 0.25; }      # fructose-6-phosphate/Spfk = sigma
	
}

System System( /cell )
{
	StepperID ODE;

	Variable Variable( SIZE ){ Value 1.0; }

	Variable Variable( intracellular_glucose )
	{
		Name "intracellular glucose";
		Value 1.0;
	}

	Variable Variable( G6P_F6P )
	{
		Name "G6P_F6P";
		Value 1.0;
	}

	Variable Variable( fructose_6_phosphate )
	{
		Name "fructose-6-phosphate";
		Value 1.0;
	}

	Variable Variable( fructose_16_biphosphate )
	{
		Name "fructose-1,6-biphosphate";
		Value 1.0;
	}
	
	Variable Variable( glyceraldehyde__phosphate )
	{
		Name "glyceraldehyde--phosphate";
		Value 1.0;
	}
	
	Variable Variable( dihydroxyacetone_phosphate )
	{
		Name "dihydroxyacetone-phosphate";
		Value 1.0;
	}
	
	Variable Variable( DHAP_G3P_pool )
	{
		Name "DHAP-G3P pool";
		Value 1.0;
	}

	##### Reactions (4) #####

	Process ExpressionFluxProcess( vgk )
	{
		Name "hexokinase activity & glucose-6-phosphate isomerase activity";

		VariableReferenceList

			## Parameters ##
			[ Vgk :/:Vgk 0 ]
			[ Sgk :/:Sgk 0 ]
			[ hGK :/:hGK 0 ]
			
			## Species ##
			[ intracellular_glucose :.:intracellular_glucose -1 ]
			[ G6P_F6P               :.:G6P_F6P                1 ];

		Expression "Vgk.Value * pow( intracellular_glucose.Value / Sgk.Value, hGK.Value )/( 1.0 + pow( intracellular_glucose.Value / Sgk.Value, hGK.Value ))";

	}

	Process ExpressionFluxProcess( vpfk )
	{
		Name "6-phosphofructokinase activity";

		VariableReferenceList

			## Parameters ##
			[ Vpfk  :/:Vpfk  0 ]
			[ Spfk  :/:Spfk  0 ]
			[ hpfk  :/:hpfk  0 ]
			[ hact  :/:hact  0 ]
			[ Sfba  :/:Sfba  0 ]
			[ Xpfk  :/:Xpfk  0 ]
			[ hx    :/:hx    0 ]
			[ alpha :/:alpha 0 ]

			## Species ##
			[ G6P_F6P                 :.:G6P_F6P                 -1 ]
			[ fructose_16_biphosphate :.:fructose_16_biphosphate  1 ]
			[ fructose_6_phosphate    :.:fructose_6_phosphate     0 ];

		Expression "Vpfk.Value *pow( fructose_6_phosphate.Value / Spfk.Value, hpfk.Value - ( hpfk.Value  - hact.Value  ) * fructose_16_biphosphate.Value / Sfba.Value /( 1.0 + fructose_16_biphosphate.Value / Sfba.Value )) / ( pow( fructose_6_phosphate.Value / Spfk.Value, hpfk.Value - ( hpfk.Value - hact.Value ) * fructose_16_biphosphate.Value / Sfba.Value /( 1.0 + fructose_16_biphosphate.Value / Sfba.Value ))+( 1.0 + pow( fructose_16_biphosphate.Value / Xpfk.Value, hx.Value ))/( 1.0 +pow( alpha.Value, hpfk.Value - ( hpfk.Value - hact.Value ) * fructose_16_biphosphate.Value / Sfba.Value /( 1.0 + fructose_16_biphosphate.Value /Sfba.Value )) * pow( fructose_16_biphosphate.Value / Xpfk.Value, hx.Value )))";

	}

	Process ExpressionFluxProcess( vfba )
	{
		Name " fructose-bisphosphate aldolase activity";

		VariableReferenceList

			## Parameters ##
			[ Vfba   :/:Vfba   0 ]
			[ Sfba   :/:Sfba   0 ]
			[ Pfba   :/:Pfba   0 ]
			[ Qfba   :/:Qfba   0 ]
			[ KeqFBA :/:KeqFBA 0 ]

			## Species ##
			[ fructose_16_biphosphate    :.:fructose_16_biphosphate    -1 ]
			[ DHAP_G3P_pool              :.:DHAP_G3P_pool               2 ]
			[ glyceraldehyde__phosphate  :.:glyceraldehyde__phosphate   0 ]
			[ dihydroxyacetone_phosphate :.:dihydroxyacetone_phosphate  0 ];

		Expression "Vfba.Value * ( fructose_16_biphosphate.Value / Sfba.Value - glyceraldehyde__phosphate.Value * dihydroxyacetone_phosphate.Value / ( Pfba.Value * Qfba.Value * KeqFBA.Value ))/( 1.0 + fructose_16_biphosphate.Value / Sfba.Value + dihydroxyacetone_phosphate.Value / Qfba.Value + glyceraldehyde__phosphate.Value * dihydroxyacetone_phosphate.Value / ( Pfba.Value * Qfba.Value ))";

	}

	Process ExpressionFluxProcess( vgapdh )
	{
		Name "glyceraldehyde-3-phosphate dehydrogenase (NAD+) (phosphorylating) activity";

		VariableReferenceList

			## Parameters ##
			[ Vgapdh :/:Vgapdh 0 ]
			[ Sgapdh :/:Sgapdh 0 ]

			## Species ##
			[ DHAP_G3P_pool             :.:DHAP_G3P_pool             -1 ]
			[ glyceraldehyde__phosphate :.:glyceraldehyde__phosphate  0 ];

		Expression "Vgapdh.Value * glyceraldehyde__phosphate.Value / ( Sgapdh.Value + glyceraldehyde__phosphate.Value )";

	}

	##### Rules (8) #####

	Process ExpressionAssignmentProcess( sigma )
	{
		StepperID DT;

		Name "Assignment Rule (name: sigma)";

		VariableReferenceList

			## Parameters ##
			[ Spfk  :/:Spfk  0 ]
			[ sigma :/:sigma 1 ]

			## Species ##
			[ fructose_6_phosphate :.:fructose_6_phosphate  0 ];

		Expression "fructose_6_phosphate.Value / Spfk.Value";

	}

	Process ExpressionAssignmentProcess( Vgk )
	{
		StepperID DT;

		Name "Assignment Rule (name: Vgk)";

		VariableReferenceList

			## Parameters ##
			[ Vgk_min    :/:Vgk_min    0 ]
			[ dw_per_ml  :/:dw_per_ml  0 ]
			[ min_to_sec :/:min_to_sec 0 ]
			[ Vgk        :/:Vgk        1 ];

		Expression "Vgk_min.Value * dw_per_ml.Value / min_to_sec.Value";

	}

	Process ExpressionAssignmentProcess( Vpfk )
	{
		StepperID DT;

		Name "Assignment Rule (name: Vpfk)";

		VariableReferenceList

			## Parameters ##
			[ Vpfk_min   :/:Vpfk_min   0 ]
			[ dw_per_ml  :/:dw_per_ml  0 ]
			[ min_to_sec :/:min_to_sec 0 ]
			[ Vpfk       :/:Vpfk       1 ];

		Expression "Vpfk_min.Value * dw_per_ml.Value / min_to_sec.Value";

	}

	Process ExpressionAssignmentProcess( Vfba )
	{
		StepperID DT;

		Name "Assignment Rule (name: Vfba)";

		VariableReferenceList

			## Parameters ##
			[ Vfba_min   :/:Vfba_min   0 ]
			[ dw_per_ml  :/:dw_per_ml  0 ]
			[ min_to_sec :/:min_to_sec 0 ]
			[ Vfba       :/:Vfba       1 ];

		Expression "Vfba_min.Value * dw_per_ml.Value / min_to_sec.Value";

	}

	Process ExpressionAssignmentProcess( Vgapdh )
	{
		StepperID DT;

		Name "Assignment Rule (name: Vgapdh)";

		VariableReferenceList

			## Parameters ##
			[ Vgapdh_min :/:Vgapdh_min 0 ]
			[ dw_per_ml  :/:dw_per_ml  0 ]
			[ min_to_sec :/:min_to_sec 0 ]
			[ Vgapdh     :/:Vgapdh     1 ];

		Expression "Vgapdh_min.Value * dw_per_ml.Value / min_to_sec.Value";

	}

	Process ExpressionAssignmentProcess( F6P )
	{
		StepperID DT;

		Name "Assignment Rule (name: F6P)";

		VariableReferenceList

			## Parameters ##
			[ KeqGPI :/:KeqGPI 0 ]

			## Species ##
			[ G6P_F6P              :.:G6P_F6P               0 ]
			[ fructose_6_phosphate :.:fructose_6_phosphate  1 ];

		Expression "G6P_F6P.Value * KeqGPI.Value /( 1.0 + KeqGPI.Value )";

	}

	Process ExpressionAssignmentProcess( G3P )
	{
		StepperID DT;

		Name "Assignment Rule (name: G3P)";

		VariableReferenceList

			## Parameters ##
			[ KeqTPI :/:KeqTPI 0 ]

			## Species ##
			[ DHAP_G3P_pool             :.:DHAP_G3P_pool              0 ]
			[ glyceraldehyde__phosphate :.:glyceraldehyde__phosphate  1 ];

		Expression "DHAP_G3P_pool.Value * KeqTPI.Value /( 1.0 + KeqTPI.Value )";

	}

	Process ExpressionAssignmentProcess( DHAP )
	{
		StepperID DT;

		Name "Assignment Rule (name: DHAP)";

		VariableReferenceList

			## Species ##
			[ DHAP_G3P_pool              :.:DHAP_G3P_pool               0 ]
			[ glyceraldehyde__phosphate  :.:glyceraldehyde__phosphate   0 ]
			[ dihydroxyacetone_phosphate :.:dihydroxyacetone_phosphate  1 ];

		Expression "DHAP_G3P_pool.Value - glyceraldehyde__phosphate.Value";

	}

}

# Originally Ported by Yasuhiro Naito 2013/12/14
