FROM quay.io/fedora/fedora-bootc:43@sha256:0b15a6a2640898436a29cbed3e923977349e1e38af632b34e8d70e032f1cf467
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
