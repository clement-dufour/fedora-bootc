FROM quay.io/fedora/fedora-bootc:43@sha256:703d6e5dc0b0a2d5e4d2642b9c6d34b4432a62f7a009dfb9474eaa4ad5c1a9ba
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
