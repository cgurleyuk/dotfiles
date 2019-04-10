set -e

DOTFILES=$(pwd -P)

info () {
    printf "\r\033[39m [ \033[00;34mINFO\033[0m ] $1\n"
}

warn () {
    printf "\r\033[39m [ \033[00;35mWARN\033[0m ] $1\n"
}

success () {
    printf "\r\033[39m [ \033[00;32mDONE\033[0m ] $1\n"
}

fail () {
    printf "\r\033[39m [ \033[00;31mFAIL\033[0m ] $1\n"
}

bootstrap () {
    for dir in $(find -H "$DOTFILES" -maxdepth 1 -mindepth 1 -type d -not -path '*.git*')
    do
        info "In directory: $dir"
        if [ -f "$dir/bootstrap.sh" ]
        then
            info "Found bootstrap.sh"
        else
            bdir=$(basename $dir)
            for src in $(find -H "$bdir"  -not -path '*.git*' -type d | tail -n+2)
            do
                info "Found directory $src"
                srcs=$(echo $src | sed 's\^[^/]*/\\g')
                dst="$HOME/$srcs"
                if [ -d "$dst" ]
                then
                    info "Directory $dst already exists, skipping"
                else
                    mkdir $dst
                    success "Created directory $sdirdst"
                fi
            done

            for src in $(find -H "$bdir" -mindepth 1 -not -path '*.git*' -not -name 'bootstrap*' -type f)
            do
                local overwrite= backup= skip=
                local action=

                info "Found file $src"
                srcs=$(echo $src | sed 's\^[^/]*/\\g')
                dst="$HOME/$srcs"
                info "Linking to $dst"
                if [ -f "$dst" ]
                then
                    warn "File already exists $dst\n          [s]kip, [o]verwrite, [b]ackup"
                    read -n 1 action

                    case "$action" in
                        o )
                            overwrite=true;;
                        b )
                            backup=true;;
                        s )
                            skip=true;;
                        * )
                            ;;
                    esac

                    if [ "$overwrite" == "true" ]
                    then
                        rm -rf $dst
                        success "Removed $dst"
                    fi

                    if [ "$backup" == "true" ]
                    then
                        mv "$dst" "$dst.backup"
                        success "Moved $dst to $dst.backup"
                    fi

                    if [ "$skip" == "true" ]
                    then
                        success "Skipped $src"
                    else
                        ln -s "$DOTFILES/$src" "$dst"
                        success "Linked $DOTFILES/$src to $dst"
                    fi
		        else
		            ln -s "$DOTFILES/$src" "$dst"
		            success "Linked $src to $dst"
                fi
            done
        fi
    done
}

bootstrap
