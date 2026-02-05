FROM quay.io/fedora/fedora-bootc:43@sha256:78f3752ab00b00968fcc8d2f2e3e668f5553c350a9190a7d24c217f7c3fd373a
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
