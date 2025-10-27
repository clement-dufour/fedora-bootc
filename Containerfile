FROM quay.io/fedora/fedora-bootc:42@sha256:09fc42f1db6487dd47b773a852672d3a6977753ad8e8fb02a2b490af8cb6bf2d
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
