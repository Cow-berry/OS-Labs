echo > report2.log
sum=()
add=(1 2 3 4 5 6 7 8 9 10)
count=0

while true
do
    ((count++))
    sum+=(${add[@]})
    if (( $count % 100000 == 0 ))
    then
        echo ${#sum[@]} >> report2.log
    fi 
done
