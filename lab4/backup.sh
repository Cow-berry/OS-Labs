cd $HOME
now_date=`date '+%Y-%m-%d'`
now=`date '+%s' -d $now_date`
[[ `ls */ -d | grep -E 'Backup-[0-9]{4}(-[0-9]{2}){2}/' | sed -n 's/Backup-//p' | sed -n 's/\///p' | xargs -n1 date '+%s' -d | awk -v now=$now 'BEGIN{a=0}{if((now-$1)/86400 <= 7) {a=1}}END{print a}'` -eq 0 ]] && mkdir Backup-$now_date && cp -a source/. Backup-$now_date/ && echo 'New backup directory has been created at Backup-'$now_date'/ from '$now_date >> backup-report && echo 'list of copied files: '`ls source/` >> backup-report && exit 0
last_date=`ls */ -d | grep -E 'Backup-[0-9]{4}(-[0-9]{2}){2}/' | tail -n1 | sed -n 's/Backup-//p' | sed -n 's/\///p'`
last_folder="Backup-"$last_date"/"
backuped_files=""
new_files=""
for file in `ls source/`
do
    last_file=$last_folder$file
    if test -f $last_file
    then
        if ! [[ `stat -c%s source/$file` -eq `stat -c%s $last_file` ]]
        then
            mv $last_file $last_file.$now_date
            mv source/$file $last_file
            backuped_files=$backuped_files" "$file
        fi
    else
        cp source/$file $last_file
        new_files=$new_files" "$last_file
    fi
done
echo 'Updating the backup at Backup-'$now_date'/ from '$now_date >> backup-report && echo "list of "`echo $new_files | wc -w`" copied files: "$new_files >> backup-report && echo "list of "`echo $backuped_files | wc -w` "backuped files:" >> backup-report && echo $backuped_files | tr ' ' '\n' | awk -v date=$now_date '{if (length($1) != 0) {print $1 " " $1"."date}}' >> backup-report
