# -------------------------------------------------------------------------------------------
# Start
# -------------------------------------------------------------------------------------------

# My toy :)
dash /home/magic/github/nincat/nincat

# Load faster
. ~/.config/zsh/zsh-plugins/instant-zsh.zsh

# while PROMPT
#instant-zsh-pre ":)"



PS1_SYMBOLS='Ǝ♥>:∞▲✞✛✝✜✟?!❥$-+§ØŦƆƩƪȹϮϨϞ߷࿗ლႿჄჯᐉᓬᗆᗇᗈᗎᗎᗓᗔᗘᗙᗠᗤᗦᘱᙄᯡᯢ᯾ᰉᰜᰞ᱃᱃†'
PS1_SYMBOL=$(expr substr "$PS1_SYMBOLS" $(shuf -i 1-$(printf "$PS1_SYMBOLS" | wc -m) -n 1) 1)

#instant-zsh-pre "%B%~ $PS1_SYMBOL %b"
#
instant-zsh-pre "%B%{$fg[grey]%}%~%{$fg[red]%} %{$reset_color%}$PS1_SYMBOL%b "

#zmodload zsh/zprof

# -------------------------------------------------------------------------------------------
# Autoload
# -------------------------------------------------------------------------------------------


autoload -Uz compinit \
  down-line-or-beginning-search \
  edit-command-line \
  up-line-or-beginning-search


# -------------------------------------------------------------------------------------------
# zmodload
# -------------------------------------------------------------------------------------------


zmodload zsh/complist


# -------------------------------------------------------------------------------------------
# zstyle
# -------------------------------------------------------------------------------------------


zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'


# -------------------------------------------------------------------------------------------
# Loop for init
# -------------------------------------------------------------------------------------------


skip_global_compinit=1
[[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]] && compinit || compinit -C


# -------------------------------------------------------------------------------------------
# init
# -------------------------------------------------------------------------------------------


#colors


# -------------------------------------------------------------------------------------------
# aliaseses
# -------------------------------------------------------------------------------------------


# Timestamp format
#case ${HIST_STAMPS-} in
#  "mm/dd/yyyy") alias history='omz_history -f' ;;
#  "dd.mm.yyyy") alias history='omz_history -E' ;;
#  "yyyy-mm-dd") alias history='omz_history -i' ;;
#  "") alias history='omz_history' ;;
#  *) alias history="omz_history -t '$HIST_STAMPS'" ;;
#esac


# -------------------------------------------------------------------------------------------
# Plugin Functions
# -------------------------------------------------------------------------------------------


# Get back to nvim easily
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line -w
  else
    zle push-input -w
    zle clear-screen -w
  fi
}

# History wrapper
function omz_history {

  local clear list
  zparseopts -E c=clear l=list

  if [[ -n "$clear" ]]; then
    # if -c provided, clobber the history file
    echo -n >| "$HISTFILE"
    fc -p "$HISTFILE"
    echo >&2 History file deleted.
  elif [[ -n "$list" ]]; then
    # if -l provided, run as if calling `fc' directly
    builtin fc "$@"
  else
    # unless a number is provided, show all history events (starting from 1)
    [[ ${@[-1]-} = *[0-9]* ]] && builtin fc -l "$@" || builtin fc -l "$@" 1
  fi

}

function forward-kill-word {

  zle forward-word

  zle backward-kill-word

}

r-delregion() {
  if ((REGION_ACTIVE)) then
     zle kill-region
  else 
    local widget_name=$1
    shift
    zle $widget_name -- $@
  fi
}

r-deselect() {
  ((REGION_ACTIVE = 0))
  local widget_name=$1
  shift
  zle $widget_name -- $@
}

r-select() {
  ((REGION_ACTIVE)) || zle set-mark-command
  local widget_name=$1
  shift
  zle $widget_name -- $@
}

x-copy-region-as-kill () {
  zle copy-region-as-kill
  print -rn "$CUTBUFFER" | xclip -selection clipboard
}


# -------------------------------------------------------------------------------------------
# zse init functions
# ------------------------------------------------------------------------------------------


zle -N x-copy-region-as-kill
zle -N fancy-ctrl-z
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
zle -N edit-command-line
zle -N forward-kill-word


# -------------------------------------------------------------------------------------------
# external sources
# -------------------------------------------------------------------------------------------


# zsh-syntax-highlighting ; use pacman
. /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

# zsh-autosuggestions ; use pacman
. /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null

# screen plugin from oh my zsh ; just download
. $HOME/.config/zsh/zsh-plugins/screen 2>/dev/null

# my own aliases
. $HOME/desktop/aliasesrc



# -------------------------------------------------------------------------------------------
# Set full
# -------------------------------------------------------------------------------------------


HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND=''
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND=''
HISTFILE=~/.config/zsh/.zsh_history
HISTSIZE=5000
SAVEHIST=5000
PS1="%B%{$fg[grey]%}%~%{$fg[red]%} %{$reset_color%}$PS1_SYMBOL%b "
_comp_options+=(globdots)


# -------------------------------------------------------------------------------------------
# SETOPS
# -------------------------------------------------------------------------------------------


# History command configuration
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt share_history          # share command history data


# -------------------------------------------------------------------------------------------
# Bindkeys
# -------------------------------------------------------------------------------------------


bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down
bindkey '^[[H' beginning-of-line
bindkey '^[[4~' end-of-line
bindkey '^[[P' delete-char
bindkey '^Z' fancy-ctrl-z
bindkey '^?' backward-delete-char
bindkey '^E' edit-command-line
bindkey '^[[24;5~^[[23;5~' backward-kill-word
bindkey '^[[M' forward-kill-word
bindkey '^X' x-copy-region-as-kill
bindkey -M menuselect '^[[Z' reverse-menu-complete


# -------------------------------------------------------------------------------------------
# Bindkeys Loops
# -------------------------------------------------------------------------------------------


for key     kcap   seq        mode     widget (
    sleft   kLFT   $'\e[1;2D' select   backward-char
    sright  kRIT   $'\e[1;2C' select   forward-char
    sup     kri    $'\e[1;2A' select   history-substring-search-up
    sdown   kind   $'\e[1;2B' select   history-substring-search-down

    send    kEND   $'\E[1;2F' select   end-of-line
    send2   x      $'\E[4;2~' select   end-of-line

    shome kHOM     $'\E[1;2H' select   beginning-of-line
    shome2  x      $'\E[1;2~' select   beginning-of-line

    left    kcub1  $'\EOD'    deselect backward-char
    right   kcuf1  $'\EOC'    deselect forward-char

    end     kend   $'\EOF'    deselect end-of-line
    end2    x      $'\E4~'    deselect end-of-line

    home    khome  $'\EOH'    deselect beginning-of-line
    home2   x      $'\E1~'    deselect beginning-of-line

    csleft  x      $'\E[1;6D' select   backward-word
    csright x      $'\E[1;6C' select   forward-word
    csend   x      $'\E[1;6F' select   end-of-line
    cshome  x      $'\E[1;6H' select   beginning-of-line

    cleft   x      $'\E[1;5D' deselect backward-word
    cright  x      $'\E[1;5C' deselect forward-word

    del     kdch1   $'\E[3~'  delregion delete-char
    bs      x       $'^?'     delregion backward-delete-char

  ) {
  eval "key-$key() {
    r-$mode $widget \$@
  }"
  zle -N key-$key
  bindkey ${terminfo[$kcap]-$seq} key-$key
}

#zprof

instant-zsh-post
