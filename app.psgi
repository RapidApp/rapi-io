use strict;
use warnings;

use FindBin '$Bin';

use Plack::Util;
use Plack::Builder;

my $rapi = Plack::Util::load_psgi("$Bin/rapi-fs-demo.psgi");

builder {
  #enable "SimpleLogger";  # show on STDERR #<-- this barfs after moving to the separate psgi
  
  # Simple redirect to RapidApp home page:
  mount '/' => sub { [ 301 => ['Location' => 'http://www.rapidapp.info'], [''] ] };
  
  ## Place holder for Rapi::Fs demo site:
  #mount '/fs/' => sub {
  #  my $env = shift;
  #  return [
  #      200,
  #      ['Content-Type' => 'text/plain'],
  #      [ "The Rapi::Fs demo site is still being written, check back in a little while..."],
  #  ];
  #};
  
  # Just redir to the demo until the content pages are done
  mount '/fs/' => sub { [ 301 => ['Location' => '/fs/demo/'], [''] ] };
  
  mount '/fs/demo/' => $rapi;
  
};
