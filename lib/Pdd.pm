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

    $r->get( '/next_question' )->to( 'actions#next_question' )->name( 'next_question' );
    $r->post('/saving_answers')->to('actions#saving_answers')->name( 'saving_answers' );

    warn "APPLICATION STARTED\n";
}

1;
