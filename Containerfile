FROM quay.io/fedora/fedora-bootc:43@sha256:3a163c8ecd865539769d6c784a9dc482350a2397f47a26bab5f2cedbc4afb0b4
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
