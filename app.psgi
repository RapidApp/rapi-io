use strict;
use warnings;

use FindBin '$Bin';
use Path::Class qw/file dir/;

use Rapi::Fs;


my @demodirs = (
  "$Bin/fs/demofiles/stuff",
  "$Bin/fs/demofiles/repos"
);

-d $_ or dir($_)->mkpath for (@demodirs);

my $rapi = Rapi::Fs->new({
  mounts => \@demodirs
})->to_app;


use Plack::Builder;

builder {
  enable "SimpleLogger";  # show on STDERR
  
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
