#!/usr/bin/perl
#
use strict;

use warnings;

sub PlaceSigns {

my($ptrList, $ptrSign, $ptrResult)	= @_;

	my($Expression);
	my($Result);

	my(@List)	= @{$ptrList};
	my(@Sign)	= @{$ptrSign};	

	for (my $ListIdx=0;$ListIdx<=$#List;$ListIdx++){
		$Expression .= $List[$ListIdx];

		if($ListIdx <= $#Sign){
			$Expression .= $Sign[$ListIdx];
		}
	}

	$Result = eval "$Expression";

	if($Result == 100){
		$$ptrResult	= $Expression . " = 100";
		print STDOUT "$$ptrResult\n";
		return;
	}
	else{
		if($#Sign < $#List - 1){
			push @Sign, "";
		}
		else{
			return;
		}

		for my $CurrSign ( "", "-", "+" ){
			$Sign[$#Sign] = $CurrSign;
			&PlaceSigns(\@List, \@Sign, $ptrResult);
		}
	}

	return;
}

my(@List)	= (1, 2, 3, 4, 5, 6, 7, 8, 9);
my(@Sign)	= ( );

my($Result);

&PlaceSigns(\@List, \@Sign, \$Result);

#print STDOUT "$Result\n";
