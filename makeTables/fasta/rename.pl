use strict;
use warnings;
my %lut = qw(
22 ATP6 21 ATP8 16 COX1 19 COX2 23 COX3 35 CYTB 6 ND1 10 ND2 25 ND3 28 ND4 27 ND4L 32 ND5 33 ND6 4 l-rRNA 2 s-rRNA 12 tRNA-Ala 26 tRNA-Arg 13 tRNA-Asn 18 tRNA-Asp 14 tRNA-Cys 8 tRNA-Gln 34 tRNA-Glu 24 tRNA-Gly 29 tRNA-His 7 tRNA-Ile 5 tRNA-Leu1 31 tRNA-Leu2 20 tRNA-Lys 9 tRNA-Met 1 tRNA-Phe 37 tRNA-Pro 17 tRNA-Ser1 30 tRNA-Ser2 36 tRNA-Thr 11 tRNA-Trp 15 tRNA-Tyr 3 tRNA-Val);
foreach my $lu(sort {$a <=> $b} keys %lut){
    print $lu."=>".$lut{$lu}."\n";
    rename($lut{$lu}."fa", $lu.".fa") or  
            warn "Couldn't rename $lut{$lu}.fa to $lu.fa: $!\n";
}