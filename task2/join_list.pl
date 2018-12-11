#!/usr/bin/perl
#

use strict;

use warnings;

my(@list1)	= ( 1, 2, 3);
my(@list2)	= ( "a", "b", "c", "d", "e");

sub JoinTwoLists {

my($ptrFirstList, $ptrSecondList)	= @_;

	my(@CombinedList)	= ( );
	my($ListElemIdx);
	my($ptrMainList);
	my($ptrSecondaryList);

	if(scalar(@{$ptrFirstList}) >= scalar(@{$ptrSecondList})){
		$ptrMainList		= $ptrFirstList;
		$ptrSecondaryList	= $ptrSecondList;
	}
	else{
		$ptrMainList		= $ptrSecondList;
		$ptrSecondaryList	= $ptrFirstList;
	}

	for ($ListElemIdx=0;$ListElemIdx<=$#{$ptrMainList};$ListElemIdx++){
		if(length(${$ptrMainList}[$ListElemIdx]) > 0){
			push @CombinedList, ${$ptrMainList}[$ListElemIdx];

			if(length(${$ptrSecondaryList}[$ListElemIdx]) > 0){
				push @CombinedList, ${$ptrSecondaryList}[$ListElemIdx];
			}
		}
	}

	return @CombinedList;
}

print STDOUT sprintf("%s\n", (join ", ", &JoinTwoLists(\@list1, \@list2)));
