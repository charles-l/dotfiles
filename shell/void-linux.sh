pkg() {
        c=$1
        shift 1
        case "$c" in
                info)
                        sudo xbps-query -Rs "$@" ;;
                *)
                        sudo xbps-$c "$@";;
        esac
}
