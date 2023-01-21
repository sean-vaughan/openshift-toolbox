
# distrobox Usage

    distrobox create -i dharmabruce/base-shell -n shell
    # If you don't already have ~/.zshrc file choose 2 for the default

The `/etc/zsh/newuser.zshrc.recommended` zshrc file provides oh-my-zsh,
powerlevel10k, a powerline `tmux.conf` configuration file, and will call
`/usr/local/bin/install-openshift-clients` to download openshift clients. If you
don't install it as your `~/.zshrc` file, add `source
/etc/zsh/newuser.zshrc.recommended` to your `~/.zshrc` file, or select snippiets
to add to your zshrc.

# Container Build Instructions

This container supports amd64 and arm64 architectures, see the `buildah` script
for details.

To build, run:

    ./buildah
