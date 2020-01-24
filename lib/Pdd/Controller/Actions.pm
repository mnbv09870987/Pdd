package Pdd::Controller::Actions;
use Mojo::Base 'Mojolicious::Controller';

use strict;
use warnings;


sub registration {
	my $c = shift;

	$c->render ('registration');
}


sub registration_post {
	my( $c ) =  @_;

	my $surname      =  $c->param( 'surname' );
	my $name         =  $c->param( 'name' );
	my $middle_name  =  $c->param( 'middle_name' );
	my $age          =  $c->param( 'age' );

	if( !$surname ) {
		$c->redirect_to ( 'registration' );
		return;
	}

	my $u =  $c->model( 'Student' ) -> create ({
		surname     => $surname,
		name        => $name,
		middle_name => $middle_name,
		age         => $age,
	});

	$c->redirect_to ( 'show_question' );
}


sub show_question {
	my $c = shift;

	$c->render ('show_question');
}


1;
