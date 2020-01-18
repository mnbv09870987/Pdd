package Pdd::Schema::Result::Student;

use strict;
use warnings;
use base 'Pdd::Schema::Result';


my $T =  __PACKAGE__;
$T->table( 'students' );

$T->add_columns(
	id =>  {
		data_type         =>  'integer',
		is_auto_increment =>  1,
	},
	surname =>  {
		data_type =>  'text',
		size      =>  128,
	},
	name =>  {
		data_type =>  'text',
		size      =>  128,
		is_nullable =>  1,
	},
	middle_name =>  {
		data_type =>  'text',
		size      =>  128,
		is_nullable =>  1,
	},
	age =>  {
		data_type   =>  'integer',
		is_nullable =>  1,
	},
);

$T->set_primary_key( 'id' );
$T->add_unique_constraint([ 'surname' ]);


1;
