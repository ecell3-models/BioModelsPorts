
# created by eml2em program
# from file: BIOMD0000000402.eml, date: Sun Mar  2 21:11:20 2014
#

Stepper FixedODE1Stepper( Default )
{
	# no property
}

System System( / )
{
	StepperID	Default;
	Name	default;
}

System System( /Compartment )
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
	
	Variable Variable( C )
	{
		Name	Osteoclasts;
		NumberConc	15.0;
		Fixed	0;
	}
	
	Variable Variable( B )
	{
		Name	Osteoblasts;
		NumberConc	316.0;
		Fixed	0;
	}
	
	Variable Variable( z )
	{
		Name	BoneMass;
		NumberConc	100.0;
		Fixed	0;
	}
	
	Variable Variable( Tumour )
	{
		Name	Tumour;
		NumberConc	1.0;
		Fixed	0;
	}
	
	
}

System System( /SBMLParameter )
{
	StepperID	Default;
	Name	"Global Parameter";

	Variable Variable( y1 )
	{
		Name	y1;
		Value	10.0061900384;
	}
	
	Variable Variable( y2 )
	{
		Name	y2;
		Value	0.0985113275813;
	}
	
	Variable Variable( C_bar )
	{
		Name	C_bar;
		Value	4.99380996157;
	}
	
	Variable Variable( B_bar )
	{
		Name	B_bar;
		Value	315.901488672;
	}
	
	Variable Variable( alpha1 )
	{
		Name	alpha1;
		Value	3.0;
		Fixed	1;
	}
	
	Variable Variable( beta1 )
	{
		Name	beta1;
		Value	0.2;
		Fixed	1;
	}
	
	Variable Variable( alpha2 )
	{
		Name	alpha2;
		Value	4.0;
		Fixed	1;
	}
	
	Variable Variable( beta2 )
	{
		Name	beta2;
		Value	0.02;
		Fixed	1;
	}
	
	Variable Variable( k1 )
	{
		Name	k1;
		Value	0.0748;
		Fixed	1;
	}
	
	Variable Variable( k2 )
	{
		Name	k2;
		Value	0.0006395;
		Fixed	1;
	}
	
	Variable Variable( g11 )
	{
		Name	g11;
		Value	1.1;
		Fixed	1;
	}
	
	Variable Variable( g21 )
	{
		Name	g21;
		Value	-0.5;
		Fixed	1;
	}
	
	Variable Variable( g12 )
	{
		Name	g12;
		Value	1.0;
		Fixed	1;
	}
	
	Variable Variable( g22 )
	{
		Name	g22;
		Value	0.0;
		Fixed	1;
	}
	
	Variable Variable( gamma )
	{
		Name	gamma;
		Value	-0.3734;
	}
	
	Variable Variable( gammaT )
	{
		Name	gammaT;
		Value	0.005;
		Fixed	1;
	}
	
	Variable Variable( LT )
	{
		Name	LT;
		Value	100.0;
		Fixed	1;
	}
	
	Variable Variable( r11 )
	{
		Name	r11;
		Value	0.005;
		Fixed	1;
	}
	
	Variable Variable( r21 )
	{
		Name	r21;
		Value	0.0;
		Fixed	1;
	}
	
	Variable Variable( r12 )
	{
		Name	r12;
		Value	0.0;
		Fixed	1;
	}
	
	Variable Variable( r22 )
	{
		Name	r22;
		Value	0.2;
		Fixed	1;
	}
	
	
}

System System( /SBMLRule )
{
	Name	"System for SBML Rule";
	StepperID	Default;

	Process ExpressionFluxProcess( Rate_C )
	{
		Name	"Rate rule for 'C'";
		Expression	"alpha1.NumberConc * pow(C.NumberConc, g11.NumberConc * (1 + r11.NumberConc * Tumour.NumberConc / LT.NumberConc)) * pow(B.NumberConc, g21.NumberConc * (1 + r21.NumberConc * Tumour.NumberConc / LT.NumberConc)) - beta1.NumberConc * C.NumberConc";
		VariableReferenceList
			[ C      Variable:/Compartment:C        1 ]
			[ alpha1 Variable:/SBMLParameter:alpha1 0 ]
			[ g11    Variable:/SBMLParameter:g11    0 ]
			[ r11    Variable:/SBMLParameter:r11    0 ]
			[ Tumour Variable:/Compartment:Tumour   0 ]
			[ LT     Variable:/SBMLParameter:LT     0 ]
			[ B      Variable:/Compartment:B        0 ]
			[ g21    Variable:/SBMLParameter:g21    0 ]
			[ r21    Variable:/SBMLParameter:r21    0 ]
			[ beta1  Variable:/SBMLParameter:beta1  0 ];
	}
	
	Process ExpressionFluxProcess( Rate_B )
	{
		Name	"Rate rule for 'B'";
		Expression	"alpha2.NumberConc * pow(C.NumberConc, g12.NumberConc / (1 + r12.NumberConc * Tumour.NumberConc / LT.NumberConc)) * pow(B.NumberConc, g22.NumberConc - r22.NumberConc * Tumour.NumberConc / LT.NumberConc) - beta2.NumberConc * B.NumberConc";
		VariableReferenceList
			[ B      Variable:/Compartment:B        1 ]
			[ alpha2 Variable:/SBMLParameter:alpha2 0 ]
			[ C      Variable:/Compartment:C        0 ]
			[ g12    Variable:/SBMLParameter:g12    0 ]
			[ r12    Variable:/SBMLParameter:r12    0 ]
			[ Tumour Variable:/Compartment:Tumour   0 ]
			[ LT     Variable:/SBMLParameter:LT     0 ]
			[ g22    Variable:/SBMLParameter:g22    0 ]
			[ r22    Variable:/SBMLParameter:r22    0 ]
			[ beta2  Variable:/SBMLParameter:beta2  0 ];
	}
	
	Process ExpressionFluxProcess( Rate_z )
	{
		Name	"Rate rule for 'z'";
		Expression	"k2.NumberConc * y2.NumberConc - k1.NumberConc * y1.NumberConc";
		VariableReferenceList
			[ z  Variable:/Compartment:z    1 ]
			[ k2 Variable:/SBMLParameter:k2 0 ]
			[ y2 Variable:/SBMLParameter:y2 0 ]
			[ k1 Variable:/SBMLParameter:k1 0 ]
			[ y1 Variable:/SBMLParameter:y1 0 ];
	}
	
	Process ExpressionAssignmentProcess( Assignment_y1 )
	{
		StepperID	Default;
		Name	"Assignment rule for 'y1'";
		Expression	"piecewise(C.NumberConc - C_bar.NumberConc, gt(C.NumberConc, C_bar.NumberConc), 0)";
		VariableReferenceList
			[ y1    Variable:/SBMLParameter:y1    1 ]
			[ C     Variable:/Compartment:C       0 ]
			[ C_bar Variable:/SBMLParameter:C_bar 0 ];
	}
	
	Process ExpressionAssignmentProcess( Assignment_y2 )
	{
		StepperID	Default;
		Name	"Assignment rule for 'y2'";
		Expression	"piecewise(B.NumberConc - B_bar.NumberConc, gt(B.NumberConc, B_bar.NumberConc), 0)";
		VariableReferenceList
			[ y2    Variable:/SBMLParameter:y2    1 ]
			[ B     Variable:/Compartment:B       0 ]
			[ B_bar Variable:/SBMLParameter:B_bar 0 ];
	}
	
	Process ExpressionAssignmentProcess( Assignment_C_bar )
	{
		StepperID	Default;
		Name	"Assignment rule for 'C_bar'";
		Expression	"pow(beta1.NumberConc / alpha1.NumberConc, (1 - g22.NumberConc + r22.NumberConc) / gamma.NumberConc) * pow(beta2.NumberConc / alpha2.NumberConc, g21.NumberConc * (1 + r21.NumberConc) / gamma.NumberConc)";
		VariableReferenceList
			[ C_bar  Variable:/SBMLParameter:C_bar  1 ]
			[ beta1  Variable:/SBMLParameter:beta1  0 ]
			[ alpha1 Variable:/SBMLParameter:alpha1 0 ]
			[ g22    Variable:/SBMLParameter:g22    0 ]
			[ r22    Variable:/SBMLParameter:r22    0 ]
			[ gamma  Variable:/SBMLParameter:gamma  0 ]
			[ beta2  Variable:/SBMLParameter:beta2  0 ]
			[ alpha2 Variable:/SBMLParameter:alpha2 0 ]
			[ g21    Variable:/SBMLParameter:g21    0 ]
			[ r21    Variable:/SBMLParameter:r21    0 ];
	}
	
	Process ExpressionAssignmentProcess( Assignment_B_bar )
	{
		StepperID	Default;
		Name	"Assignment rule for 'B_bar'";
		Expression	"pow(beta1.NumberConc / alpha1.NumberConc, g12.NumberConc / (1 + r12.NumberConc) / gamma.NumberConc) * pow(beta2.NumberConc / alpha2.NumberConc, (1 - g11.NumberConc * (1 + r11.NumberConc)) / gamma.NumberConc)";
		VariableReferenceList
			[ B_bar  Variable:/SBMLParameter:B_bar  1 ]
			[ beta1  Variable:/SBMLParameter:beta1  0 ]
			[ alpha1 Variable:/SBMLParameter:alpha1 0 ]
			[ g12    Variable:/SBMLParameter:g12    0 ]
			[ r12    Variable:/SBMLParameter:r12    0 ]
			[ gamma  Variable:/SBMLParameter:gamma  0 ]
			[ beta2  Variable:/SBMLParameter:beta2  0 ]
			[ alpha2 Variable:/SBMLParameter:alpha2 0 ]
			[ g11    Variable:/SBMLParameter:g11    0 ]
			[ r11    Variable:/SBMLParameter:r11    0 ];
	}
	
	Process ExpressionAssignmentProcess( Assignment_gamma )
	{
		StepperID	Default;
		Name	"Assignment rule for 'gamma'";
		Expression	"g12.NumberConc / (1 + r12.NumberConc) * g21.NumberConc * (1 + r21.NumberConc) - (1 - g11.NumberConc * (1 + r11.NumberConc)) * (1 - g22.NumberConc + r22.NumberConc)";
		VariableReferenceList
			[ gamma Variable:/SBMLParameter:gamma 1 ]
			[ g12   Variable:/SBMLParameter:g12   0 ]
			[ r12   Variable:/SBMLParameter:r12   0 ]
			[ g21   Variable:/SBMLParameter:g21   0 ]
			[ r21   Variable:/SBMLParameter:r21   0 ]
			[ g11   Variable:/SBMLParameter:g11   0 ]
			[ r11   Variable:/SBMLParameter:r11   0 ]
			[ g22   Variable:/SBMLParameter:g22   0 ]
			[ r22   Variable:/SBMLParameter:r22   0 ];
	}
	
	Process ExpressionFluxProcess( Rate_Tumour )
	{
		Name	"Rate rule for 'Tumour'";
		Expression	"gammaT.NumberConc * Tumour.NumberConc * log(LT.NumberConc / Tumour.NumberConc)";
		VariableReferenceList
			[ Tumour Variable:/Compartment:Tumour   1 ]
			[ gammaT Variable:/SBMLParameter:gammaT 0 ]
			[ LT     Variable:/SBMLParameter:LT     0 ];
	}
	
	
}

