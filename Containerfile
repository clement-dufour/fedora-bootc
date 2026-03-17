FROM quay.io/fedora/fedora-bootc:43@sha256:727936e425f6cbebd94756c5e76501445392ebca9c50bdaa754738aa0fec5de1
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
