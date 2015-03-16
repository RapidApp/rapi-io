use Rapi::Fs;
use FindBin '$Bin';

Rapi::Fs->new({ mounts => [
  "$Bin/fs/demofiles/stuff",
  "$Bin/fs/demofiles/repos",
  { 
    name   => '[web-root]',  # <-- custom name
    driver => 'Filesystem',  # <-- already default
    args   => $Bin 
  }
]})->to_app
