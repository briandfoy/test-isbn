require 5.008;
use strict;
use warnings;

my $github    = 'https://github.com/briandfoy/Test-ISBN';
my $main_file = 'lib/Test/ISBN.pm';

my %WriteMakefile = (
	'NAME'           => 'Test::ISBN',
	'VERSION_FROM'   => $main_file,
	'ABSTRACT_FROM'  => $main_file,
	'LICENSE'        => 'perl',
	'AUTHOR'         => 'brian d foy <bdfoy@cpan.org>',

	'CONFIGURE_REQUIRES' => {
		'ExtUtils::MakeMaker' => '6.64',
		},

	'BUILD_REQUIRES' => {
		},

	'TEST_REQUIRES' => {
		'Test::More' => '0.94',
		'Test::Builder::Tester' => '0',
		},

	'PREREQ_PM'     => {
		'Business::ISBN'        => '2.0',
		},

	'META_MERGE' => {
		'meta-spec' => { version => 2 },
		resources => {
			repository => {
				type => 'git',
				url  => "$github.git",
				web  => $github,
				},
			bugtraker => {
				web    => "$github/issues",
				},
			homepage => $github,
			},
		},

	clean            => { FILES => 'Test-ISBN-*' },
	);


sub arguments { \%WriteMakefile }

do_it() unless caller;
sub do_it {
	require File::Spec;
	my $MM ='ExtUtils::MakeMaker';
	my $MM_version =
		eval{ "$MM " . $WriteMakefile{'CONFIGURE_REQUIRES'}{'ExtUtils::MakeMaker'} }
			//
		"$MM 6.64";
	eval "use $MM_version" || die "Could not load $MM_version: $@";
	eval "use Test::Manifest 1.21" 
		if -e File::Spec->catfile( qw(t test_manifest) );
	WriteMakefile( %WriteMakefile );
	}


no warnings;
__PACKAGE__;
