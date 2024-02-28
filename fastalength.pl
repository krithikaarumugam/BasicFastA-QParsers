#!/usr/bin/perl


use strict;
my $ip=$ARGV[0] or die ":("; #Fasta file with sequences in one line
my $op=$ARGV[1] or die ":("; #tsv output file sequence header\tsequence length

open(FH,"$ip");
open(OP,">$op");

    while(<FH>)
    {
        chomp $_;
        if($_=~/^>/)
        {
            my $header=$_;
            print OP "$header\t";
        }
        else
        {
            my $seq=$_;
            my $len=length($seq);
            print OP "$len\n";
        }
     }
