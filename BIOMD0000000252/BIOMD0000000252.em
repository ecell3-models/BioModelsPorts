
# created by eml2em program
# from file: BIOMD0000000252.eml, date: Sun Mar  2 20:52:48 2014
#

Stepper ODEStepper( Default )
{
	# no property
}

System System( / )
{
	StepperID	Default;
	Name	default;
}

System System( /compartment_1 )
{
	StepperID	Default;
	Name	cell;

	Variable Variable( Dimensions )
	{
		Value	3;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Fixed	1;
	}
	
	Variable Variable( p )
	{
		Name	p;
		NumberConc	1.0;
		Fixed	0;
	}
	
	Variable Variable( mm )
	{
		Name	mm;
		NumberConc	1.0;
		Fixed	0;
	}
	
	Variable Variable( m )
	{
		Name	m;
		NumberConc	1.0;
		Fixed	0;
	}
	
	Variable Variable( pm )
	{
		Name	pm;
		NumberConc	1.0;
		Fixed	0;
	}
	
	
}

System System( /SBMLParameter )
{
	StepperID	Default;
	Name	"Global Parameter";

	Variable Variable( S )
	{
		Name	S;
		Value	1000.0;
		Fixed	1;
	}
	
	Variable Variable( alpha )
	{
		Name	alpha;
		Value	0.1;
		Fixed	1;
	}
	
	Variable Variable( k_t )
	{
		Name	k_t;
		Value	0.03;
		Fixed	1;
	}
	
	Variable Variable( k_tl )
	{
		Name	k_tl;
		Value	1.4;
		Fixed	1;
	}
	
	Variable Variable( k_b )
	{
		Name	k_b;
		Value	7200.0;
		Fixed	1;
	}
	
	Variable Variable( k_f )
	{
		Name	k_f;
		Value	5000.0;
		Fixed	1;
	}
	
	Variable Variable( beta )
	{
		Name	beta;
		Value	0.6;
		Fixed	1;
	}
	
	Variable Variable( gamma )
	{
		Name	gamma;
		Value	0.2;
		Fixed	1;
	}
	
	Variable Variable( delta )
	{
		Name	delta;
		Value	11.0;
		Fixed	1;
	}
	
	
}

System System( /SBMLRule )
{
	Name	"System for SBML Rule";
	StepperID	Default;

	Process ExpressionFluxProcess( Rate_p )
	{
		Name	"Rate rule for 'p'";
		Expression	"S.NumberConc - k_f.NumberConc * p.NumberConc * m.NumberConc - alpha.NumberConc * p.NumberConc + (k_b.NumberConc + gamma.NumberConc) * pm.NumberConc";
		VariableReferenceList
			[ p     Variable:/compartment_1:p     1 ]
			[ S     Variable:/SBMLParameter:S     0 ]
			[ k_f   Variable:/SBMLParameter:k_f   0 ]
			[ m     Variable:/compartment_1:m     0 ]
			[ alpha Variable:/SBMLParameter:alpha 0 ]
			[ k_b   Variable:/SBMLParameter:k_b   0 ]
			[ gamma Variable:/SBMLParameter:gamma 0 ]
			[ pm    Variable:/compartment_1:pm    0 ];
	}
	
	Process ExpressionFluxProcess( Rate_mm )
	{
		Name	"Rate rule for 'mm'";
		Expression	"k_t.NumberConc * pow(p.NumberConc, 2) - beta.NumberConc * mm.NumberConc";
		VariableReferenceList
			[ mm   Variable:/compartment_1:mm   1 ]
			[ k_t  Variable:/SBMLParameter:k_t  0 ]
			[ p    Variable:/compartment_1:p    0 ]
			[ beta Variable:/SBMLParameter:beta 0 ];
	}
	
	Process ExpressionFluxProcess( Rate_m )
	{
		Name	"Rate rule for 'm'";
		Expression	"k_tl.NumberConc * mm.NumberConc - k_f.NumberConc * p.NumberConc * m.NumberConc + (k_b.NumberConc + delta.NumberConc) * pm.NumberConc - gamma.NumberConc * m.NumberConc";
		VariableReferenceList
			[ m     Variable:/compartment_1:m     1 ]
			[ k_tl  Variable:/SBMLParameter:k_tl  0 ]
			[ mm    Variable:/compartment_1:mm    0 ]
			[ k_f   Variable:/SBMLParameter:k_f   0 ]
			[ p     Variable:/compartment_1:p     0 ]
			[ k_b   Variable:/SBMLParameter:k_b   0 ]
			[ delta Variable:/SBMLParameter:delta 0 ]
			[ pm    Variable:/compartment_1:pm    0 ]
			[ gamma Variable:/SBMLParameter:gamma 0 ];
	}
	
	Process ExpressionFluxProcess( Rate_pm )
	{
		Name	"Rate rule for 'pm'";
		Expression	"k_f.NumberConc * p.NumberConc * m.NumberConc - (k_b.NumberConc + delta.NumberConc) * pm.NumberConc - gamma.NumberConc * pm.NumberConc";
		VariableReferenceList
			[ pm    Variable:/compartment_1:pm    1 ]
			[ k_f   Variable:/SBMLParameter:k_f   0 ]
			[ p     Variable:/compartment_1:p     0 ]
			[ m     Variable:/compartment_1:m     0 ]
			[ k_b   Variable:/SBMLParameter:k_b   0 ]
			[ delta Variable:/SBMLParameter:delta 0 ]
			[ gamma Variable:/SBMLParameter:gamma 0 ];
	}
	
	
}

