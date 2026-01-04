FROM quay.io/fedora/fedora-bootc:43@sha256:2ba20111a7fda1475dc5e004914a65bbdacc47a91f7db6ddea07e9dfaaed2f08
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
