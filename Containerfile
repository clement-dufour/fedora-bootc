FROM quay.io/fedora/fedora-bootc:43@sha256:1bacf16cf77af93b064f6ff749c46a529249899e37c057ac64fc8fd238eb60ad
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
