FROM quay.io/fedora/fedora-bootc:42@sha256:718c2b2603d0f1c68dbefd867dc1c1c07e3e2515644221139218131e8f79743b
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
