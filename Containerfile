FROM quay.io/fedora/fedora-bootc:44@sha256:84cd89257642c597fdfacf315cb83078ff8536318dabe60042e0413ee4ea6b91
COPY image_files /

RUN \
    dnf install --assumeyes \
        qemu-guest-agent \
    && \
    dnf clean all && \
    systemctl preset-all && \
    rm -r /var/* && \
    bootc container lint
