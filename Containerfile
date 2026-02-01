FROM quay.io/fedora/fedora-bootc:43@sha256:0ac397fe034b9fe2dc6c92b25df29eb80f02092dad5117128ec141a1d6c91186
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
