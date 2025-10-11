FROM quay.io/fedora/fedora-bootc:44@sha256:7af809d6d0622a3e239ec819292a2569af6a7c684739d7e1f70a4f4e8c393e65
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
