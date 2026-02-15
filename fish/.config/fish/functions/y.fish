function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if test -s "$tmp"
        cd (cat "$tmp")
    end
    rm -f -- "$tmp"
end
