#!/usr/bin/env perl

open my $fh, "input.txt" or die "Can't open file";

my @right_list = [];
my @left_list = [];
my $total_difference = 0;

while (my $line = <$fh>) {
    chomp $line;
    my ($a, $b) = split /\s+/, $line, 2;
    push @left_list, $a;
    push @right_list, $b;
}

close $fh;

my @left_list_sorted = sort @left_list;
my @right_list_sorted = sort @right_list;

my $length = $#left_list;

for (my $i = 0; $i < $length; $i++) {
    $total_difference += abs($left_list_sorted[$i] - $right_list_sorted[$i]);
}

print "total difference: " . $total_difference . "\n";

my $total_similarity = 0;
foreach my $lhs (@left_list) {

    my $rhs_count = 0;
    foreach my $rhs (@right_list) {
        if ($rhs == $lhs) {
            $rhs_count++;
        }
    }
    $total_similarity += $lhs * $rhs_count;
}

print "total similarity " . $total_similarity . "\n";
