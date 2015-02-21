pb () {
    curl -F "c=@${1:--}" https://ptpb.pw
}

sshhosts() {
    cat /Users/ninjacharlie/.ssh/known_hosts | sed 's/[, ].*//g'
}

scratch() {
    new_dir="/tmp/scratch-`date +'%s'`"
    mkdir -p $new_dir
    cd $new_dir
    echo "New scratch dir ready"
}
