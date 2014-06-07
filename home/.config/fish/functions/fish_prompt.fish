function fish_prompt
    set -l blue (set_color blue)
    set -l yellow (set_color yellow)
    set -l cyan (set_color cyan)
    set -l red (set_color red)
    set -l normal (set_color normal)

    set -l me $blue(whoami)
    set -l at $yellow@
    set -l host $blue(hostname | cut -d. -f1)

    if set -q VIRTUAL_ENV
        set -l venv $normal(basename "$VIRTUAL_ENV")
        printf "%s[%s%s]" $blue $venv $blue
    end
    
    printf "%s %s " $me$at$host $cyan(prompt_pwd)

    if [ (_git_branch_name) ]
        set -l git_branch $red(_git_branch_name)$normal
        printf "%s(%s%s) " $blue $git_branch $blue
    end

    printf "%s\n\$ %s" $yellow $normal
end

