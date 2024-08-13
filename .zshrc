# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

zmodload zsh/zprof
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# export PATH="$PYENV_ROOT/bin:$HOME/.local/bin:$HOME/.emacs.d/bin:$PATH"
#export PATH="/opt/google-cloud-cli/bin:${KREW_ROOT:-$HOME/.krew}/bin:$HOME/.nix-profile/bin:$HOME/.local/bin:$HOME/.config/emacs/bin:$HOME/go/bin:$PATH"
#export PATH="${HOME}/.local/share/gem/ruby/3.0.0/bin:$PATH"


# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# cache/hashing binaries. more info:
# https://stackoverflow.com/questions/36543707/why-does-zsh-ignore-the-path-entry-order/36547391#36547391
setopt nohashcmds

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME="spaceship"
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

export NVM_LAZY_LOAD=true
export NVM_COMPLETION=true

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-vim-mode zsh-vimode-visual virtualenv kubectl sudo fzf fzf-zsh-plugin fzf-tab zsh-autosuggestions zsh-syntax-highlighting zsh-nvm evalcache)
# plugins=(git fzf zsh-autosuggestions zsh-syntax-highlighting virtualenv kubectl sudo zsh-vim-mode zsh-vimode-visual)
# tmux tmuxinator ssh-agent vi-mode fzf-zsh-plugin 

source $ZSH/oh-my-zsh.sh

# User configuration
test -r ~/.dir_colors && eval $(dircolors ~/.dir_colors)

# if I ever get around to wanting to replace zsh-vim-mode with zsh-vi-mode, following will be needed
# zvm_after_init_commands+=('[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh && [ -f /usr/share/fzf/completions.zsh  ] && source /usr/share/fzf/completions.zsh')
# 
# function zvm_config () {
#     ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
#     ZVM_ESCAPE_KEYTIMEOUT=0.01
# }
#source /usr/share/fzf/key-bindings.zsh
#source /usr/share/fzf/completion.zsh

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

export EDITOR="emacsclient -nw"
# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# On-demand rehash
zshcache_time="$(date +%s%N)"

autoload -Uz add-zsh-hook

rehash_precmd() {
  if [[ -a /var/cache/zsh/pacman ]]; then
    local paccache_time="$(date -r /var/cache/zsh/pacman +%s%N)"
    if (( zshcache_time < paccache_time )); then
      rehash
      zshcache_time="$paccache_time"
    fi
  fi
}

add-zsh-hook -Uz precmd rehash_precmd

# omz
alias zshconfig="subl ~/.zshrc"
alias ohmyzsh="thunar ~/.oh-my-zsh"

# ls
alias l='lsd -lh'
alias ll='lsd -lah'
alias la='lsd -A'
alias lm='lsd -m'
alias lr='lsd -R'
alias lg='lsd -l --group-directories-first'

# custom overrides
alias vi='vim'
alias cat='bat'
alias pc="pass -c"
alias 2fac="2fa -clip"
alias scratch="cd ~/scratch"
alias code="codium"

alias v='f -e "$EDITOR"'
alias o='a -e xdg-open'
alias j='zz'
alias dir='pwd | tee >(clipcopy)'
alias ccp='clipcopy'
alias bazel='bazelisk'
alias vi='emacsclient -nw'

# git
alias gcl='git clone --depth 1'
alias gi='git init'
alias ga='git add'
alias gc='git commit'
alias gcm='git commit -m'
alias gp='git push'
alias gcfz='git cof'

# git-create-merge-request
# I think this is gitlab related, test before removal
function gcmr() {
    local input_string="$1"
    local branch_name="$(git rev-parse --abbrev-ref HEAD)"

    git push -o merge_request.create -o "merge_request.title=${input_string}" origin "${branch_name}"
}

# k8s
alias k="kubectl"
alias kctx="kubectx"
alias kns="kubens"
alias tf="tofu"

# misc
alias gmv="go mod vendor"
alias magit='emacsclient -nw -a emacs -e "(magit-status \"$(git rev-parse --show-toplevel)\")"'
alias pass="gopass"

# vi mode
export KEYTIMEOUT=1

# vi binds in input mode
# bindkey '^r' fzf-history-widget
# bindkey '^n' ranger
bindkey '^d' delete-char
bindkey '^[^?' backward-kill-word
# bindkey '^[[5~' vi-up-line-or-history
# bindkey '^[[6~' vi-down-line-or-history
# bindkey '$key[Up]' vi-up-line-or-history
# bindkey '$key[Down]' vi-down-line-or-history
bindkey '^[OA' up-line-or-beginning-search
bindkey '^[OB' down-line-or-beginning-search
bindkey '^[[5~' up-line-or-beginning-search
bindkey '^[[6~' down-line-or-beginning-search
bindkey '$key[Up]' up-line-or-beginning-search
bindkey '$key[Down]' down-line-or-beginning-search
#bindkey '^[^d]' kill-word
#bindkey '^[^?' backward-kill-word
#bindkey '^q' beginning-of-line

# vi binds in normal mode
#bindkey -a '^r' fzf-history-widget
bindkey -a '^[^?' backward-kill-word
bindkey -a '_' beginning-of-line
bindkey -a '^q' beginning-of-line
bindkey -a '^e' end-of-line
#bindkey -a '^d' delete-char
#bindkey -a '^[^d]' kill-word
# bindkey -a '^[[5~' vi-up-line-or-history
# bindkey -a '^[[6~' vi-down-line-or-history
# bindkey -a '$key[Up]' vi-up-line-or-history
# bindkey -a '$key[Down]' vi-down-line-or-history
bindkey -a '^[OA' up-line-or-beginning-search
bindkey -a '^[OB' down-line-or-beginning-search
bindkey -a '^[[5~' up-line-or-beginning-search
bindkey -a '^[[6~' down-line-or-beginning-search
bindkey -a '$key[Up]' up-line-or-beginning-search
bindkey -a '$key[Down]' down-line-or-beginning-search

# Only init pyenv if it isn't already initialized.
# See https://github.com/pyenv/pyenv/issues/264#issuecomment-358490657
# if [ -n "$PYENV_LOADING" ]; then
#     true
# else
#     if which pyenv > /dev/null 2>&1; then
#         export PYENV_LOADING="true"
#         eval "$(pyenv init --path)"
#         eval "$(pyenv init -)"
#         eval "$(pyenv virtualenv-init -)"
#         unset PYENV_LOADING
#     fi
# fi

# export PYENV_ROOT="$HOME/.pyenv"
# command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"

complete -F __start_kubectl k

ZLE_RPROMPT_INDENT=0

# export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR"'/ssh-agent.socket'
eval "$(ssh-agent)" > /dev/null

function n
{
    # Block nesting of nnn in subshells
    if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi

    # The default behaviour is to cd on quit (nnn checks if NNN_TMPFILE is set)
    # To cd on quit only on ^G, remove the "export" as in:
    #     NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    # NOTE: NNN_TMPFILE is fixed, should not be modified
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    nnn "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}

# these were enabled before !!
_evalcache direnv hook zsh
_evalcache starship init zsh
_evalcache thefuck --alias
_evalcache fasd --init auto
# _evalcache gopass completion zsh
# _evalcache /usr/bin/s --completion zsh
# _evalcache /usr/bin/q --completion zsh


# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# preview directory's content with exa when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
zstyle ':fzf-tab:complete:cd:*' popup-pad 30 0
zstyle ':fzf-tab:complete:*' popup-pad 30 0
# render completions in a tmux popup
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
# bind tab / shift+tab to select or unselect multiple
zstyle ':fzf-tab:*' fzf-bindings 'Tab:toggle-in' 'shift-Tab:toggle-out'
# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'
# give a preview of commandline arguments when completing `kill`
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"
zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-preview \
  '[[ $group == "[process ID]" ]] && ps --pid=$word -o cmd --no-headers -w -w'
zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-flags --preview-window=down:3:wrap
zstyle ':fzf-tab:complete:systemctl-*:*' fzf-preview 'SYSTEMD_COLORS=1 systemctl status $word'
zstyle ':fzf-tab:complete:*:*' fzf-preview 'less ${(Q)realpath}'
export LESSOPEN='|~/.lessfilter %s'

export KALEIDOSCOPE_DIR=~/dev/Kaleidoscope
# Reload kubeconfig: put config files in ~/.kube/clusters/
# then run KUBECONFIG=$(find ~/.kube/clusters -type f | sed ':a;N;s/\n/:/;ba') kubectl config view --flatten > ~/.kube/config

export GOPRIVATE="github.com/formulatehq"

export DIRENV_LOG_FORMAT=

# replaced in ~/.config/zsh/21-completions.zsh -- what did I mean by that? this config is currently in both files
autoload -U +X bashcompinit && bashcompinit
autoload -Uz compinit && compinit

export TERRAGRUNT_NO_AUTO_APPROVE=true

# source ~/.config/environment.d/40-user.conf

# hyprctl in tmux needs special care to re-evaluate the env SOCK address
if [[ -n $TMUX ]]; then
  _fix_hyprsock_in_tmux () { if [[ ! -S $HYPRLAND_INSTANCE_SIGNATURE ]]; then eval export $(tmux show-env -g | rg HYPRLAND_INSTANCE_SIGNATURE); fi }
  hyprctl()   { _fix_hyprsock_in_tmux; command hyprctl $@; }
fi

complete -o nospace -C ~/.local/bin/terraform terraform

complete -o nospace -C /home/johan/go/bin/projectadmin projectadmin
source '/home/johan/.local/share/pop/shell_init/zsh/init.zsh' # added by pop

source '/home/johan/.config/zsh-secrets/env-vars'
export POP_PR_ASSIGNEE="fiskhest"
