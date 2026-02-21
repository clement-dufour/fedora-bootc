FROM quay.io/fedora/fedora-bootc:43@sha256:dd6c2f7680f0f1125e4a7b04ca1ac23a3ff7a2df97d5c93fd5d6cc9198628312
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
