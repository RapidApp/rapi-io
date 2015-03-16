use strict;
use warnings;

use FindBin '$Bin';
use Plack::App::File;

my $app = Plack::App::File->new( root => "$Bin/fs/htdocs" )->to_app; 

sub {
  my $env = shift;
  
  # Redirect /fs to /fs/
  return [ 302 => ['Location' => "$env->{SCRIPT_NAME}/"], [ ] ] if ($env->{PATH_INFO} eq '');
  
  # Default document:
  $env->{PATH_INFO} = '/rapifs.html' if ($env->{PATH_INFO} eq '/');
    
  $app->($env)
};