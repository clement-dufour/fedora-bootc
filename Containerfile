FROM quay.io/fedora/fedora-bootc:43@sha256:523fc801361ccb2e4b195cca9d2c8607b90fdb7a65f364253cb746e2b43258e4
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
