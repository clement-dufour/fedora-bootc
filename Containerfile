FROM quay.io/fedora/fedora-bootc:43@sha256:3de5c5ad2eaaecbe98fb5c56cd35e94908ce9d9df1b9eab0d6465e92c9c925ab
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
