FROM quay.io/fedora/fedora-bootc:43@sha256:a58f53f75a6255fafedba144a0589b104047504669e9a49ac0e7375e2510b5d4
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
