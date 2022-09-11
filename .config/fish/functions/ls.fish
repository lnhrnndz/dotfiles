function ls --wraps='exa' --description 'alias ls exa --group-directories-first'
  exa --group-directories-first $argv;
end
