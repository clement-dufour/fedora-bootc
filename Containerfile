FROM quay.io/fedora/fedora-bootc:44@sha256:c6b268a602a5221d31c4e108076ca24efd214d0cc8ac11bb3163f7b0a45e1018
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
