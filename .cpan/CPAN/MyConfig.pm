use strict;
use warnings;

use File::HomeDir;

my $HOME = File::HomeDir->my_home;
my $CPAN_HOME = "$HOME/.cpan_home";

my $URL_LIST = [q[file:///var/local/cpanmini]];
#  'urllist' => [q[ftp://ftp.mirrorservice.org/sites/ftp.funet.fi/pub/languages/perl/CPAN/], q[ftp://ftp.plig.net/pub/CPAN/], q[ftp://mirror.ox.ac.uk/sites/www.cpan.org/], q[ftp://ftp.demon.co.uk/pub/CPAN/]],

print "Hello!\n\n\n";

umask 022;

$CPAN::Config = {
  'applypatch' => q[],
  'auto_commit' => q[0],
  'build_cache' => q[100],
  'build_dir' => "$CPAN_HOME/build",
  'build_dir_reuse' => q[0],
  'build_requires_install_policy' => q[ask/yes],
  'bzip2' => q[/bin/bzip2],
  'cache_metadata' => q[1],
  'check_sigs' => q[1],
  'colorize_output' => q[1],
  'commandnumber_in_prompt' => q[1],
  'connect_to_internet_ok' => q[1],
  'cpan_home' => "$CPAN_HOME/.cpan",
  'curl' => q[/bin/curl],
  'ftp' => q[/usr/bin/ftp],
  'ftp_passive' => q[1],
  'ftp_proxy' => q[],
  'getcwd' => q[cwd],
  'gpg' => q[/usr/bin/gpg],
  'gzip' => q[/bin/gzip],
  'halt_on_failure' => q[0],
  'histfile' => qq[$CPAN_HOME/histfile],
  'histsize' => q[100],
  'http_proxy' => q[],
  'inactivity_timeout' => q[0],
  'index_expire' => q[1],
  'inhibit_startup_message' => q[0],
  'keep_source_where' => qq[$CPAN_HOME/sources],
  'load_module_verbosity' => q[v],
  'lynx' => q[],
  'make' => q[/usr/bin/make],
  'make_arg' => q[],
  'make_install_arg' => q[],
  'make_install_make_command' => q[/usr/bin/sudo /usr/bin/make],
  'makepl_arg' => q[INSTALLDIRS=site],
  'mbuild_arg' => q[],
  'mbuild_install_arg' => q[],
  'mbuild_install_build_command' => q[/usr/bin/sudo ./Build],
  'mbuildpl_arg' => q[installdirs=site],
  'ncftp' => q[],
  'ncftpget' => q[],
  'no_proxy' => q[],
  'pager' => q[/bin/less],
  'patch' => q[/usr/bin/patch],
  'perl5lib_verbosity' => q[v],
  'prefer_installer' => q[MB],
  'prefs_dir' => qq[$CPAN_HOME/prefs],
  'prerequisites_policy' => q[follow],
  'scan_cache' => q[atstart],
  'shell' => q[/bin/bash],
  'show_unparsable_versions' => q[0],
  'show_upload_date' => q[0],
  'show_zero_versions' => q[0],
  'tar' => q[/bin/tar],
  'tar_verbosity' => q[v],
  'term_is_latin' => q[1],
  'term_ornaments' => q[1],
  'test_report' => q[0],
  'trust_test_report_history' => q[0],
  'unzip' => q[/usr/bin/unzip],
  'urllist' => $URL_LIST,
  'use_sqlite' => q[0],
  'wget' => q[/usr/bin/wget],
  'yaml_load_code' => q[0],
  'yaml_module' => q[YAML],
};
1;
__END__
