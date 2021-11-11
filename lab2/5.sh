sppid=0
n=0
artsum=0
while read pid d1 ppid d2 art; do
    line=`echo $pid $d1 $ppid $d2 $art`
    ppid=`echo $ppid | tr -dc '0-9'`
    art=`echo $art | tr -dc '0-9.'`
    if [ $ppid -eq $sppid ]; then 
        ((n++))
        artsum=`echo "$artsum+$art" | bc`
    else
        if [ $n -ne 0 ]; then 
            echo $sppid $artsum $n | awk '{print "Average_Running_Children_of_ParentID=" $1 " is " $2/$3}'
        fi;
        ((n=1))
        artsum=`echo "$art" | bc`
        sppid=$ppid
    fi; 
    echo $line
    last=`echo $sppid $artsum $n | awk '{print "Average_Running_Children_of_ParentID=" $1 " is " $2/$3}'`;
done < 4.out;
echo $last
