function fish_prompt
    set -l blue (set_color b3deef)
    set -l yellow (set_color ffc24b)
    set -l strong_blue (set_color 73cef4)
    set -l green (set_color c9d05c)
    set -l normal (set_color eeeeee)

    set -l me $blue(whoami)
    set -l at $yellow@
    set -l host $blue(hostname | cut -d. -f1)

    if set -q VIRTUAL_ENV
        set -l venv $normal(basename "$VIRTUAL_ENV")
        printf "%s[%s%s]" $blue $venv $blue
    end

    printf "%s %s " $me$at$host $strong_blue(prompt_pwd)

    if [ (_git_branch_name) ]
        set -l git_branch (_git_branch_name)
        printf "%s%s%s" $green $git_branch $normal
    end

    printf "%s\n\$ %s" $yellow $normal
end

