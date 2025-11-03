FROM quay.io/fedora/fedora-bootc:43@sha256:31b4c553f6a598d7b630469f39e60183c3f49e6a1b112ed8d89ff3b2b9d1b776
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
