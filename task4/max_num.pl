#!/usr/bin/perl
#

use strict;

use warnings;

sub MaxNoGenerator {

my($ptrList)	= @_;
	
	my($MaxNumber)	= "";
	my($MaxDigits)	= 0;

	my(%SortingHash) = ( );

	for my $listItem (@{$ptrList}){
		if(length($listItem) > $MaxDigits){
			$MaxDigits = length($listItem);
		}
	}

	for my $listItem (@{$ptrList}){
	
		my $tmpListItem;

		if(length($listItem) < $MaxDigits){
			$tmpListItem = (substr($listItem,0,1) x ($MaxDigits - length($listItem))) . $listItem;
		}
		else{
			$tmpListItem = $listItem;
		}

		$SortingHash{$tmpListItem} = $listItem;
	}

	for my $listItem (sort {$b <=> $a} keys %SortingHash){
		$MaxNumber .= $SortingHash{$listItem};
	}

	return $MaxNumber;
}

my(@List)	= (5,51,58);

print STDOUT sprintf("%s\n", &MaxNoGenerator(\@List)); 

(@List)	= (5,51,58,404,33,11,21,2122);

print STDOUT sprintf("%s\n", &MaxNoGenerator(\@List)); 
