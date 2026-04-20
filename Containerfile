FROM quay.io/fedora/fedora-bootc:43@sha256:1a55ab3fe3a8041dc1b0cb3459c407d44a9704b01ff507e9ed36e9407df29eff
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
