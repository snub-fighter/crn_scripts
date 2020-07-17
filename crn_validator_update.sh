
#!/bin/bash
set -e
sudo wget -O validators.txt https://raw.githubusercontent.com/casinocoin/casinocoind/master/doc/validators-example.txt
echo "BACKING UP ORIGINAL - NO FUBAR's ALLOWED"
cp -p /opt/casinocoind/etc/validators.txt /opt/casinocoind/etc/validators.txt.backup

echo "COPYING OVER NEW TEXT FILE"
cp -p  validators.txt  /opt/casinocoind/etc/

echo "RESTART CASINOCOIND.SERVICE"
systemctl restart casinocoind.service
echo "RESTARTED"
echo "THAT WAS HARD WORK...  NEED A CAT NAT"
echo -e '
 |\__/,|   (`\
 |_ _  |.--.) )
 ( T   )     /
(((^_(((/(((_/'

sleep 3
echo "CHECKING CASINCOIND SERVER_STATE - 9 SECS"
sleep 9

casinocoind server_state
echo "PROPOSERS"
casinocoind server_state | grep proposers
