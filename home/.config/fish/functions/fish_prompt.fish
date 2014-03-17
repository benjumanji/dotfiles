#prompt

function fish_prompt
    set -l blue (set_color blue)
    set -l yellow (set_color yellow)
    set -l cyan (set_color cyan)
    set -l orange (set_color --bold red)
    set -l normal (set_color normal)

    set -l me $blue(whoami)
    set -l at $yellow@
    set -l host $blue(hostname | cut -d. -f1)
    printf "%s %s " $me$at$host $cyan(prompt_pwd)

    if [ (_git_branch_name) ]
        set -l git_branch $orange(_git_branch_name)$normal
        printf "%s%s%s " "$blue(" $git_branch "$blue)"
    end
    printf "%s\n\$ %s" $yellow $normal
end

