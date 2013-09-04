use strict;
use warnings;
package Email::Simple::Creator;
{
  $Email::Simple::Creator::VERSION = '2.202';
}
# ABSTRACT: private helper for building Email::Simple objects

sub _crlf {
  "\x0d\x0a";
}

sub _date_header {
  require Email::Date::Format;
  Email::Date::Format::email_date();
}

sub _add_to_header {
  my ($class, $header, $key, $value) = @_;
  $value = '' unless defined $value;
  $$header .= "$key: $value" . $class->_crlf;
}

sub _finalize_header {
  my ($class, $header) = @_;
  $$header .= $class->_crlf;
}

1;

__END__

=pod

=head1 NAME

Email::Simple::Creator - private helper for building Email::Simple objects

=head1 VERSION

version 2.202

=head1 AUTHORS

=over 4

=item *

Simon Cozens

=item *

Casey West

=item *

Ricardo SIGNES

=back

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2003 by Simon Cozens.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
