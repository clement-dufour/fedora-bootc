FROM quay.io/fedora/fedora-bootc:42@sha256:9ac597ccef7ba44ac92aefe39abee86b21d8674c23a4aaf6674525e57784a831
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
