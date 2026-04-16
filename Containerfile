FROM quay.io/fedora/fedora-bootc:43@sha256:a6a07202a02396796e1051a0c51adf67d70b45ec65de9028826d3715f729b526
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
