function k8s
	function k8s-usage
    echo "Must supply subcommand: use the tab, luke."
    functions -e k8s-usage
  end

  function k8s-ns
    switch (count $argv)
    case 0
      set -l ctx (kubectl config current-context)
      set -l filter ".contexts[] | select(.name == \"$ctx\") | .context.namespace"
      kubectl config view --output=json | jq $filter
    case 1
      set -l ctx (kubectl config current-context)
      kubectl config set-context $ctx --namespace $argv[1]
    end
    functions -e k8s-ns
  end

  function k8s-refresh
    if test (count $argv) -ne 1
      "must supply environment arg"
      return 1
    end
    mv ~/Downloads/kubectl-config "$HOME/.config/kubectl/$argv/config"
    functions -e k8s-refresh
  end

  function k8s-ctx
    switch (count $argv)
    case 0
      echo "Current context: $KUBECONFIG"
    case 1
      set -xU KUBECONFIG "$HOME/.config/kubectl/$argv/config"
    end
    functions -e k8s-ctx
  end

  function k8s-pf
    set -l usage 'k8s pf (start|stop)'
    switch (count $argv)
    case 1
      set -l pods 'customer-service' \
        'loyalty-program' \
        'membership-service' \
        'member-service' \
        'point-service' \
        'svc-transaction-adapter' \
        'svc-transaction-manager'

      switch $argv[1]
      case 'start'
        for pod in $pods
          systemctl --user start k8s-port-forward@$pod
        end
      case 'stop'
        for pod in $pods
          systemctl --user stop k8s-port-forward@$pod
        end
      case '*'
        echo $usage
      end
    case '*' 
      echo $usage
    end
    functions -e k8s-pf
  end 

  switch (count $argv)
  case 0
    eval k8s-usage
    return 1
  case 1
    eval "k8s-$argv"
  case '*'
    eval "k8s-$argv[1]" $argv[2..-1]
  end
end
