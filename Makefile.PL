# $Id$
use ExtUtils::MakeMaker;

use Test::Manifest qw(get_t_files);

WriteMakefile
        (
        'NAME'      => 'Test::ISBN',
        'ABSTRACT'  => 'Check International Standard Book Numbers',
        'VERSION'   => '0.5_01',
 		'PREREQ_PM' => {
 			'Test::Pod'             => 0,
 			'Test::Manifest'        => 0,
 			'Test::Builder'         => 0,
 			'Test::More'            => 0,
 			'Test::Builder::Tester' => 0,
 			},
        'PM'        => 
        	{
            'lib/ISBN.pm'     => '$(INST_LIBDIR)/ISBN.pm',
          },
 
 		depend => { Makefile => 't/test_manifest' },
        test   => { TESTS => scalar get_t_files() },
        );

