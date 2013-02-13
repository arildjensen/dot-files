# ~/.bash_profile: executed by bash(1) for login shells.
umask 022
RCSINIT=-zLT

if [ -f "$HOME/.bashrc" ] ; then
  source $HOME/.bashrc
fi
