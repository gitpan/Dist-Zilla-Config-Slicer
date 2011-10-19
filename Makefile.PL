
use strict;
use warnings;

use 5.006;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Config::MVP::Slicer customized for Dist::Zilla",
  "AUTHOR" => "Randy Stauner <rwstauner\@cpan.org>",
  "BUILD_REQUIRES" => {
    "Dist::Zilla::Role::PluginBundle" => 0,
    "Dist::Zilla::Role::PluginBundle::Easy" => 0,
    "File::Find" => 0,
    "File::Temp" => 0,
    "Test::More" => "0.96"
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Dist-Zilla-Config-Slicer",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Dist::Zilla::Config::Slicer",
  "PREREQ_PM" => {
    "Config::MVP::Slicer" => 0,
    "Dist::Zilla::Util" => 4,
    "Moose" => 0,
    "Moose::Role" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "VERSION" => "0.100",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



