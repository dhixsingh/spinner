# source <(curl -s url-to-spin.sh)
source $(dirname "$0")/spin.sh

spinon "Running a slow process now (grab a $_cuppa)"
sleep 2
spinoff
spinon "Doing something else (time is relative $_clock)"
sleep 2
spinoff
spinon "Last one (maybe catch a $_zzz)"
sleep 2
spinoff
echo "All done"
