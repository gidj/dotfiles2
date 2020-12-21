fif() {
    if [ ! "$#" -gt 1 ]; then echo "Need a string to search for!"; return 1; fi
    rg --files-with-matches --no-messages $1 | fzf --preview "highlight -O ansi -l {} 2> /dev/null | rg --colors 'match:bg:yellow' --ignore-case --pretty --context 10 $1 || rg --ignore-case --pretty --context 10 $1 {}"
}


brewamazon() {
    TAP=amazon/homebrew-amazon; \
        TAP_PREFIX=$(brew --prefix)/Homebrew/Library/Taps; \
        ls $TAP_PREFIX/$TAP/Formula/*.rb 2>/dev/null || ls $TAP_PREFIX/$TAP/*.rb 2>/dev/null | \
        xargs -I{} basename {} .rbI
}

vimpy () {
	PYTHONPATH="$VIRTUAL_ENV/lib/python3.7/site-packages/:$PYTHONPATH" vim $*
}
