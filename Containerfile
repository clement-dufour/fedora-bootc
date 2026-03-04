FROM quay.io/fedora/fedora-bootc:43@sha256:4df27c20cec3c0acb6e241e8b2913f8802acaabeed3bfb3d9c941eb748cb655a
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
