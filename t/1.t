#!/usr/bin/perl

use Test::More tests => 9;

sub read_file { local $/; open my $x, shift or die $!; return <$x> }
use_ok("Email::Simple");
# Very basic functionality test
my $mail_text = read_file("t/test-mails/josey-nofold");
my $mail = Email::Simple->new($mail_text);
isa_ok($mail, "Email::Simple");

like($mail->{head}->{From}->[0], qr/Andrew/, "Andrew's in the header");

is($old_from = $mail->header("From"), 
   'Andrew Josey <ajosey@rdg.opengroup.org>',  
    "We can get a header");
my $sc = 'Simon Cozens <simon@cpan.org>';
is($mail->header_set("From", $sc), $sc, "Setting returns new value");
is($mail->header("From"), $sc, "Which is consistently returned");

# Put andrew back:
$mail->header_set("From", $old_from);

like($body = $mail->body, qr/Austin Group Chair/, "Body has sane stuff in it");
my $old_body;

my $hi = "Hi there!\n";
$mail->body_set($hi);
is($mail->body, $hi, "Body can be set properly");

$mail->body_set($body);
is($mail->as_string, $mail_text, "Good grief, it's round-trippable");
