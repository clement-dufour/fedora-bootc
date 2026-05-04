FROM quay.io/fedora/fedora-bootc:43@sha256:b571af96712ff930c5685e4e0a6b84ea578fbc5d73ca6c1c14107ee820176e57
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
