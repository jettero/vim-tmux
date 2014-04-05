#!/usr/bin/env perl

use strict;
use warnings;

my @options;
for my $o ($0 =~ m/window/ ? qw(-gw): qw(-g -gs)) {
    open my $in, '-|', qw(tmux show-options), $o or die $!;

    while(<$in>) {
        chomp;

        my @F = split " ";
        push @options, $F[0] if @F;
    }
}

my $group  = $0 =~ m/window/ ? "tmuxOptsSetw" : "tmuxOptsSet";
print "syn keyword $group\n";
while( @options ) {
    my $line = "\t\\";

    while( @options and length( $line . " $options[0]" ) < 80 ) {
        $line .= ' ' . shift @options;
    }

    print "$line\n";
}
