FROM quay.io/fedora/fedora-bootc:43@sha256:f1180d24dfaf50e316b23ea98e772f5f1a31c6a426f81f7d9c94782a2bbca2e5
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
