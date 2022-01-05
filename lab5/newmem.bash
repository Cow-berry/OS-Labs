sum=()
add=(1 2 3 4 5 6 7 8 9 10)
count=0

while true
do
    ((count+=10))
    sum+=(${add[@]})
    if (( count > $1 ))
    then
        exit 0
    fi 
done
