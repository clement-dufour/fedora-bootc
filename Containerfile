FROM quay.io/fedora/fedora-bootc:44@sha256:06646dc9e022dc2a67590163f485956defafde8bf4982c3a8142ffbfd17d0707
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
