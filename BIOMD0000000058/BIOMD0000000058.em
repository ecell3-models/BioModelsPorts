# BIOMD0000000058 - Bindschadler2001_coupled_Ca_oscillators
# 
# Bindschadler M, Sneyd J. 
# A bifurcation analysis of two coupled calcium oscillators. 
# Chaos 2001 Mar; 11(1): 237-246 
# Department of Mathematics, University of Michigan, Ann Arbor, Michigan.

Stepper FixedODE1Stepper( ODE )
{
	# no property
}

Stepper DiscreteTimeStepper( DT )
{
	# no property
}

System System( / )
{
	StepperID	DT;

	Variable Variable( SIZE )
	{
		Value	1.0;
	}

	#### Global Parameters (16) ####

	Variable Variable( Phi1_c1 )
	{
		Value	4.761904761904762;
	}

	Variable Variable( r2 )
	{
		Value	100.0;
	}

	Variable Variable( R1 )
	{
		Value	6.0;
	}

	Variable Variable( Phi_minus1_c1 )
	{
		Value	0.874751491053678;
	}

	Variable Variable( k1 )
	{
		Value	44.0;
	}

	Variable Variable( R3 )
	{
		Value	50.0;
	}

	Variable Variable( Phi2_c1 )
	{
		Value	0.6461232604373758;
	}

	Variable Variable( k2 )
	{
		Value	26.5;
	}

	Variable Variable( r4 )
	{
		Value	20.0;
	}

	Variable Variable( Phi3_c1 )
	{
		Value	0.8421052631578947;
	}

	Variable Variable( k3 )
	{
		Value	1.6;
	}

	Variable Variable( R5 )
	{
		Value	1.6;
	}

	Variable Variable( Phi1_c2 )
	{
		Value	1.639344262295082;
	}

	Variable Variable( Phi_minus1_c2 )
	{
		Value	0.8782435129740519;
	}

	Variable Variable( Phi2_c2 )
	{
		Value	0.5688622754491017;
	}

	Variable Variable( Phi3_c2 )
	{
		Value	0.9411764705882353;
	}

	#### Rules (8) ####

	Process ExpressionAssignmentProcess( Phi1_c1 )
	{
		VariableReferenceList
			[ Calcium_ion_Cell1 :/compartment:Calcium_ion_Cell1 0 ]
			[ r2                :.:r2                           0 ]
			[ R1                :.:R1                           0 ]
			[ Phi1_c1           :.:Phi1_c1                      1 ];

		Expression "r2.Value * Calcium_ion_Cell1.MolarConc / ( R1.Value + Calcium_ion_Cell1.MolarConc )";
	}

	Process ExpressionAssignmentProcess( Phi_minus1_c1 )
	{
		VariableReferenceList
			[ Calcium_ion_Cell1 :/compartment:Calcium_ion_Cell1 0 ]
			[ k1                :.:k1                           0 ]
			[ R3                :.:R3                           0 ]
			[ Phi_minus1_c1     :.:Phi_minus1_c1                1 ];

		Expression "k1.Value / ( R3.Value + Calcium_ion_Cell1.MolarConc )";
	}

	Process ExpressionAssignmentProcess( Phi2_c1 )
	{
		VariableReferenceList
			[ Calcium_ion_Cell1 :/compartment:Calcium_ion_Cell1 0 ]
			[ k2                :.:k2                           0 ]
			[ r4                :.:r4                           0 ]
			[ R3                :.:R3                           0 ]
			[ Phi2_c1           :.:Phi2_c1                      1 ];

		Expression "( k2.Value + r4.Value * Calcium_ion_Cell1.MolarConc ) / ( R3.Value + Calcium_ion_Cell1.MolarConc )";
	}

	Process ExpressionAssignmentProcess( Phi3_c1 )
	{
		VariableReferenceList
			[ Calcium_ion_Cell1 :/compartment:Calcium_ion_Cell1 0 ]
			[ k3                :.:k3                           0 ]
			[ R5                :.:R5                           0 ]
			[ Phi3_c1           :.:Phi3_c1                      1 ];

		Expression "k3.Value / ( R5.Value + Calcium_ion_Cell1.MolarConc )";
	}

	Process ExpressionAssignmentProcess( Phi1_c2 )
	{
		VariableReferenceList
			[ Calcium_ion_Cell2 :/compartment:Calcium_ion_Cell2 0 ]
			[ r2                :.:r2                           0 ]
			[ R1                :.:R1                           0 ]
			[ Phi1_c2           :.:Phi1_c2                      1 ];

		Expression "r2.Value * Calcium_ion_Cell2.MolarConc / ( R1.Value + Calcium_ion_Cell2.MolarConc )";
	}

	Process ExpressionAssignmentProcess( Phi_minus1_c2 )
	{
		VariableReferenceList
			[ Calcium_ion_Cell2 :/compartment:Calcium_ion_Cell2 0 ]
			[ k1                :.:k1                           0 ]
			[ R3                :.:R3                           0 ]
			[ Phi_minus1_c2     :.:Phi_minus1_c2                1 ];

		Expression "k1.Value / ( R3.Value + Calcium_ion_Cell2.MolarConc )";
	}

	Process ExpressionAssignmentProcess( Phi2_c2 )
	{
		VariableReferenceList
			[ Calcium_ion_Cell2 :/compartment:Calcium_ion_Cell2 0 ]
			[ k2                :.:k2                           0 ]
			[ r4                :.:r4                           0 ]
			[ R3                :.:R3                           0 ]
			[ Phi2_c2           :.:Phi2_c2                      1 ];

		Expression "( k2.Value + r4.Value * Calcium_ion_Cell2.MolarConc ) / ( R3.Value + Calcium_ion_Cell2.MolarConc )";
	}

	Process ExpressionAssignmentProcess( Phi3_c2 )
	{
		VariableReferenceList
			[ Calcium_ion_Cell2 :/compartment:Calcium_ion_Cell2 0 ]
			[ k3                :.:k3                           0 ]
			[ R5                :.:R5                           0 ]
			[ Phi3_c2           :.:Phi3_c2                      1 ];

		Expression "k3.Value / ( R5.Value + Calcium_ion_Cell2.MolarConc )";
	}
}

System System( /compartment )
{
	StepperID	ODE;

	Name "compartment";

	Variable Variable( SIZE )
	{
		Value	1.0;
	}

	#### Species (4) ####

	Variable Variable( Calcium_ion_Cell1 )
	{
		MolarConc	0.3;
	}

	Variable Variable( Receptor_fraction_Cell1 )
	{
		MolarConc	0.8;
	}

	Variable Variable( Calcium_ion_Cell2 )
	{
		MolarConc	0.1;
	}

	Variable Variable( Receptor_fraction_Cell2 )
	{
		MolarConc	0.1;
	}
	#### Reactions (11) ####

	Process ExpressionFluxProcess( IP3Rmediated_Ca_release_Cell1 )
	{
		Name "IP3R mediated Ca release Cell1";

		VariableReferenceList
			[ compartment             :.:SIZE                    0 ]
			[ Receptor_fraction_Cell1 :.:Receptor_fraction_Cell1 0 ]
			[ Phi1_c1                 :/:Phi1_c1                 0 ]
			[ Phi_minus1_c1           :/:Phi_minus1_c1           0 ]
			[ Calcium_ion_Cell1       :.:Calcium_ion_Cell1       1 ];

		kf  28.0;
		p   0.2778;

		Expression "compartment.Value * kf* pow(( p * Receptor_fraction_Cell1.MolarConc * Phi1_c1.Value / ( Phi1_c1.Value * p + Phi_minus1_c1.Value )), 4 ) * self.getSuperSystem().SizeN_A";
	}

	Process ExpressionFluxProcess( ATPase_pump_mediated_Ca_efflux_Cell1 )
	{
		Name "ATPase pump mediated Ca efflux Cell1";

		VariableReferenceList
			[ compartment       :.:SIZE               0 ]
			[ Calcium_ion_Cell1 :.:Calcium_ion_Cell1 -1 ];

		Vp  1.2;
		Kp  0.18;

		Expression "compartment.Value * Vp * pow(( Calcium_ion_Cell1.MolarConc ), 2 ) / (( Kp * Kp ) + pow(( Calcium_ion_Cell1.MolarConc ), 2 )) * self.getSuperSystem().SizeN_A";
	}

	Process ExpressionFluxProcess( IP3R_independent_Ca_release_Cell1 )
	{
		Name "IP3R independent Ca release Cell1";

		VariableReferenceList
			[ compartment       :.:SIZE               0 ]
			[ Calcium_ion_Cell1 :.:Calcium_ion_Cell1  1 ];

		Jleak  0.2;

		Expression "compartment.Value * Jleak * self.getSuperSystem().SizeN_A";
	}

	Process ExpressionFluxProcess( Inactivated_to_Shut_state_transition_Cell1 )
	{
		Name "Inactivated to Shut state transition Cell1";

		VariableReferenceList
			[ compartment             :.:SIZE                    0 ]
			[ Receptor_fraction_Cell1 :.:Receptor_fraction_Cell1 1 ]
			[ Phi3_c1                 :/:Phi3_c1                 0 ];

		Expression "compartment.Value * Phi3_c1.Value * ( 1.0 - Receptor_fraction_Cell1.MolarConc ) * self.getSuperSystem().SizeN_A";
	}

	Process ExpressionFluxProcess( Open_to_Inactivated_state_transition_Cell1 )
	{
		Name "Open to Inactivated state transition Cell1";

		VariableReferenceList
			[ compartment             :.:SIZE                     0 ]
			[ Receptor_fraction_Cell1 :.:Receptor_fraction_Cell1 -1 ]
			[ Phi1_c1                 :/:Phi1_c1                  0 ]
			[ Phi2_c1                 :/:Phi2_c1                  0 ]
			[ Phi_minus1_c1           :/:Phi_minus1_c1            0 ];

		p  0.2778;

		Expression "compartment.Value * Phi1_c1.Value * Phi2_c1.Value * Receptor_fraction_Cell1.MolarConc * p / ( Phi1_c1.Value * p + Phi_minus1_c1.Value ) * self.getSuperSystem().SizeN_A";
	}

	Process ExpressionFluxProcess( IP3R_mediated_Ca_release_Cell2 )
	{
		Name "IP3R mediated Ca release Cell2";

		VariableReferenceList
			[ compartment             :.:SIZE                    0 ]
			[ Receptor_fraction_Cell2 :.:Receptor_fraction_Cell2 0 ]
			[ Phi1_c2                 :/:Phi1_c2                 0 ]
			[ Phi_minus1_c2           :/:Phi_minus1_c2           0 ]
			[ Calcium_ion_Cell2       :.:Calcium_ion_Cell2       1 ];

		kf  28.0;
		p   0.2778;

		Expression "compartment.Value * kf * pow( p * Receptor_fraction_Cell2.MolarConc * Phi1_c2.Value / ( Phi1_c2.Value * p + Phi_minus1_c2.Value ), 4 ) * self.getSuperSystem().SizeN_A";
	}

	Process ExpressionFluxProcess( ATPase_pump_mediated_Ca_efflux_Cell2 )
	{
		Name "ATPase pump mediated Ca efflux Cell2";

		VariableReferenceList
			[ compartment       :.:SIZE               0 ]
			[ Calcium_ion_Cell2 :.:Calcium_ion_Cell2 -1 ];

		Vp  1.2;
		Kp  0.18;

		Expression "compartment.Value * Vp * pow( Calcium_ion_Cell2.MolarConc, 2 ) / (( Kp * Kp ) + pow( Calcium_ion_Cell2.MolarConc, 2 )) * self.getSuperSystem().SizeN_A";
	}

	Process ExpressionFluxProcess( IP3R_independent_Ca_release_Cell2 )
	{
		Name "IP3R independent Ca release Cell2";

		VariableReferenceList
			[ compartment       :.:SIZE               0 ]
			[ Calcium_ion_Cell2 :.:Calcium_ion_Cell2  1 ];

		Jleak  0.2;

		Expression "compartment.Value * Jleak * self.getSuperSystem().SizeN_A";
	}

	Process ExpressionFluxProcess( Inactivated_to_Shut_state_transition_Cell2 )
	{
		Name "Inactivated to Shut state transition Cell2";

		VariableReferenceList
			[ compartment             :.:SIZE                    0 ]
			[ Receptor_fraction_Cell2 :.:Receptor_fraction_Cell2 1 ]
			[ Phi3_c2                 :/:Phi3_c2                 0 ];

		Expression "compartment.Value * Phi3_c2.Value * ( 1.0 - Receptor_fraction_Cell2.MolarConc ) * self.getSuperSystem().SizeN_A";
	}

	Process ExpressionFluxProcess( Open_to_Inactivated_state_transition_Cell2 )
	{
		Name "Open to Inactivated state transition Cell2";

		VariableReferenceList
			[ compartment             :.:SIZE                     0 ]
			[ Receptor_fraction_Cell2 :.:Receptor_fraction_Cell2 -1 ]
			[ Phi1_c2                 :/:Phi1_c2                  0 ]
			[ Phi2_c2                 :/:Phi2_c2                  0 ]
			[ Phi_minus1_c2           :/:Phi_minus1_c2            0 ];

		p  0.2778;

		Expression "compartment.Value * Phi1_c2.Value * Phi2_c2.Value * Receptor_fraction_Cell2.MolarConc * p / ( Phi1_c2.Value * p + Phi_minus1_c2.Value ) * self.getSuperSystem().SizeN_A";
	}

	Process ExpressionFluxProcess( Diffusion_of_Ca_between_cells )
	{
		Name "Diffusion of Ca between cells";

		VariableReferenceList
			[ compartment       :.:SIZE               0 ]
			[ Calcium_ion_Cell1 :.:Calcium_ion_Cell1  1 ]
			[ Calcium_ion_Cell2 :.:Calcium_ion_Cell2 -1 ];

		D  0.01;

		Expression "compartment.Value * D * ( Calcium_ion_Cell2.MolarConc - Calcium_ion_Cell1.MolarConc ) * self.getSuperSystem().SizeN_A";
	}
}


# Ported by Yasuhiro Naito 12/06/2013

