# $Id$

BEGIN
	{
	@good_isbns = qw(
	0004133250
	0064443094
	014037499X
	0295974842
	1881508501
	188150851X
	382660704X
	3826606604
	);
	
	@bad_isbns = qw(
	1565922572
	abcdefghij
	156592
	);
	}
use Test::Builder::Tester tests => @good_isbns + @bad_isbns;
use Test::ISBN;

foreach my $isbn ( @good_isbns )
	{
	test_out( 'ok 1' );
	isbn_ok( $isbn );
	test_test("isbn_ok");
	}

foreach my $isbn ( @bad_isbns )
	{
	test_out( 'not ok 1' );
	isbn_ok( $isbn );
	test_diag( "    Failed test ($0 at line " . line_num(-1) . ")",
		"The string [$isbn] is not a valid ISBN" );
	test_test("isbn_ok");
	}

