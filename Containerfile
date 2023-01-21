FROM quay.io/toolbx-images/ubuntu-toolbox:22.10

LABEL com.github.containers.toolbox="true"

ENV LANG en_US.utf8

RUN apt-get update && apt-get install -y locales \
	&& localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8 \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y \
	bc \
	curl \
	dnsutils \
	git \
	gnupg \
	htop \
	iproute2 \
	jq \
	less \
	libvshadow-utils \
	libvte-common \
	nmap \
	powerline \
	rsync \
	silversearcher-ag \
	sudo \
	tcpdump \
	tmux \
	vim \
	wget \
	yamllint \
	zsh \
	zsh-autosuggestions \
	zsh-syntax-highlighting \
	&& rm -rf /var/lib/apt/lists/*

ADD p10k.zsh /etc/zsh
ADD tmux.conf /etc

ADD install-openshift-clients /usr/local/bin

COPY zshrc /etc/zsh/newuser.zshrc.recommended

ENTRYPOINT /usr/bin/zsh
