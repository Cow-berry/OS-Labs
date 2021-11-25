test -d ~/.trash || mkdir ~/.trash
test -f "$1" || echo "there is no file named '$1' in current directory"
NAME=$(echo `ls ~/.trash/` | awk '{print $NF + 1}')
mv "`pwd`/$1" ~/.trash/$NAME
echo $NAME `pwd`/"$1" >> ~/trash.log
