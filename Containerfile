FROM quay.io/fedora/fedora-bootc:43@sha256:0895074af6e9aba69fe9871dee2caf92b041f9e18af6b97dd6802a423630346a
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
