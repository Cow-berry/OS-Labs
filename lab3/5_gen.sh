echo $$ > .pid

usr1()
{
    rm pipe
    exit 1
}
trap 'usr1' USR1
while true; do
    read LINE
    echo "$LINE" > pipe
done
