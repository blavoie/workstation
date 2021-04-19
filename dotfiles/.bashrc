# .bashrc

# Source global definitions

if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment

if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

###################################################################################################
#### VARIOUS
###################################################################################################

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.

#for file in ~/.{bash_prompt,aliases,tools,functions,path,dockerfunctions,extra,exports,ul}; do
for file in ~/.{aliases,tools,functions,path,dockerfunctions,extra,exports,ul}; do
    [[ -r "$file" ]] && [[ -f "$file" ]] && source "$file"
done
unset file

#### CHANGE DEFAULT EDITOR

export EDITOR=vi

#### CHANGE DEFAULT PAGER

if hash most 2>/dev/null
then
    export PAGER=most
fi

###################################################################################################
#### POWERLINE
###################################################################################################

if command -v powerline-daemon > /dev/null; then
  powerline-daemon -q
  POWERLINE_BASH_CONTINUATION=1
  POWERLINE_BASH_SELECT=1
  . /usr/share/powerline/bash/powerline.sh
fi

###################################################################################################
#### KUBERNETES
###################################################################################################

#### OPENSHIFT (OC CLIENT)

if hash oc 2>/dev/null
then
	source <(oc completion bash)
fi

#### MINIKUBE

if hash minikube 2>/dev/null
then
	source <(minikube completion bash)
fi

#### KUBECTL

if hash kubectl 2>/dev/null
then

    ### MINIMAL ALIAS AND COMPLETION

    source <(kubectl completion bash)
    alias k=kubectl
    complete -F __start_kubectl k

    ### ACTIVATE KREW, IF PRESENT

    [ -d ${HOME}/.krew/bin       ] && export PATH="${PATH}:${HOME}/.krew/bin"

    ### ACTIVATE FUBECTL, IF PRESENT

    [ -f ${HOME}/.fubectl.source ] && source ${HOME}/.fubectl.source

    ### DYNAMIC KUBECONFIG WHEN BROWSING DIRECTORIES

    export KUBECONFIG=.kubeconfig:.kube/config:~/.kube/config

    ### VARIOUS RECIPES

    ## Automatically decode a secret
    #k get secret my-secret -o go-template --template="{{.data.secretValue|base64decode}}"

    ## Explain resource types
    # k explain pod.spec.containers.resources.requests
    # k explain pod.spec.containers.resources.limits

    ### EXTRAS ALIASES

    # Also take a look at:
    #   - https://github.com/kubermatic/fubectl
    #   - https://github.com/ahmetb/kubectl-aliases
    #   - https://discuss.kubernetes.io/t/kubectl-tips-and-tricks/192

    #alias ka='kubectl apply '
    #alias kd='kubectl delete '
    #alias kdr='kubectl --dry-run=client -o yaml'
    #alias kbb='kubectl run busybox-test --image=busybox -it --rm --restart=Never --'
    #alias kdb='kubectl describe'
    #alias kl='kubectl logs'
    #alias ke='kubectl exec -it'  

fi

###################################################################################################
#### NODE.JS
###################################################################################################

# mkdir -p ~/.npm-global
# npm config set prefix '~/.npm-global' 2>/dev/null
#
# export PATH=~/.npm-global/bin:$PATH
# export NPM_CONFIG_PREFIX=~/.npm-global
