FROM registry.redhat.io/rhel9/support-tools:latest

LABEL com.github.containers.toolbox="true"

ENV LANG en_US.utf8

# RUN curl -ko /etc/pki/rpm-gpg/RPM-GPG-KEY-galaxy4 https://galaxy4.net/repo/RPM-GPG-KEY-galaxy4
# RUN yum install -y http://galaxy4.net/repo/galaxy4-release-9-current.noarch.rpm

RUN dnf update -y && dnf install -y \
  podman \
  skopeo \
  buildah \
	zsh \
	# zsh-autosuggestions \
	# zsh-syntax-highlighting \
	bc \
	# curl \
	dnsutils \
	git \
	gnupg \
	# htop \
	# iproute2 \
	jq \
	less \
	nmap \
	# powerline \
	rsync \
	# silversearcher-ag \
	sudo \
	tcpdump \
	# tmux \
	vim \
	wget \
	# yamllint \
  && dnf clean all

RUN mkdir -p /etc/zsh
ADD zshrc /etc/zsh/newuser.zshrc.recommended
ADD p10k.zsh /etc/zsh/p10k.zsh

ADD tmux.conf /etc

ADD install-openshift-clients /usr/local/bin

CMD [ "/usr/bin/zsh" ]
