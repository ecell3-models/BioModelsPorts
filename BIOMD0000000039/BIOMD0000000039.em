
# created by eml2em program
# from file: BIOMD0000000039.eml, date: Sat Mar  1 22:12:58 2014
#

Stepper ODEStepper( Default )
{
	# no property
}

System System( / )
{
	StepperID	Default;
	Name	default;

	Process ExpressionFluxProcess( v1 )
	{
		Name	"Jch, ( denominatior = 4 )";
		Kch	4100.0;
		K1	5.0;
		Expression	"1 / 4 * Cytosol.Value * (Kch * pow(Ca_cyt.NumberConc, 2) * (CaER.NumberConc - Ca_cyt.NumberConc) / (pow(K1, 2) + pow(Ca_cyt.NumberConc, 2)))";
		VariableReferenceList
			[ CaER    Variable:/Cytosol/Endoplasmic_Reticulum:CaER -1 ]
			[ Ca_cyt  Variable:/Cytosol:Ca_cyt                     4  ]
			[ Cytosol Variable:/Cytosol:SIZE                       0  ];
	}
	
	Process ExpressionFluxProcess( v3 )
	{
		Name	"Jleak, ( denominatior = 4 )";
		Kleak	0.05;
		Expression	"1 / 4 * Cytosol.Value * Kleak * (CaER.NumberConc - Ca_cyt.NumberConc)";
		VariableReferenceList
			[ CaER    Variable:/Cytosol/Endoplasmic_Reticulum:CaER -1 ]
			[ Ca_cyt  Variable:/Cytosol:Ca_cyt                     4  ]
			[ Cytosol Variable:/Cytosol:SIZE                       0  ];
	}
	
	Process ExpressionFluxProcess( v5 )
	{
		Name	"Jpump, ( denominatior = 4 )";
		Kpump	20.0;
		Expression	"1 / 4 * Endoplasmic_Reticulum.Value * Kpump * Ca_cyt.NumberConc";
		VariableReferenceList
			[ Ca_cyt                Variable:/Cytosol:Ca_cyt                     -4 ]
			[ CaER                  Variable:/Cytosol/Endoplasmic_Reticulum:CaER 1  ]
			[ Endoplasmic_Reticulum Variable:/Cytosol/Endoplasmic_Reticulum:SIZE 0  ];
	}
	
	Process ExpressionFluxProcess( v7 )
	{
		Name	"Jout, ( denominatior = 4 )";
		Kout	125.0;
		K3	5.0;
		Km	0.00625;
		Expression	"1 / 4 * Cytosol.Value * CaM.NumberConc * (Kout * pow(Ca_cyt.NumberConc, 2) / (pow(K3, 2) + pow(Ca_cyt.NumberConc, 2)) + Km)";
		VariableReferenceList
			[ CaM     Variable:/Cytosol/Mitochondria:CaM -1 ]
			[ Ca_cyt  Variable:/Cytosol:Ca_cyt           4  ]
			[ Cytosol Variable:/Cytosol:SIZE             0  ];
	}
	
	Process ExpressionFluxProcess( v9 )
	{
		Name	"Jin, ( denominatior = 4 )";
		Kin	300.0;
		K2	0.8;
		Expression	"1 / 4 * Mitochondria.Value * (Kin * pow(Ca_cyt.NumberConc, 8) / (pow(K2, 8) + pow(Ca_cyt.NumberConc, 8)))";
		VariableReferenceList
			[ Ca_cyt       Variable:/Cytosol:Ca_cyt            -4 ]
			[ CaM          Variable:/Cytosol/Mitochondria:CaM  1  ]
			[ Mitochondria Variable:/Cytosol/Mitochondria:SIZE 0  ];
	}
	
	Process ExpressionFluxProcess( v11 )
	{
		Name	"dissociation of CaPr";
		Kminus	0.01;
		Expression	"Cytosol.Value * Kminus * CaPr.NumberConc";
		VariableReferenceList
			[ CaPr    Variable:/Cytosol:CaPr   -1 ]
			[ Pr      Variable:/Cytosol:Pr     1  ]
			[ Ca_cyt  Variable:/Cytosol:Ca_cyt 1  ]
			[ Cytosol Variable:/Cytosol:SIZE   0  ];
	}
	
	Process ExpressionFluxProcess( v12 )
	{
		Name	"binding of Ca on Pr";
		Kplus	0.1;
		Expression	"Cytosol.Value * Kplus * Ca_cyt.NumberConc * Pr.NumberConc";
		VariableReferenceList
			[ Pr      Variable:/Cytosol:Pr     -1 ]
			[ Ca_cyt  Variable:/Cytosol:Ca_cyt -1 ]
			[ CaPr    Variable:/Cytosol:CaPr   1  ]
			[ Cytosol Variable:/Cytosol:SIZE   0  ];
	}
	
	
}

System System( /Cytosol )
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
	
	Variable Variable( Ca_cyt )
	{
		NumberConc	0.35;
		Fixed	0;
	}
	
	Variable Variable( CaPr )
	{
		NumberConc	85.45;
		Fixed	0;
	}
	
	Variable Variable( Pr )
	{
		NumberConc	34.55;
		Fixed	0;
	}
	
	
}

System System( /Cytosol/Endoplasmic_Reticulum )
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
	
	Variable Variable( CaER )
	{
		NumberConc	0.76;
		Fixed	0;
	}
	
	
}

System System( /Cytosol/Mitochondria )
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
	
	Variable Variable( CaM )
	{
		NumberConc	0.29;
		Fixed	0;
	}
	
	
}

