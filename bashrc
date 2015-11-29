# ~/.bashrc : executed by bash(1) for non-login shells.

GPG_TTY='tty'
EDITOR='vim'
TERM='xterm-color'
LS_COLORS='no=00:fi=00:di=01;37:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.flac=01;35:*.mp3=01;35:*.mpc=01;35:*.ogg=01;35:*.wav=01;35';
PATH=$PATH:$HOME/bin
export GPG_TTY EDITOR TERM LS_COLORS PATH

## SETUP ALIASES AND CUSTOM COMMANDS
####################################

alias ssh='ssh -Aq'
alias ipsort='sort -t . -k 1,1n -k 2,2n -k 3,3n -k 4,4n' # sort IP addr

if $(which -s gls); then
  alias ls='gls --color=auto'
else 
  alias ls='ls --color=auto'
fi

if [ -x $HOME/bin/vim ]; then
  alias e="$HOME/bin/vim"
else
  alias e='vim'
fi

#dirsize - finds directory sizes and lists them for the current directory
dirsize () {
  du -shx * .[a-zA-Z0-9_]* 2> /dev/null | \
  egrep '^ *[0-9.]*[MG]' | sort -n > /tmp/$USER.list
  egrep '^ *[0-9.]*M' /tmp/$USER.list
  egrep '^ *[0-9.]*G' /tmp/$USER.list
  rm -rf /tmp/$USER.list
}

## LOCATION SPECIFIC LOGIC
##########################

# Find out whether we're at work or at home
location='athome'
if [ -f /etc/resolv.conf ]; then
  egrep -q 'upwork\.com$|odesk\.com$' /etc/resolv.conf
  if [ $? -eq 0 ]; then
    location='atwork'
  fi
fi

# Hack the hostname. Pretend it's 'batcave' if it's my work laptop
shopt -s nocasematch
if [[ "$HOSTNAME" =~ ^Arild(.*)local$ ]]; then
  machine='batcave'
else
  machine=$HOSTNAME
fi

## SECURITY SPECIFIC LOGIC
##########################

# Read in secrets
if [ -f $HOME/.bash_secrets ]; then
  source $HOME/.bash_secrets
fi

# Setup GPG agent to manage secret keys
if $(which -s gpg-agent); then
  gpg-agent --daemon \
            --log-file "$HOME/logs/gpg-agent.log" \
            --pinentry-program "/usr/local/bin/pinentry" \
            --disable-scdaemon \
            --write-env-file "$HOME/.gpg-agent-info"
fi
if [ -f "$HOME/.gpg-agent-info" ]; then
  . "$HOME/.gpg-agent-info"
  export GPG_AGENT_INFO
fi


## CODE SPECIFIC LOGIC
######################

# Configure Git
git config --global core.autocrlt input
git config --global user.name "Arild Jensen"
case ${location} in
  athome)
    git config --global user.email ajensen@counter-attack.com
    ;;
  atwork)
    git config --global user.email arildjensen@upwork.com
    ;;
esac

function git_branch {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return;
  echo "("${ref#refs/heads/}") ";
}

## LOGGING
##########

# Setup log directory, which we'll use later
if [ ! -d "$HOME/logs" ]; then
  mkdir "$HOME/logs"
fi

# Log output when using tmux. Modified code from:
# http://jovimo.blogspot.com/2013/03/tmux-screen-logging-workaround.html
if [[ $(ps -p $PPID -o comm=) = "tmux" ]]; then
  logname="$(date '+%Y-%m-%dT%H%M%S').tmux.log"
  script -f $HOME/logs/${logname}
  exit
fi

## MISCELLANEOUS
################

# Configure command prompt.

# Define colors
# Reset
Color_Off='\e[0m'       # Text Reset

# Regular Colors
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White

# Bold
BBlack='\e[1;30m'       # Black
BRed='\e[1;31m'         # Red
BGreen='\e[1;32m'       # Green
BYellow='\e[1;33m'      # Yellow
BBlue='\e[1;34m'        # Blue
BPurple='\e[1;35m'      # Purple
BCyan='\e[1;36m'        # Cyan
BWhite='\e[1;37m'       # White

# Underline
UBlack='\e[4;30m'       # Black
URed='\e[4;31m'         # Red
UGreen='\e[4;32m'       # Green
UYellow='\e[4;33m'      # Yellow
UBlue='\e[4;34m'        # Blue
UPurple='\e[4;35m'      # Purple
UCyan='\e[4;36m'        # Cyan
UWhite='\e[4;37m'       # White

# Background
On_Black='\e[40m'       # Black
On_Red='\e[41m'         # Red
On_Green='\e[42m'       # Green
On_Yellow='\e[43m'      # Yellow
On_Blue='\e[44m'        # Blue
On_Purple='\e[45m'      # Purple
On_Cyan='\e[46m'        # Cyan
On_White='\e[47m'       # White

# High Intensity
IBlack='\e[0;90m'       # Black
IRed='\e[0;91m'         # Red
IGreen='\e[0;92m'       # Green
IYellow='\e[0;93m'      # Yellow
IBlue='\e[0;94m'        # Blue
IPurple='\e[0;95m'      # Purple
ICyan='\e[0;96m'        # Cyan
IWhite='\e[0;97m'       # White

# Bold High Intensity
BIBlack='\e[1;90m'      # Black
BIRed='\e[1;91m'        # Red
BIGreen='\e[1;92m'      # Green
BIYellow='\e[1;93m'     # Yellow
BIBlue='\e[1;94m'       # Blue
BIPurple='\e[1;95m'     # Purple
BICyan='\e[1;96m'       # Cyan
BIWhite='\e[1;97m'      # White

# High Intensity backgrounds
On_IBlack='\e[0;100m'   # Black
On_IRed='\e[0;101m'     # Red
On_IGreen='\e[0;102m'   # Green
On_IYellow='\e[0;103m'  # Yellow
On_IBlue='\e[0;104m'    # Blue
On_IPurple='\e[0;105m'  # Purple
On_ICyan='\e[0;106m'    # Cyan
On_IWhite='\e[0;107m'   # White



if [[ $EUID == 0 ]] ; then
  PS1=" \[$BRed\]\u\[$White\]@\[$Green\]${machine}\[$White\]:\[$UGreen\]\w #\[$Color_Off\] "
else
  PS1=" \[$IBlue\]\u\[$White\]@\[$Green\]${machine}\[$White\]:\[$UGreen\w\[$Yellow\] \$(git_branch)\$ \[$Color_Off\]"
fi

# Output welcome message
echo -e "\n### Git global settings ###"
git config --global -l
echo -e "\n### SSH loaded keys ###"
ssh-add -l
echo -e "\nWelcome to ${machine}!"
