# $Id$
use ExtUtils::MakeMaker;

eval "use Test::Manifest";

unless( $@ )
	{
	sub ExtUtils::MM_Any::test_via_harness
		{
		my($self, $perl, $tests) = @_;

		return qq|\t$perl "-MTest::Manifest" | .
			qq|"-e" "run_t_manifest(\$(TEST_VERBOSE), '\$(INST_LIB)', | .
			qq|'\$(INST_ARCHLIB)')"\n|;
		}
	}

WriteMakefile
	(
	'NAME'           => 'Test::ISBN',
	'ABSTRACT'       => 'Check International Standard Book Numbers',
	'VERSION_FROM'   => 'lib/ISBN.pm',
	'PREREQ_PM'      => {
		'Test::More'            => '0',
		'Test::Builder::Tester' => '0',
		'Business::ISBN'        => '0',
		},
	'PM'             => {
		'lib/ISBN.pm'     => '$(INST_LIBDIR)/ISBN.pm',
		},

	clean            => { FILES => 'Test-ISBN-*' },
	);

