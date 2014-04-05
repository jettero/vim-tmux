#!/usr/bin/env perl

use strict;
use warnings;

open my $in, '-|', qw(tmux lscm) or die $!;

my @commands;
while(<$in>) {
    chomp;

    my @F = split " ";

    push @commands, $F[0] if @F >= 1;
    push @commands, $1 if @F >= 2 and $F[1] =~ m/\(([^)]+)\)/;
}

print "syn keyword tmuxCmds\n";
while( @commands ) {
    my $line = "\t\\";

    while( @commands and length( $line . " $commands[0]" ) < 80 ) {
        $line .= ' ' . shift @commands;
    }

    print "$line\n";
}
