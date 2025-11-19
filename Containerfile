FROM quay.io/fedora/fedora-bootc:43@sha256:ca5b507b79d8b3818a2512a9e377b0f7bb0350e160d2b65fa2c2b6c199628615
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
