function ranger --wraps='ranger'
  command ranger $argv --choosedir=$HOME/.rangerdir; set -l LASTDIR (cat $HOME/.rangerdir); cd $LASTDIR
end
