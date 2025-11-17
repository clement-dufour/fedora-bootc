FROM quay.io/fedora/fedora-bootc:43@sha256:5ebb61b021ce5c9d16dde6c1b58c606d8ef90bd43315059a84b75b5097476496
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
