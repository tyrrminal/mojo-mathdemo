use Mojo::Base -strict;

use Test::More;
use Test::Mojo;

my $t = Test::Mojo->new('Mathdemo');

#Test OpenAPI Definition response
$t->get_ok('/api/v1')->status_is(200)->json_is('/info/title' => 'Mathdemo');

# Test /echo endpoint
$t->get_ok("/api/v1/echo?expression=2%2B2")->json_is('/expression' => "2+2");

# Test /eval endpoint
$t->post_ok('/api/v1/eval' => json => {expression => "2+2"})->json_is("/result" => 4);

done_testing();
