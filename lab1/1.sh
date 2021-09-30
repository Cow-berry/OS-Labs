A=$(bc <<< "$1")
B=$(bc <<< "$2")
C=$(bc <<< "$3")

if [[ $(bc <<< "$A < $B") ]]
then 
    if [[ $(bc <<< "$B < $C") ]]
    then echo $C
    else echo $B
    fi
else 
    if [[ $(bc <<< "$C < $A") ]]
    then echo $A
    else echo $C
    fi
fi
