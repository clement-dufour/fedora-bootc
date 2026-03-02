FROM quay.io/fedora/fedora-bootc:43@sha256:37c9e4e3f7d79171a4018e811ed2e7be4247c5c532646694babbd8a1782f9fb2
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
