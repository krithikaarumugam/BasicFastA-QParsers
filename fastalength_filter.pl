#!/usr/bin/perl

use strict;

my $filename = $ARGV[0] or die ":(";
my $output = $ARGV[1] or die ":(";


open(FH,"$filename"); #fasta file with sequences in one line
open(OP,">$output");  #fasta file after length filter


my $id;

    while(<FH>)
    {
        chomp($_);
	    if($_=~/^>/)
	    {
		    $id=$_;
		    #print OP "$id\t";
	    }
	
	    else
	    {
		    my $seq=$_;
		    my $length_seq=length($seq);
		    if($length_seq>=500) #specify filter length
            { 
		        print OP "$id\n";
		        print OP "$seq\n";
            }
	    }
    }   

