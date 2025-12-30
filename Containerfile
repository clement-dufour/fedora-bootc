FROM quay.io/fedora/fedora-bootc:43@sha256:46f6253e16c958d89fe3457a8e39572f9716af3769a504f2b978f6b79959fc8b
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
