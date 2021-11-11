sha1sum /dev/zero &
FIRST_PID=$!
sha1sum /dev/zero &
sha1sum /dev/zero &

cpulimit -l 10 -p $FIRST_PID -b
