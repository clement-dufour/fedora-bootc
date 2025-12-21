FROM quay.io/fedora/fedora-bootc:43@sha256:01a21cc4171eac91ef30b96a8af19ca97da1d868446e8ff596b23b9a0dcc794d
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
