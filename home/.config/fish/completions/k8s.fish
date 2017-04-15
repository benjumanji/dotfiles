function __fish_k8s_needs_command
  set cmd (commandline -opc)
  if [ (count $cmd) -eq 1 -a $cmd[1] = 'k8s' ]
    return 0
  end
  return 1
end

function __fish_k8s_using_command
  set cmd (commandline -opc)
  if [ (count $cmd) -gt 1 ]
    if [ $argv[1] = $cmd[2] ]
      return 0
    end
  end
  return 1
end

set -l cmds refresh switch

# completion for top level commands
complete -f -c k8s -n "__fish_k8s_needs_command" -a "$cmds ns"

# completion for namespaces
complete -f -c k8s \
  -n "__fish_k8s_using_command ns" \
  -a (echo (kubectl get ns --output=json | jq '.items[].metadata.name'))

# completion for commands ending with an env
for cmd in $cmds
  complete -f -c k8s -n "__fish_k8s_using_command $cmd" -a 'dev00 sbx1'
end

