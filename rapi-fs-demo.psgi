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
  debug => 1,
  mounts => \@demodirs
})->to_app

