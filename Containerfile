FROM quay.io/fedora/fedora-bootc:43@sha256:b9738217ef6fe1096e77d398c1dd2f7f2083b8c3d331886048d8d8a0a35b4e47
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
