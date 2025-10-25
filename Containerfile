FROM quay.io/fedora/fedora-bootc:44@sha256:ef02d13db0a5f8df6cd987a421d9d86d869319763a04d4d775b80a19d82e1074
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
