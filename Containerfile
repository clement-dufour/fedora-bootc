FROM quay.io/fedora/fedora-bootc:44@sha256:3a78e6986ef9585288243d74772853617e65fda7aec9e4a0c8bdef03f226e316
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
