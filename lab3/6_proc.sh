echo $$ > .pid
A=1
usr1()

    ((A+=2))

usr2()

    ((A*=2))

sigterm() {
    echo "terminated by user"
    exit 0;
}

trap 'usr1' USR1
trap 'usr2' USR2
trap 'sigterm' SIGTERM
while true; do
    echo $A
    sleep 1
done
