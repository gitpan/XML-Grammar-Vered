
use strict;
use warnings;

use Module::Build 0.3601;
use lib qw{inc}; use XML::Grammar::Builder;

my %module_build_args = (
  "build_requires" => {
    "Module::Build" => "0.3601"
  },
  "configure_requires" => {
    "Module::Build" => "0.3601"
  },
  "dist_abstract" => "a vered by any other name will translate as sweet.",
  "dist_author" => [
    "Shlomi Fish <shlomif\@cpan.org>"
  ],
  "dist_name" => "XML-Grammar-Vered",
  "dist_version" => "0.0.5",
  "license" => "mit",
  "module_name" => "XML::Grammar::Vered",
  "recommends" => {},
  "recursive_test_files" => 1,
  "requires" => {
    "MooX" => 0,
    "XML::GrammarBase::Role::RelaxNG" => "v0.2.2",
    "XML::GrammarBase::Role::XSLT" => "v0.2.2",
    "autodie" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "script_files" => [],
  "test_requires" => {
    "File::Find" => 0,
    "File::Spec" => 0,
    "File::Temp" => 0,
    "Test::More" => 0,
    "Test::XML::Ordered" => 0,
    "XML::LibXML" => 0,
    "XML::LibXSLT" => 0,
    "vars" => 0
  }
);


unless ( eval { Module::Build->VERSION(0.4004) } ) {
  my $tr = delete $module_build_args{test_requires};
  my $br = $module_build_args{build_requires};
  for my $mod ( keys %$tr ) {
    if ( exists $br->{$mod} ) {
      $br->{$mod} = $tr->{$mod} if $tr->{$mod} > $br->{$mod};
    }
    else {
      $br->{$mod} = $tr->{$mod};
    }
  }
}

my $build = XML::Grammar::Builder->new(%module_build_args);

$build->create_build_script;
