# $Id$
use ExtUtils::MakeMaker;

my $tests = do {
	local @ARGV = qw(t/test_manifest);
	my $data = join " ", map {chomp; "t/$_" } <>;
	};
	

WriteMakefile
        (
        'NAME'      => 'Test::ISBN',
        'ABSTRACT'  => 'Check International Standard Book Numbers',
        'VERSION'   => '0.5_04',
 		'PREREQ_PM' => {
 			Test::Pod             => 0.71,
 			Test::More            => 0,
 			Test::Builder::Tester => 0,
 			File::Find::Rule      => 0,
 			},
        'PM'        => 
        	{
            'lib/ISBN.pm'     => '$(INST_LIBDIR)/ISBN.pm',
          },
 
 		depend => { Makefile => 't/test_manifest' },
        test   => { TESTS => $tests },
        );

