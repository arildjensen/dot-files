#!/bin/sh

#-----------------------------------------------------------------------
# Name.....: template_script.sh
# Code repo: github.com/arildjensen/dot-files
# Author...: Arild Jensen
# Purpose  : Serves as a sample or template script on which to build
# new bash scripts.

# Usage....: Run as user 'arild' with two arguments,
#            * first arg (e.g,. abc)
#            * second arg (e.g., xyz
#-----------------------------------------------------------------------


# Setup debugging functionality. If you want verbose output prepend the
# command with _DEBUG="on"

function DEBUG ()
{
  [ "$_DEBUG" == "on" ] && $@
}


# Setup standard functions to check for userid (useful if you need to
# run as root or other specific user) and for correct number of arguments.

function check_userid ()
{
  # Check userid is correct
  if [ "$(id -nu)" != $1 ]; then
    echo "This script must be run as $1" 1>&2
    exit 1
  fi
}

function check_arguments ()
{
  # Check correct number of arguments
  if [ $1 != 2 ]; then
    echo "Incorrect number of arguments: $0 [firstarg] [secondarg]" 1>&2
    exit 1
  fi
}

#-----------------------------------------------------------------------

function main ()
{
  FIRSTARG=$1
  SECONDARG=$2

  # Print out arguments
  echo "First argument was $FIRSTARG and the second was $SECONDARG."
  DEBUG echo "Debugging feature was enabled."

  exit 0 # Always exit properly
}

#-----------------------------------------------------------------------

check_userid "arild"
check_arguments $#
main $@
