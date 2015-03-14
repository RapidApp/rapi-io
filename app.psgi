use strict;
use warnings;

use Plack::Builder;

builder {
  enable "SimpleLogger";  # show on STDERR
  
  # Simple redirect to RapidApp home page:
  mount '/' => sub { [ 301 => ['Location' => 'http://www.rapidapp.info'], [''] ] };
  
  # Place holder for Rapi::Fs demo site:
  mount '/fs/' => sub {
    my $env = shift;
    return [
        200,
        ['Content-Type' => 'text/plain'],
        [ "The Rapi::Fs demo site is still being written, check back in a little while..."],
    ];
  };
  
};
