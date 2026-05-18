FROM quay.io/fedora/fedora-bootc:44@sha256:6da3de90148a7091053fa1e5fc7a0d92349348bde198d48d8d7e4c11fa73046e
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
