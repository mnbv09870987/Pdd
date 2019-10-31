package Pdd::Controller::Actions;
use Mojo::Base 'Mojolicious::Controller';

sub start {
  my $self = shift;

  $self -> render ('start');
}

1;
