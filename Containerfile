FROM quay.io/fedora/fedora-bootc:43@sha256:9676a8ccfdc3dc20f13098c6879a00aaffaa59d460fde1f61c66ce2825f3505a
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
