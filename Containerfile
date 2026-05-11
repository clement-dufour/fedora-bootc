FROM quay.io/fedora/fedora-bootc:44@sha256:7808df8be42453623448669e80e762adfe2ff6d74b26505d610d16acfadb6b98
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
