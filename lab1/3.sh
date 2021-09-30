cat << EOF
choose the option:
1) nano
2) vi
3) links
EOF
 
read CMD
case $CMD in
    1 ) nano;;
    2 ) vi;;
    3 ) links;;
    * ) echo "exiting the menu";;
esac
