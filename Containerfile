FROM quay.io/fedora/fedora-bootc:43@sha256:dca83fb0b030b529394a129e82f0f75913d0b21f9da304b7ac048b1f12e48932
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
