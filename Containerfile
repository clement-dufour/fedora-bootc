FROM quay.io/fedora/fedora-bootc:42@sha256:e9f1e9659ea921ea6527861bf1f3f8d60332bd04dbcb9aaaaadcedb00beedc0d
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
