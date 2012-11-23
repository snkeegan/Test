#!/usr/bin/perl

use strict;
use warnings;

######################################################################
# This is an automatically generated script to run your query.
# To use it you will require the InterMine Perl client libraries.
# These can be installed from CPAN, using your preferred client, eg:
#
#    sudo cpan Webservice::InterMine
#
# For help using these modules, please see these resources:
#
#  * http://search.cpan.org/perldoc?Webservice::InterMine
#       - API reference
#  * http://search.cpan.org/perldoc?Webservice::InterMine::Cookbook
#       - A How-To manual
#  * http://www.intermine.org/wiki/PerlWebServiceAPI
#       - General Usage
#  * http://www.intermine.org/wiki/WebService
#       - Reference documentation for the underlying REST API
#
######################################################################

# The following import statement sets YeastMine as your default
use Webservice::InterMine::Simple; # 'http://yeastmine.yeastgenome.org/yeastmine/service';

my $service = get_service('http://yeastmine.yeastgenome.org/yeastmine/service');
my $query = $service->new_query;

  $query->add_view(qw/
    Protein.symbol
    Protein.genes.symbol 
/); #1st gives Nup1p, 2nd gives NUP1, ask David which one to use?

  $query->add_constraint(
    path  => 'Protein.secondaryIdentifier',
    op    => '=',
    value => 'YOR098C'
);
$query->add_constraint(
    path        => 'Protein.organism',
    op          => 'LOOKUP',
    value       => 'Saccharomyces cerevisiae'
);

my @rows = $query -> results_table;
foreach my $row (@rows) {
    print "name: $row->[0], gene name: $row->[1]\n";
}


