FROM quay.io/fedora/fedora-bootc:43@sha256:ace08b5d98a6631aa183c86e22008c935f52f014df481bb3e1cf3558596df598
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
