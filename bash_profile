# ~/.bash_profile: executed by bash(1) for login shells.
umask 022
RCSINIT=-zLT

if [ -f "$HOME/.bashrc" ] ; then
  source $HOME/.bashrc
fi

# Setup ssh-agent
SSH_ENV="$HOME/.ssh/environment"
function start_agent {
  echo "Initializing new SSH agent..."
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add;
  }

# Source SSH settings, if applicable
if [ -f "${SSH_ENV}" ]; then
  . "${SSH_ENV}" ;
  if [ ! -S "${SSH_AUTH_SOCK}" ]; then
    start_agent;
  fi
else
  start_agent;
fi

ssh-add -l
