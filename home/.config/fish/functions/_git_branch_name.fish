function _git_branch_name
    echo (git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/HEAD||')
end
    
