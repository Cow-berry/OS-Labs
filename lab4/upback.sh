cd $HOME
last_backup=`ls */ -d | grep -E 'Backup-[0-9]{4}(-[0-9]{2}){2}/' | tail -n1`
for file in `ls $last_backup | grep -Ev '\.[0-9]{4}(-[0-9]{2}){2}'`
do
    cp $last_backup/$file restore/$file
done
