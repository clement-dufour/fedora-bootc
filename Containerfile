FROM quay.io/fedora/fedora-bootc:42@sha256:1f29f76082a6f370bf93f4b3104d210d9d05e6c17f621772c9a3c488a3e8080f
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
