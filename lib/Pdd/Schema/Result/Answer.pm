package Pdd::Schema::Result::Answer;

use strict;
use warnings;
use base 'Pdd::Schema::Result';


my $T =  __PACKAGE__;
$T->table( 'answers' );

$T->add_columns(
	id =>  {
		data_type         =>  'integer',
		is_auto_increment =>  1,
	},
	ticket =>  {
		data_type =>  'integer',
	},
	question =>  {
		data_type =>  'integer',
	},
	answer =>  {
		data_type   =>  'integer',
	},
	student_id =>  {
		data_type   =>  'integer',
	},
	time =>  {
		data_type     =>  'integer',
		default_value => 0,
	},
);

$T->set_primary_key( 'id' );


1;
