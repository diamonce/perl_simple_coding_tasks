#!/usr/bin/perl
#

use strict;

use warnings;

sub MaxNoGenerator {

my($ptrList)	= @_;
	
	my($MaxNumber)	= "";

	for my $listItem (sort {$b cmp $a} @{$ptrList}){
		$MaxNumber .= $listItem;
	}

	return $MaxNumber;
}

my(@List)	= (50, 2, 1, 9);

print STDOUT printf("%s\n", &MaxNoGenerator(\@List)); 
