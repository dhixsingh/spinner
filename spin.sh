#!/usr/bin/env bash

trap "exit" INT TERM; trap "kill 0" EXIT # https://stackoverflow.com/a/22644006
_spin_pid=""
# handy symbols
_cuppa="\\xe2\\x98\\x95"
_clock="\\xe2\\x8f\\xb0"
_zzz="\\xf0\\x9f\\x92\\xa4"
_tick="\\xe2\\x9c\\x94"
_spin()
{
  # move to start of line, add 2 spaces, print the message, then back to start
  echo -ne "\033[50D  $1 \033[50D"
  # quarter blocks
  # symbols=(\\xe2\\x96\\x96 \\xe2\\x96\\x98 \\xe2\\x96\\x9D \\xe2\\x96\\x97)
  # half moons
  symbols=(\\xe2\\x97\\x90 \\xe2\\x97\\x93 \\xe2\\x97\\x91 \\xe2\\x97\\x92)
  while : ; do # do this forever
    for i in `seq 0 3` ; do # loop through the array indicies
      echo -en "${symbols[$i]}\010" # echo the symbol then move back one char
      sleep 0.5 # don't be a hog
    done
  done
}
spinon() {
  # hide the cursor while the spinner is spinning
  tput civis
  _spin "$1" & # start spinning
  _spin_pid=$! # and note the pid
}
spinoff() {
  kill -9 $_spin_pid 2>/dev/null # kill the spinner
  wait $_spin_pid 2>/dev/null # wait for it to die
  echo -e "$_tick" # and echo the tick symbol
  tput cnorm # put the cursor back to normal
}
