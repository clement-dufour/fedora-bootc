FROM quay.io/fedora/fedora-bootc:43@sha256:597b9cb204a467088c470dbbfe632994d851b227470c00e845d4d773410abd46
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
