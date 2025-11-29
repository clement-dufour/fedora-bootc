FROM quay.io/fedora/fedora-bootc:43@sha256:4f2f906870a017483c09c0e965072863ce6e7d281cd249d52822cae785179d41
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
