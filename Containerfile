FROM quay.io/fedora/fedora-bootc:43@sha256:0302deb1284ea191135377ffcb65e37d4f4322a7e1c66cb36b6a58305b8511b8
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
