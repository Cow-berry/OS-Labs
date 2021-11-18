CUR=1
MODE="+"
(tail -f pipe) |
    while true; do
		echo $CUR "$MODE"
		read LINE
		if [[ $LINE == "QUIT" ]]
		then
            echo "app stopped by user"
            kill -p $(cat .pid)
            exit 0
        elif [[ $LINE == "+" ]] || [[ "$LINE" == "*" ]]
        then
            MODE="$LINE"
        elif [[ -n "$LINE" ]]
        then
            CUR=$(echo $CUR "$MODE" "$LINE" | bc)
        else
            echo "wrong input"
            kill -USR1 $(cat .pid)
            exit 1
        fi
	done
