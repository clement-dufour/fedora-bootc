FROM quay.io/fedora/fedora-bootc:43@sha256:8d040512aaecebd77a13cf301db0a131604f715b4f4eb1b22390e2d2b0031b98
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
