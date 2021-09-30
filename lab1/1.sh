if [[ $1 -le $2 ]]
then 
    if [[ $2 -le $3 ]]
    then echo $3
    else echo $2
    fi
else 
    if [[ $3 -le $1 ]]
    then echo $1
    else echo $3
    fi
fi
