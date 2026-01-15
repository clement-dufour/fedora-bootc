FROM quay.io/fedora/fedora-bootc:43@sha256:854b56a9902b667ef7d3b93eee9b8cedffeddf1fb1e07e9334749882df2127fb
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
