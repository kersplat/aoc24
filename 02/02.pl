#!/usr/bin/env perl

my $safe_count = 0;

open my $fh, "input.txt" or die "Can't open file";

while (my $line = <$fh>) {
    chomp $line;
    my @levels = split /\s+/, $line;
    my $levels = $#levels;
    my $marks = "";

    for (my $i = 0; $i < $levels; $i++) {
        $difference = $levels[$i] - $levels[$i + 1];
        if (abs($difference) > 0 && abs($difference) <= 3) {
            if ($difference - abs($difference) == 0) {
                $marks = $marks . "+";
            } else {
               $marks = $marks . "-";
            }
        }
    }

    if (length($marks) == $levels) {
        my $pos = () = $marks =~ /\+/g;
        my $neg = () = $marks =~ /-/g;

        if ($pos == $levels || $neg == $levels) {
            $safe_count++;
        }
    }
}

close $fh;

print "safe count: " . $safe_count . "\n";
