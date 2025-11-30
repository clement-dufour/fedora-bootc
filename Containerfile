FROM quay.io/fedora/fedora-bootc:43@sha256:67fe0a41319175f1f31e0e249f00356b0c31fab6b0a0c4ca30083ebd615b00c4
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
