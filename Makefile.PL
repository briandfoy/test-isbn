# $Id$
use ExtUtils::MakeMaker;

require 5.006;

eval "use Test::Manifest 1.14";

WriteMakefile
	(
	'NAME'          => 'Test::ISBN',
	'ABSTRACT'      => 'Check International Standard Book Numbers',
	'LICENSE'		=> 'perl',
	'AUTHOR'		=> 'brian d foy <bdfoy@cpan.org>',

	'VERSION_FROM'   => 'lib/Test/ISBN.pm',
	'PREREQ_PM'      => {
		'Test::More'            => '0',
		'Test::Builder::Tester' => '0',
		'Business::ISBN'        => '2.0',
		},
		},

	clean            => { FILES => 'Test-ISBN-*' },
	);

