#!/usr/bin/perl
#

use strict;

use warnings;

my(@list)	= (1, 2, 4, 12, 3, 11, 22, 55, 22);

sub SumListWithFor {

my($ptrList)	= @_;
	
	my($Sum)	= 0;

	for my $ListValue (@{$ptrList}){
		$Sum += $ListValue;
	}

	return $Sum;
}

sub SumListWithWhile {

my($ptrList)	= @_;
	
	my(@tmpList)	= @{$ptrList};
	my($Sum)	= 0;

	while(my $ListValue = shift @tmpList){
		$Sum += $ListValue;
	}

	return $Sum;
}

sub SumListWithRecursion {

my($ptrList)	= @_;
	
	my(@tmpList)	= @{$ptrList};
	my($Sum)	= 0;
	my($ListValue)  = 0;

	if($ListValue = shift @tmpList){
		$Sum += $ListValue + &SumListWithRecursion(\@tmpList);
	}
		
	return $Sum;
}

print STDOUT sprintf("%s\n", &SumListWithFor(\@list));

print STDOUT sprintf("%s\n", &SumListWithWhile(\@list));

print STDOUT sprintf("%s\n", &SumListWithRecursion(\@list));
