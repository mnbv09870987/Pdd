package MyApp::Command::db_env;
use Mojo::Base 'Mojolicious::Command';

use HyperMouse::Schema;


has description => 'Shell commands to setup environment for database';
has usage => sub { shift->extract_usage };

# create user App_cleaner with login createdb noinherit password 'password';


sub run {
	my( $self, @args ) =  @_;

	my $DB  =  $self->app->config->{ db };
	$DB->{ DSN } =  sprintf "dbi:%s:dbname=%s;host=%s;port=%s",  @$DB{ qw/ DRVR NAME HOST PORT / };
	print "DB_$_=$DB->{ $_ }\n"   for sort keys %$DB;

	(my $dsn =  $DB->{DSN}) =~ s/^.*dbname/dbname/;
	my $conf =  'etc/hypermouse/PRIMARY.conf';
	open my $FH, ">" .$self->app->home ."/$conf"
		or die "Can not update configuration file $conf";
	print $FH <<"	CONTENT" =~ s/\t//grm;
	<database>
	    type                        $DB->{DRVR}
	    database                    $dsn
	    username                    $DB->{USER}
	    password                    $DB->{PASS}
	    password_encryption_key     My Amazingly Cool Encryption Key
	</database>
	CONTENT

	1;
}

1;


=head1 SYNOPSIS

  Usage: APPLICATION db_env [OPTIONS]

  Options:
    NONE

=cut
