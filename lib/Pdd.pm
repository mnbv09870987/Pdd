package Pdd;
use Mojo::Base 'Mojolicious';

# This method will run once at server start
sub startup {
  my $self = shift;

  unshift @{ $self->commands->namespaces }, 'Pdd::Command';

  # Load configuration from hash returned by "my_app.conf"
  my $config = $self->plugin('Config', {file => 'etc/pdd.conf'});

  # Configure the application
  $self->secrets($config->{secrets});

  # Router
  my $r = $self->routes;

  # Normal route to controller
  $r->get('/')->to('actions#start');
}

1;
