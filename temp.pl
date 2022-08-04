#!/usr/bin/perl

use feature qw(say);

if (@ARGV[0] eq "f") {
	say ((@ARGV[1] * 1.8) + 32), "\n";
} else {
	say ((@ARGV[1] - 32) * 0.5556), "\n";
}
