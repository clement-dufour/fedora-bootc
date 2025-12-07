FROM quay.io/fedora/fedora-bootc:43@sha256:bc0bd1d8b31daf870a32d3f9da45027ffac87d59d6d6115eaa082b7969d4c213
COPY image_files /

RUN \
    dnf install --assumeyes \
        qemu-guest-agent \
    && \
    dnf install --assumeyes \
        vim \
    && \
    dnf clean all && \
    systemctl preset-all && \
    rm -r /var/* && \
    bootc container lint
