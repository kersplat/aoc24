#!/usr/bin/env perl
use warnings;

open my $fh, "input.txt" or die "Can't open file";
#open my $fh, "test.txt" or die "Can't open file";

my @word_search = ();

while (my $line = <$fh>) {
    chomp $line;
    my @row = split //, $line;
    push @word_search, \@row;
}

close $fh;

my $length = $#word_search;
my $width = $#{$word_search[0]};
my $count = 0;

for (my $i = 0; $i <= $width; $i++) {
    for (my $j = 0; $j <= $length; $j++) {
        if ($word_search[$i][$j] ne "X") {
            next;
        }

        if ($j+3 <= $length &&
            $word_search[$i][$j] eq "X" &&
            $word_search[$i][$j+1] eq "M" &&
            $word_search[$i][$j+2] eq "A" &&
            $word_search[$i][$j+3] eq "S"
        ) {
            $count++;
        }

        if ($j-3 >= 0 && 
            $word_search[$i][$j] eq "X" &&
            $word_search[$i][$j-1] eq "M" &&
            $word_search[$i][$j-2] eq "A" &&
            $word_search[$i][$j-3] eq "S"
        ) {
            $count++;
        }

        if ($i+3 <= $width &&
            $word_search[$i][$j] eq "X" &&
            $word_search[$i+1][$j] eq "M" &&
            $word_search[$i+2][$j] eq "A" &&
            $word_search[$i+3][$j] eq "S"
        ) {
            $count++;
        }

        if ( $i-3 >= 0 &&
            $word_search[$i][$j] eq "X" &&
            $word_search[$i-1][$j] eq "M" &&
            $word_search[$i-2][$j] eq "A" &&
            $word_search[$i-3][$j] eq "S"
        ) {
            $count++;
        }

        if ($i+3 <= $width &&
            $j+3 <= $length && 
            $word_search[$i][$j] eq "X" &&
            $word_search[$i+1][$j+1] eq "M" &&
            $word_search[$i+2][$j+2] eq "A" &&
            $word_search[$i+3][$j+3] eq "S"
        ) {
            $count++;
        }

        if ($i+3 <= $width &&
            $j-3 >= 0 &&
            $word_search[$i][$j] eq "X" &&
            $word_search[$i+1][$j-1] eq "M" &&
            $word_search[$i+2][$j-2] eq "A" &&
            $word_search[$i+3][$j-3] eq "S"
        ) {
            $count++;
        }

        if ($i-3 >= 0 &&
            $j-3 >= 0 &&
            $word_search[$i][$j] eq "X" &&
            $word_search[$i-1][$j-1] eq "M" &&
            $word_search[$i-2][$j-2] eq "A" &&
            $word_search[$i-3][$j-3] eq "S"
        ) {
            $count++;
        }

        if ($i-3 >= 0 &&
            $j+3 <= $length &&
            $word_search[$i][$j] eq "X" &&
            $word_search[$i-1][$j+1] eq "M" &&
            $word_search[$i-2][$j+2] eq "A" &&
            $word_search[$i-3][$j+3] eq "S"
        ) {
            $count++;
        }
    }
}

print $count . "\n";
