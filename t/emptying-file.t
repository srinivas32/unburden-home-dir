#!perl

use strict;
use warnings;

use lib qw(t/lib lib);
use Test::UBH;

my $t = Test::UBH->new;

$t->setup_test_environment(".foobar");
$t->write_configs('r f .foobar/fnord foobar-fnord');
ok( $t->write_file($t->HOME.'/.foobar/fnord', "Some contents\n"),
    'Create '.$t->HOME.'/.foobar/fnord with some contents');
file_not_empty_ok($t->HOME.'/.foobar/fnord');

$t->call_unburden_home_dir_default;

file_empty_ok($t->TP.'-foobar-fnord');

$t->done;
