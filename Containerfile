FROM quay.io/fedora/fedora-bootc:43@sha256:48cdcca3dd6be39e1f077e714dc5a82d1f32af35bb63886b4895af87880f8e87
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
