FROM quay.io/fedora/fedora-bootc:43@sha256:2a34b44f9fba77cbbd456909a3b6ed60723b705be5d6bb64c57f3f4d618a6264
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
