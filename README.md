
# distrobox Usage

    distrobox create -i dharmabruce/base-shell -n shell --init-hooks "USER=$USER /usr/local/bin/install"

The `install` script will install OpenShift clients (`oc`, `ccoctl`, `opm`, `helm`).

# Container Build Instructions

This container supports multiple architectures, see the `buildah` script for details.

To build, run:

    ./buildah
