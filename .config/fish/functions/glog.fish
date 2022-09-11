function glog --wraps='git log' --description 'A pretty git log'
  git log --branches --graph --pretty=format:"%C(yellow)%h%Creset %s%C(auto)%d" $argv;
end
