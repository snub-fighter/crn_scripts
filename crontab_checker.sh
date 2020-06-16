
#!/bin/bash
uservar=$(logname)
echo  "$uservar is running this script"

cron_csc="0 0 * * * certbot renew --deploy-hook /home/$uservar/deployhook.sh >> /home/$uservar/ssl.log && date >> /home/$uservar/ssl.log"

FILE=$(crontab -u $uservar -l | grep -v -e "#" -e '^$')

if [[ "$cron_csc" == "$FILE" ]]
then
  echo "CRONTAB APPEARS TO HAVE BEEN ENTERED AS EXPECTED WITH $uservar"
else


  echo "OUTPUT DOESNT MATCH AS EXPECTED - COMPARE BELOW OUTPUT"
  echo " EXPECTED "
  echo "$cron_csc"
  echo " FOUND "
  echo "$FILE"
  read -p 'Would you like me to fix it? [Y]' permission
  permission=${permission:-Y}
  permission=${permission^^}
  if [ "$permission" = "Y" ]; then
        echo "Adding Now"
        (crontab -u $uservar -l; echo "$cron_csc" ) | crontab -u $uservar -
        echo " COMPLETE "
        echo "crontab -u $uservar -l"
        CRONCHECK=$(crontab -u $uservar -l)
        echo $CRONCHECK
  fi
fi
