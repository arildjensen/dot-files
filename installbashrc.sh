#!/bin/bash

if [  == 'Linux' ]; then
  echo Linux
  install bashrc-linux    ~/.bashrc
  echo "source .bashrc" > ~/.bash_profile
elif [  == 'Darwin' ]; then 
  echo osx
  install bashrc-osx     ~/.bashrc
  echo "source .bashrc" > ~/.bash_profile
else
  echo "I don't know what OS this is. Exiting"
  exit 1
fi
