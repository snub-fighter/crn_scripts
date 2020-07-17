
#!/bin/bash
sudo wget -O validators.txt https://raw.githubusercontent.com/casinocoin/casinocoind/master/doc/validators-example.txt
echo "BACKING UP ORIGINAL - NO FUBAR's ALLOWED"
cp -p /opt/casinocoind/etc/validators.txt /opt/casinocoind/etc/validators.txt.backup

echo "COPYING OVER NEW TEXT FILE"
cp -p  validators.txt  /opt/casinocoind/etc/

echo "RESTART CASINOCOIND.SERVICE"
systemctl restart casinocoind.service
echo "RESTARTED"
sleep 5

casinocoind server_state
