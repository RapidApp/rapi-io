use Rapi::Fs;
use FindBin '$Bin';

Rapi::Fs->new({ mounts => [
  "$Bin/fs/demofiles/stuff",
  "$Bin/fs/demofiles/repos",
  { 
    name   => '[web-root]',  
    driver => 'Filesystem', 
    args   => $Bin 
  }
]})->to_app
