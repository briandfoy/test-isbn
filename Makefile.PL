# $Id$
use ExtUtils::MakeMaker;

eval "use Test::Manifest 1.14";

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

