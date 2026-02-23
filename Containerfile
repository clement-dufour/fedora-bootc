FROM quay.io/fedora/fedora-bootc:43@sha256:21465718e7096828b121708b23641bfd7c9e3c86575a45f0277d4acd4804bef4
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
