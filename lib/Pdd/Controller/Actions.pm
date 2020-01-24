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

	my $student =  $c->model( 'Student' ) -> create ({
		surname     => $surname,
		name        => $name,
		middle_name => $middle_name,
		age         => $age,
	});

    $c->cookie( student_id => $student->id );

    $c->render( "show_question", num => 1 );
}



sub saving_answers {
    my( $c ) =  @_;

    my $student_id =  $c->cookie( 'student_id' );
    if( !$student_id ) {
        $c->redirect_to( 'registration' );
        return;
    }
    my $num =  $c->cookie( 'num' );
    my $input =  $c->param( 'answer' );

    if ( !defined $input ) {
        $c->redirect_to( 'show_question' );
        return;
    }

    $c->model( 'Answer' )->create({
        ticket     => 1,
        question   => $num,
        answer     => $input,
        student_id => $student_id,
        time       => 0,
    });


    $c->redirect_to ( 'next_question' );
}



sub next_question {
    my $c = shift;

    my $registration =  $c->cookie( 'student_id' );
    if( !$registration ) {
        $c->redirect_to( 'registration' );
        return;
    }

    my $num =  $c->cookie( 'num' );

    $c->render( "show_question", num => $num +1 );
}


1;
