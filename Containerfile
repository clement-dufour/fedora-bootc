FROM quay.io/fedora/fedora-bootc:43@sha256:b3c52385d22232719521b8e73374605610219465234f83de5207e5cfe90a521e
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
