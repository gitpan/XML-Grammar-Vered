
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "a vered by any other name will translate as sweet.",
  "AUTHOR" => "Shlomi Fish <shlomif\@cpan.org>",
  "BUILD_REQUIRES" => {
    "File::Find" => 0,
    "File::Spec" => 0,
    "File::Temp" => 0,
    "Module::Build" => "0.3601",
    "Test::More" => 0,
    "Test::XML::Ordered" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30",
    "Module::Build" => "0.3601"
  },
  "DISTNAME" => "XML-Grammar-Vered",
  "EXE_FILES" => [],
  "LICENSE" => "mit",
  "NAME" => "XML::Grammar::Vered",
  "PREREQ_PM" => {
    "MooX" => 0,
    "XML::GrammarBase::Role::RelaxNG" => "v0.1.5",
    "XML::GrammarBase::Role::XSLT" => "v0.1.5",
    "autodie" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "VERSION" => "0.0.1",
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



