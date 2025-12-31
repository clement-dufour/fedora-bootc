FROM quay.io/fedora/fedora-bootc:43@sha256:8cb009b5aec9f1c726bcc18e5218f11b38dbccecb71b36d0380cf74a90590b14
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
