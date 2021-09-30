if [ $(pwd) != $HOME ]
then
    echo "not in the home directory"
    exit 1
fi
echo $HOME
