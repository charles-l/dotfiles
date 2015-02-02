pb () {
    curl -F "c=@${1:--}" https://ptpb.pw
}

sshhosts() {
    cat /Users/ninjacharlie/.ssh/known_hosts | sed 's/[, ].*//g'
}

scratch() {
    cur_dir="$HOME/scratch"
    new_dir="$HOME/tmp/scratch-`date +'%s'`"
    mkdir -p $new_dir
    ln -nfs $new_dir $cur_dir
    cd $cur_dir
    echo "New scratch dir ready for grinding ;>"
}
