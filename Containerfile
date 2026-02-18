FROM quay.io/fedora/fedora-bootc:43@sha256:ce4a35b03ff7154a98e45cc3bf444b21d0df373d9c610596c9e9c58e11c4a8ad
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
