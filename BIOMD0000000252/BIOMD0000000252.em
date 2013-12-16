
# created by eml2em program
# from file: ../BIOMD0000000252/BIOMD0000000252.eml, date: Mon Dec 16 23:02:10 2013
#

Stepper ODEStepper( DE )
{
	# no property
}

System System( / )
{
	StepperID	DE;
	Name	Default;
}

System System( /compartment_1 )
{
	StepperID	DE;
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
		Value	1.0;
		Fixed	0;
	}
	
	Variable Variable( mm )
	{
		Name	mm;
		Value	1.0;
		Fixed	0;
	}
	
	Variable Variable( m )
	{
		Name	m;
		Value	1.0;
		Fixed	0;
	}
	
	Variable Variable( pm )
	{
		Name	pm;
		Value	1.0;
		Fixed	0;
	}
	
	
}

System System( /SBMLParameter )
{
	StepperID	DE;
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
	StepperID	DE;

	Process ExpressionFluxProcess( Rule1 )
	{
		Expression	"P0.Value - P1.Value * (V0.Value / compartment_1.Value) * (V1.Value / compartment_1.Value) - P2.Value * (V0.Value / compartment_1.Value) + (P3.Value + P4.Value) * (V2.Value / compartment_1.Value)";
		VariableReferenceList	[ V0 Variable:/compartment_1:p 0 ] [ compartment_1 Variable:/compartment_1:SIZE 0 ] [ P0 Variable:/SBMLParameter:S 0 ] [ P1 Variable:/SBMLParameter:k_f 0 ] [ V1 Variable:/compartment_1:m 0 ] [ P2 Variable:/SBMLParameter:alpha 0 ] [ P3 Variable:/SBMLParameter:k_b 0 ] [ P4 Variable:/SBMLParameter:gamma 0 ] [ V2 Variable:/compartment_1:pm 0 ];
	}
	
	Process ExpressionFluxProcess( Rule2 )
	{
		Expression	"P0.Value * pow(V1.Value / compartment_1.Value, 2) - P1.Value * (V0.Value / compartment_1.Value)";
		VariableReferenceList	[ V0 Variable:/compartment_1:mm 0 ] [ compartment_1 Variable:/compartment_1:SIZE 0 ] [ P0 Variable:/SBMLParameter:k_t 0 ] [ V1 Variable:/compartment_1:p 0 ] [ P1 Variable:/SBMLParameter:beta 0 ];
	}
	
	Process ExpressionFluxProcess( Rule3 )
	{
		Expression	"P0.Value * (V1.Value / compartment_1.Value) - P1.Value * (V2.Value / compartment_1.Value) * (V0.Value / compartment_1.Value) + (P2.Value + P3.Value) * (V3.Value / compartment_1.Value) - P4.Value * (V0.Value / compartment_1.Value)";
		VariableReferenceList	[ V0 Variable:/compartment_1:m 0 ] [ compartment_1 Variable:/compartment_1:SIZE 0 ] [ P0 Variable:/SBMLParameter:k_tl 0 ] [ V1 Variable:/compartment_1:mm 0 ] [ P1 Variable:/SBMLParameter:k_f 0 ] [ V2 Variable:/compartment_1:p 0 ] [ P2 Variable:/SBMLParameter:k_b 0 ] [ P3 Variable:/SBMLParameter:delta 0 ] [ V3 Variable:/compartment_1:pm 0 ] [ P4 Variable:/SBMLParameter:gamma 0 ];
	}
	
	Process ExpressionFluxProcess( Rule4 )
	{
		Expression	"P0.Value * (V1.Value / compartment_1.Value) * (V2.Value / compartment_1.Value) - (P1.Value + P2.Value) * (V0.Value / compartment_1.Value) - P3.Value * (V0.Value / compartment_1.Value)";
		VariableReferenceList	[ V0 Variable:/compartment_1:pm 0 ] [ compartment_1 Variable:/compartment_1:SIZE 0 ] [ P0 Variable:/SBMLParameter:k_f 0 ] [ V1 Variable:/compartment_1:p 0 ] [ V2 Variable:/compartment_1:m 0 ] [ P1 Variable:/SBMLParameter:k_b 0 ] [ P2 Variable:/SBMLParameter:delta 0 ] [ P3 Variable:/SBMLParameter:gamma 0 ];
	}
	
	
}

