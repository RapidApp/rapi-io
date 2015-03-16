use strict;
use warnings;

use FindBin '$Bin';

use Plack::Util;
use Plack::Builder;

builder {
  #enable "SimpleLogger";  # show on STDERR #<-- this barfs after moving to the separate psgi
  
  mount '/fs/demo' => Plack::Util::load_psgi("$Bin/rapi-fs-demo.psgi");
  mount '/fs/'     => Plack::Util::load_psgi("$Bin/rapi-fs-homepage.psgi");
  
};
