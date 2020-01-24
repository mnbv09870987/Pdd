package Pdd;
use Mojo::Base 'Mojolicious';

use Pdd::Helper;

# This method will run once at server start
sub startup {
  my $self = shift;

  unshift @{ $self->commands->namespaces }, 'Pdd::Command';

  # Load configuration from hash returned by config file
  my $config = $self->plugin('Config', {file => 'etc/pdd.conf'});

  # Configure the application
  $self->secrets($config->{secrets});

  Pdd::Helper::add_helpers( $self );

  # Router
  my $r = $self->routes;

  # Normal route to controller
  $r->get('/')->to('actions#registration') -> name( 'registration' );
  $r->post('/registration')->to('actions#registration_post');

  $r->get( '/show_question' )->to( 'actions#show_question' )->name( 'show_question' );


  warn "APPLICATION STARTED\n";
}

1;
