FROM quay.io/fedora/fedora-bootc:43@sha256:c39d291ba6282b72617c9277efe66ea65d83efbedd74cb559526f64ea6c3d39e
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
