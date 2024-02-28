#KA on Dec 16, 2013
#Mask regions in contigs with 'N'
#!/usr/bin/perl

#Usage : perl mask.pl FastaFile FilewIndex MaskedFasta MaskedRegion
use strict;

my $fastafile = $ARGV[0];
my $indexfile = $ARGV[1];
my $maskedfile = $ARGV[2];
my $maskdata = $ARGV[3];

open(FF,"$fastafile") or die "$fastafile not found"; #FastaFile
open(IF,"$indexfile") or die "$indexfile not found"; #FilewIndex.tsv "contigName\t RNAmmer-1.2\t rRNA\t start\t end\t score\t strand\t desc\t type - RNAmmer output
open(OP,">$maskedfile"); #MaskedFasta
open(OP1,">$maskdata"); #MaskedRegion


my @arr;
my $arr1;
my $header;
my $arr1maskdata;
my $arr1maskdata_len;
my $n='N';
my @arrif;
my $seq;
my @info;
my $line;
#&sub;
#seek(IF,1,0);
my $nprint;
my $arrff;
my @arrff1;
my $abc;
my %hash=();

    while(my $line=<FF>) #read fasta and store in a hash; header -> sequence
    {
        chomp $line;
        if($line =~/^>/)
            {
                $header = $line;
 		    }
         else
            {
                $abc=$line;
		    }
         $hash{$header}=$abc;
	}


    foreach my $line1(<IF>) ##FilewIndex.tsv "contigName\t RNAmmer-1.2\t rRNA\t start\t end\t score\t strand\t desc\t type - RNAmmer output
    {
    chomp $line1;
    if($line1=~/^>NODE/) 
        {
            @arrif=split("\t",$line1);
	        print OP1 "$arrif[0]\t$arrif[3]\t$arrif[4]\t"; #MaskedRegion

	        if($arrif[3]<$arrif[4]) #if Forward strand +
	        {
                $arr1maskdata = substr($hash{$arrif[0]},($arrif[3]-1),(($arrif[4]-1)-($arrif[3]-1))+1);
                print OP1 "$arr1maskdata\n"; #MaskedRegion

	            my $nprint_assign = $n x ((($arrif[4]-1)-($arrif[3]-1))+1);
	            substr($hash{$arrif[0]},($arrif[3]-1),((($arrif[4]-1)-($arrif[3]-1))+1),$nprint_assign);
	            print OP "$arrif[0]\n$hash{$arrif[0]}\n"; #MaskedFasta
	        }


	        if($arrif[3]>$arrif[4]) #if Reverse strand -
	        {
	            $arr1maskdata = substr($hash{$arrif[0]},$arrif[4]-1,(($arrif[3]-1)-($arrif[4]-1))+1);
	            print OP1 "$arr1maskdata\n"; #MaskedRegion
    
	            my $nprint_assign = $n x ((($arrif[3]-1)-($arrif[4]-1))+1);
                substr($hash{$arrif[0]},($arrif[4]-1),((($arrif[3]-1)-($arrif[4]-1))+1),$nprint_assign);
	            print OP "$arrif[0]\n$hash{$arrif[0]}\n"; #MaskedFasta
            }
            
        }
    }
