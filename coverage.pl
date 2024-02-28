#!/usr/bin/perl

use strict;

my $ip=$ARGV[0];
my $op=$ARGV[1];

open(FH,"$ip") or die ":("; #TSV - contigName\tContigLength\tNum.mappedReads - Output file from samtools idxstats
open(OP,">$op")or die ":(";

my $L=151; #length of Reads

    while(<FH>)
    {
        chomp $_;
        my @arr=split("\t",$_);
        my $cov=($arr[2] * $L)/$arr[1];
        print OP "$arr[0]\t$arr[1]\t$arr[2]\t$cov\n";
       }

=comm
Coverage = (N*L)/G

Where,
N - number of reads,
L - average length of the reads
G - target size (genome or contig)
