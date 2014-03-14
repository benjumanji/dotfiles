#prompt

function fish_prompt
    set_color blue
    echo -n (whoami)
    set_color yellow
    echo -n '@'
    set_color blue
    echo -n (hostname)
    echo -n ' '
    set_color cyan
    echo -n (prompt_pwd)
    if [ (_git_branch_name) ]
        set_color blue 
        echo -n ' ('
        set_color --bold red
        echo -n (_git_branch_name)
        set_color normal
        set_color blue
        echo -n ')'
    end
    echo ''
    set_color yellow
    echo -n '$ '
    set_color normal
end

