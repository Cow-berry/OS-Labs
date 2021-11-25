IFS=$'\n'
cat ~/trash.log > .log
cat .log | awk '{print substr($0, index($0, $2), length($0) - index($0, $2) + 1)}' | sed 's!.*/!!' > .names
mappings=`paste .log .names | awk -F '\t' -v name=$1 '{if ($2 == name) {print $1}}'`
for mapping in $mappings
do
    num=`echo $mapping | awk '{print $1}'`
    file=`echo $mapping | awk '{$1="";print}' | xargs`
    echo -e -n "Do you want to restore" $file "\ny/n: "
    read line
    case $line in
        y)
            directory=`dirname "$file"`
            test -d $directory ||
                {
                echo "Can't find original folder, restoring to home"
                file=~/"$1"
            }
            test -f "$file" &&
                {
                while true
                do
                    read name
                    file=`dirname "$file"`"/$name"
                    test -f "$file" || break
                done
            }
            mv ~/.trash/$num "$file" && 
                {
                    cat ~/trash.log | awk -v num=$num '{if ($1 != num) {print}}' > ~/trash.log
            }
            exit 0
            ;;
        *)
            echo "noed"
            continue
            ;;
    esac
done
