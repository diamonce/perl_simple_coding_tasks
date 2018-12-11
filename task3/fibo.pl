#!/usr/bin/perl
#

use strict;

use warnings;

sub ShowFibo {

my($FiboLimit)	= @_;

	my(@ListOfFibonachi)	= ( );

	for (my $idxFibo = 0 ; $idxFibo <= $FiboLimit+1; $idxFibo++){
		if($idxFibo <= 1){
			push @ListOfFibonachi, $idxFibo;
		}
		else{
			push @ListOfFibonachi, ($ListOfFibonachi[$#ListOfFibonachi] + $ListOfFibonachi[$#ListOfFibonachi-1]);
		}
	}

	return @ListOfFibonachi;
}

print STDOUT sprintf("%s\n", join ", ", &ShowFibo(100));
