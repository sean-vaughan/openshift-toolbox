FROM --platform=linux/amd64 docker.io/library/ubuntu:22.10
FROM --platform=linux/arm64 docker.io/arm64v8/ubuntu:22.10

LABEL com.github.containers.toolbox="true"

RUN apt-get update && apt-get install -y locales zsh tmux htop git powerline dnsutils \
  curl iproute2 tcpdump buildah rsync sudo diffutils less bc procps libvshadow-utils \
	util-linux libvte-common wget vim \
	&& localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8

RUN apt clean all
RUN rm -rf /var/lib/apt/lists/*


ENV CONF /usr/local/share/base-shell
RUN mkdir "${CONF}"

COPY zshrc "${CONF}/zshrc"
COPY powerlevel10k "${CONF}/powerlevel10k"
COPY p10k.zsh "${CONF}"
COPY tmux.conf "${CONF}"


ADD install-openshift-clients /usr/local/bin
ADD install /usr/local/bin


ENTRYPOINT /usr/local/bin/install
