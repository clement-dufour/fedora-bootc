FROM quay.io/fedora/fedora-bootc:42@sha256:9c46ecfcfed3efd81a91e65aa4351723940e9b42a4ba6b4fe020f4d7020c2bd2
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
