#!/usr/bin/perl

use strict;
use warnings;
use LWP::Simple;

my $name = 'NP_014741';
my $query_str = 'http://www.ncbi.nlm.nih.gov/protein/' . $name . '?report=fasta&log$=seqview&format=text';
#get("http://www.ncbi.nlm.nih.gov/protein/NP_014741?report=fasta&log$=seqview&format=text");

my $file = 'D:/test_lwp.txt';
my $ret = getstore($query_str, $file);

#my $content = get($query_str);
#if(defined $content)
#{#parse fasta for organism, common name
#    print $content;
#    
#}
#else { print "content undefined\n"; }