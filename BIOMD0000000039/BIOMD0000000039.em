
# created by eml2em program
# from file: ../BIOMD0000000039/BIOMD0000000039.eml, date: Mon Dec 16 22:45:29 2013
#

Stepper ODEStepper( DE )
{
	# no property
}

System System( / )
{
	StepperID	DE;
	Name	Default;

	Process ExpressionFluxProcess( v1 )
	{
		Name	Jch;
		Kch	4100.0;
		K1	5.0;
		Expression	"Cytosol.Value * (Kch * pow(C0.Value / Cytosol.Value, 2) * (S0.Value / Cytosol.Value - C0.Value / Cytosol.Value) / (pow(K1, 2) + pow(C0.Value / Cytosol.Value, 2)))";
		VariableReferenceList	[ S0 Variable:/Cytosol/Endoplasmic_Reticulum:CaER 0 ] [ P0 Variable:/Cytosol:Ca_cyt 1 ] [ C0 Variable:/Cytosol:Ca_cyt 0 ] [ Cytosol Variable:/Cytosol:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( v3 )
	{
		Name	Jleak;
		Kleak	0.05;
		Expression	"Cytosol.Value * Kleak * (S0.Value / Cytosol.Value - P0.Value / Cytosol.Value)";
		VariableReferenceList	[ S0 Variable:/Cytosol/Endoplasmic_Reticulum:CaER 0 ] [ P0 Variable:/Cytosol:Ca_cyt 1 ] [ Cytosol Variable:/Cytosol:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( v5 )
	{
		Name	Jpump;
		Kpump	20.0;
		Expression	"Endoplasmic_Reticulum.Value * Kpump * (S0.Value / Endoplasmic_Reticulum.Value)";
		VariableReferenceList	[ S0 Variable:/Cytosol:Ca_cyt -1 ] [ P0 Variable:/Cytosol/Endoplasmic_Reticulum:CaER 0 ] [ Endoplasmic_Reticulum Variable:/Cytosol/Endoplasmic_Reticulum:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( v7 )
	{
		Name	Jout;
		Kout	125.0;
		K3	5.0;
		Km	0.00625;
		Expression	"Cytosol.Value * (S0.Value / Cytosol.Value) * (Kout * pow(C0.Value / Cytosol.Value, 2) / (pow(K3, 2) + pow(C0.Value / Cytosol.Value, 2)) + Km)";
		VariableReferenceList	[ S0 Variable:/Cytosol/Mitochondria:CaM 0 ] [ P0 Variable:/Cytosol:Ca_cyt 1 ] [ C0 Variable:/Cytosol:Ca_cyt 0 ] [ Cytosol Variable:/Cytosol:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( v9 )
	{
		Name	Jin;
		Kin	300.0;
		K2	0.8;
		Expression	"Mitochondria.Value * (Kin * pow(C0.Value / Mitochondria.Value, 8) / (pow(K2, 8) + pow(C0.Value / Mitochondria.Value, 8)))";
		VariableReferenceList	[ S0 Variable:/Cytosol:Ca_cyt -1 ] [ P0 Variable:/Cytosol/Mitochondria:CaM 0 ] [ C0 Variable:/Cytosol:Ca_cyt 0 ] [ Mitochondria Variable:/Cytosol/Mitochondria:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( v11 )
	{
		Name	"dissociation of CaPr";
		Kminus	0.01;
		Expression	"Cytosol.Value * Kminus * (S0.Value / Cytosol.Value)";
		VariableReferenceList	[ S0 Variable:/Cytosol:CaPr -1 ] [ P0 Variable:/Cytosol:Pr 1 ] [ P1 Variable:/Cytosol:Ca_cyt 1 ] [ Cytosol Variable:/Cytosol:SIZE 0 ];
	}
	
	Process ExpressionFluxProcess( v12 )
	{
		Name	"binding of Ca on Pr";
		Kplus	0.1;
		Expression	"Cytosol.Value * Kplus * (S1.Value / Cytosol.Value) * (S0.Value / Cytosol.Value)";
		VariableReferenceList	[ S0 Variable:/Cytosol:Pr -1 ] [ S1 Variable:/Cytosol:Ca_cyt -1 ] [ P0 Variable:/Cytosol:CaPr 1 ] [ Cytosol Variable:/Cytosol:SIZE 0 ];
	}
	
	
}

System System( /Cytosol )
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
	
	Variable Variable( Ca_cyt )
	{
		Value	0.35;
		Fixed	0;
	}
	
	Variable Variable( CaPr )
	{
		Value	85.45;
		Fixed	0;
	}
	
	Variable Variable( Pr )
	{
		Value	34.55;
		Fixed	0;
	}
	
	
}

System System( /Cytosol/Endoplasmic_Reticulum )
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
	
	Variable Variable( CaER )
	{
		Value	0.76;
		Fixed	0;
	}
	
	
}

System System( /Cytosol/Mitochondria )
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
	
	Variable Variable( CaM )
	{
		Value	0.29;
		Fixed	0;
	}
	
	
}

