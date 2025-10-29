FROM quay.io/fedora/fedora-bootc:43@sha256:abed0a54d97da456a3d62ee7399595b6016bbeebf9fe78fba851a4586822b313
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
