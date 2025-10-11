FROM quay.io/fedora/fedora-bootc:42@sha256:64bd8a9b2c7cd88c86f3c8a9d67da14103bcb37e725e0c5a5ff0d90af674edc9
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
