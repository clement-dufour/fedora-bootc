FROM quay.io/fedora/fedora-bootc:43@sha256:2ff96b471ea1c29ea8d20bfe42c47b27a38c743da1579e42c25756eaacc06aa7
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
