cat /etc/passwd | cut -d':' -f 1,3 --output-delimiter ' ' | sort -k2 -n
