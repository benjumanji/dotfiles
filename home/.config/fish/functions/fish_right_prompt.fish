function fish_right_prompt
    set -l normal (set_color normal)
    set -l blue (set_color blue)
    set -l t $blue(date +'%H:%M:%S')
    printf "%s[%s%s]" $normal $t $normal
end

