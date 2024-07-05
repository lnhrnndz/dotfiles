#!/bin/fish
if status is-interactive
  #fish_default_key_bindings
  fish_vi_key_bindings
  bind -M insert \cy accept-autosuggestion
  bind -M insert \cf forward-word
end

function fish_greeting
  #fortune
end

export DBUS_SESSION_BUS_ADDRESS="unix:path=$DBUS_LAUNCHD_SESSION_BUS_SOCKET"


#function fish_mode_prompt
#  set_color brblue
#  fish_vcs_prompt > /dev/null
#  and printf "%s " (fish_vcs_prompt | sed 's/^ //')
#  set_color normal
#  switch $fish_bind_mode
#    case default
#      set_color brred
#    case insert
#      set_color brgreen
#    case replace
#      set_color bryellow
#    case replace_one
#      set_color bryellow
#    case visual
#      set_color brmagenta
#    case '*'
#      set_color brwhite
#  end
#  printf '%s' (prompt_pwd)
#  set_color normal
#  printf '>> '
#end

function fish_prompt
  set_color magenta
  printf '%s@%s' $USER $hostname
  printf '%s ' (fish_vcs_prompt)
  set_color green
  printf '%s' (prompt_pwd)
  set_color normal
  printf '> '
  set_color normal
end

function fish_right_prompt
  set -l exitstatus $status
  if test $exitstatus -ne 0
    set_color brred
    echo [$exitstatus]
    set_color normal
  end
  set_color normal
end

function source_files
  set -l files \
      $HOME/.config/shell/profile \
      $HOME/.config/fish/abbr.fish \
      $HOME/.config/fish/alias.fish \

  for i in $files
    test -e $i && source $i
    #test -e $i && echo $i
  end
end

source_files
