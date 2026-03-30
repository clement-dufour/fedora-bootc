FROM quay.io/fedora/fedora-bootc:43@sha256:7501277d4a79a0c0a32454a67d20da37f9d6f38cd1c5630a47cba82aa08864be
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
