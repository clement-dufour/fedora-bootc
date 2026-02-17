FROM quay.io/fedora/fedora-bootc:43@sha256:359522c261b93edd4ab2d22a817a9b94221c1b1d923eea2b52eac12a0a01263a
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
