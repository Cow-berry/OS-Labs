NAME=`date +"%FT%T"`
mkdir ~/test && echo "catalog test was created successfully" > ~/report && touch ~/test/$NAME
ping www.net_nikogo.ru || echo $NAME " something went wrong while trying to ping www.net_nikogo.ru" > ~/report
