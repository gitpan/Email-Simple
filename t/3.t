use Test::More no_plan;
use Email::Simple;

my $m = Email::Simple->new("Foo-Bar: Baz\n\ntest\n");                           
$m->header_set("Foo-bar", "quux");                                              
is($m->as_string, "Foo-Bar: quux

test\n", "Only one header this time");


