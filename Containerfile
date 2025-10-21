FROM quay.io/fedora/fedora-bootc:42@sha256:bc57fb3ccde404f622e3565bd73354ee80275bde21f05213f204e2c5735ac470
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
