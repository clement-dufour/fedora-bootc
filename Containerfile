FROM quay.io/fedora/fedora-bootc:42@sha256:041ebfe35df478936f84956ec3c5c9a3bde3edb05b6342829fdcffd8e29140cc
COPY image_files /

RUN \
    dnf install --assumeyes \
        qemu-guest-agent \
    && \
    dnf clean all && \
    systemctl preset-all && \
    rm -r /var/* && \
    bootc container lint
