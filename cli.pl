#!/usr/bin/perl

use strict;
use warnings;

use LWP::UserAgent;
use Getopt::Long;

use Mojo::DOM;

my $term;

GetOptions(
    'term=s' => \$term,
    'i'      => \my $interactive,
) or die ("Usage: perl cli.pl <term>");

if (!$term && !$interactive) {
    die ("Usage: perl cli.pl <term>");
}

sub get_data {
    my $ua = LWP::UserAgent->new;

    my $get_request = $ua->get("https://indieweb.org/$_[0]");

    my $dom = Mojo::DOM->new($get_request->decoded_content);

    my $definition = $dom->find('.p-summary')->first;

    if ($definition) {
        print $definition->all_text() . "\n";
    }
    else {
        print "No definition found.\n";
    }
}

if ($interactive) {
    while (1) {
        print "Enter search term: ";
        $term = <STDIN>;
        chomp $term;
        get_data($term) or next;
    }
} else {
    get_data($term);
}
