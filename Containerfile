FROM quay.io/fedora/fedora-bootc:44@sha256:cf43a66c464a71c08f479a834716d54a94830001aecaef7e9e23d7c5ef1c4dfd
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
