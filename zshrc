
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

main() {
  configure_ohmyzsh
  configure_powerlevel10k
  configure_openshift_clients
  configure_tmux

  source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  source $ZSH/oh-my-zsh.sh
}

configure_ohmyzsh() {
  if [ ! -d "$HOME/.oh-my-zsh" ]
  then
    git clone https://github.com/ohmyzsh/ohmyzsh.git "$HOME/.oh-my-zsh"
  fi

  export ZSH="${HOME}/.oh-my-zsh"

  COMPLETION_WAITING_DOTS="true"

  HIST_STAMPS="yyyy-mm-dd"
  plugins+=(
    ag
    ansible
    encode64
    git
    httpie
    isodate
    nmap
    rsync
    urltools
    web-search
    z
    zsh-navigation-tools
  )
}

configure_powerlevel10k() {
  if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]
  then
      git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
  fi
  if [ ! -f "${HOME}/.p10k.zsh" ]
  then
    cp "/etc/zsh/p10k.zsh" "${HOME}/.p10k.zsh"
  fi
  source "${HOME}/.p10k.zsh"
  ZSH_THEME="powerlevel10k/powerlevel10k"
}

configure_openshift_clients() {
  if [ ! -e /usr/local/bin/oc ]
  then
    sudo /usr/local/bin/install-openshift-clients
  fi

  local tool
  for tool in podman oc helm
  do
    [ -f "/etc/zsh/zshrc.${tool}" ] && . "/etc/zsh/zshrc.${tool}"
  done

  alias kubectl=oc

  plugins+=(
    helm
    kubectl
    kubectx
    kube-ps1
    oc
  )

  yq() {
    podman run --rm -i -v "${PWD}":/workdir mikefarah/yq "$@"
  }
}

configure_tmux() {
  if [ ! -f "${HOME}/.tmux.conf" ]
  then
    cp "/etc/tmux.conf" "${HOME}/.tmux.conf"
  fi
  plugins+=(
    tmux
    tmux-cssh
    tmuxinator
  )
}

main
