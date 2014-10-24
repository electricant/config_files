#!/bin/bash -e
#

TEMP_FILE=""
RECIPIENT=""
SUBJECT="Daily log files"
LOG_SEPARATOR="******************************"
WELCOME_MSG="Good morning,\n\nThis is my current status."
#
# Initial greetings. How to get the ip address is taken from here:
# http://unix.stackexchange.com/questions/22615/how-can-i-get-my-external-ip-address-in-bash
echo -e "$WELCOME_MSG" >$TEMP_FILE
ip=$(dig +short myip.opendns.com @208.67.222.222)
echo The IP address is $ip. >>$TEMP_FILE
echo "" >>$TEMP_FILE
echo "$LOG_SEPARATOR" >>$TEMP_FILE
# uptime (just for an overview)
echo " uptime" >>$TEMP_FILE
echo "$LOG_SEPARATOR" >>$TEMP_FILE
uptime >>$TEMP_FILE
echo "" >>$TEMP_FILE
echo "$LOG_SEPARATOR" >>$TEMP_FILE
# auth.log
echo " auth.log (success only)" >>$TEMP_FILE
echo "$LOG_SEPARATOR" >>$TEMP_FILE
cat /var/log/auth.log.1 | grep -i 'accepted\|success*' >>$TEMP_FILE
echo "" >>$TEMP_FILE
echo "$LOG_SEPARATOR" >>$TEMP_FILE
# /proc/mdstat
echo " /proc/mdstat" >>$TEMP_FILE
echo "$LOG_SEPARATOR" >>$TEMP_FILE
cat /proc/mdstat >>$TEMP_FILE
echo "" >>$TEMP_FILE
echo "$LOG_SEPARATOR" >>$TEMP_FILE
# kernel log
echo " dmesg (important only)" >>$TEMP_FILE
echo "$LOG_SEPARATOR" >>$TEMP_FILE
dmesg -T -l err,crit,alert,emerg >>$TEMP_FILE
echo "" >>$TEMP_FILE
echo "$LOG_SEPARATOR" >>$TEMP_FILE
# memory
echo " Free memory" >>$TEMP_FILE
echo "$LOG_SEPARATOR" >>$TEMP_FILE
free -h >>$TEMP_FILE
echo "" >>$TEMP_FILE
echo "$LOG_SEPARATOR" >>$TEMP_FILE
# disk space
echo " Free disk space" >>$TEMP_FILE
echo "$LOG_SEPARATOR" >>$TEMP_FILE
df -h >>$TEMP_FILE
echo "" >>$TEMP_FILE
echo "$LOG_SEPARATOR" >>$TEMP_FILE
# possible updates
echo " Software updates" >>$TEMP_FILE
echo "$LOG_SEPARATOR" >>$TEMP_FILE
apt-get update
apt-get -s upgrade | grep upgraded, >>$TEMP_FILE
echo "" >>$TEMP_FILE
echo "$LOG_SEPARATOR" >>$TEMP_FILE
#
# send message
mail -s "$SUBJECT" "$RECIPIENT" <$TEMP_FILE

