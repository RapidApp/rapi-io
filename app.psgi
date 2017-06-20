use strict;
use warnings;

use FindBin '$Bin';

use Plack::Util;
use Plack::Builder;

builder {
  #enable "SimpleLogger";  # show on STDERR #<-- this barfs after moving to the separate psgi
  
  # Redirect for YAPC::NA::2014
  mount '/yn2014' => sub { 
    [ 307 => ['Location' => "http://www.rapidapp.info/demos/yapcna2014"], [ ] ] 
  };
  
  # Redirect and demo app/slides for YAPC::NA 2015:
  #mount '/yn2015' => builder {
  #  mount '/demo' => Plack::Util::load_psgi("$Bin/yn2015/app.psgi");
  #  mount '/'     => sub {[ 307 => ['Location' => "http://www.rapidapp.info/demos/yn2015"], [] ]};
  #};
	
  # Redirect for YAPC::NA::2016
  mount '/yn2015' => sub { 
    [ 307 => ['Location' => "http://www.rapidapp.info/demos/yn2015"], [ ] ] 
  };
	
  # Redirect for YAPC::NA::2016
  mount '/yn2016' => sub { 
    [ 307 => ['Location' => "http://www.rapidapp.info/demos/yn2016"], [ ] ] 
  };
  
  # Redirect for Cinci.pm, apr 8, 2015 talk
  mount '/cpm2015' => sub { 
    [ 307 => ['Location' => "https://github.com/RapidApp/cpm2015"], [ ] ] 
  };
  
  # Redirect for Milwaukee.pm , apr 16, 2015 talk
  mount '/mpm2015' => sub { 
    [ 307 => ['Location' => "http://www.rapidapp.info/demos/mpm2015"], [ ] ] 
  };
	
  # Redirect for TPC, jun 20 talk
  mount '/tpc2017' => sub { 
    [ 307 => ['Location' => "https://www.slideshare.net/vanstyn/rapiblog-talk-tpc-2017"], [ ] ] 
  };
  
  # Temp redirect for Rapi::Blog - real site coming soon
  mount '/blog' => sub { 
    [ 307 => ['Location' => "https://metacpan.org/pod/Rapi::Blog"], [ ] ] 
  };
	
  mount '/fs/demo' => Plack::Util::load_psgi("$Bin/rapi-fs-demo.psgi");
  mount '/fs/'     => Plack::Util::load_psgi("$Bin/rapi-fs-homepage.psgi");
  
  # Redirect root requests to the RapidApp homepage:
  mount '/' => sub { [ 307 => ['Location' => "http://www.rapidapp.info"], [ ] ] };
};
