#!/usr/bin/perl


my $filename = $ARGV[0] or die ":(";
my $output = $ARGV[1] or die ":(";

open(FH,"$filename") or die ":(";
open(OP,">$output") or die ":(";

my $count;

    while(<FH>)
    {
        chomp $_;
        if($_=~/^>/)
	    {
		    print OP "$_\t";
	    }

	    else
	    {
		    my $seq=$_;
		    my $seqlen=length($seq);
		    print OP "$seqlen\t";
		    my @arr1=split("",$seq);
		    my $count=0;
		    foreach my $el(@arr1)
		    {
			    if($el eq 'H')
			{
				++$count;
			}
				
		}

print OP "$count\t";
my $hc=$count/$seqlen;
print OP "$hc\n";
     }
}

#		for(my $i=0;$i<(length($seq)-2);$i+=3)
#			{
#				$codon=substr($seq,$i,3);
#				&codon2aa($codon);
#			}
#	}

#}


#sub codon2aa{
