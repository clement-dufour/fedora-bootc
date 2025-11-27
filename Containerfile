FROM quay.io/fedora/fedora-bootc:43@sha256:03bc05afb5642aa1193c34b1a7a8fe78537106b93fe0f70e3bc674dfd5b257ac
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
