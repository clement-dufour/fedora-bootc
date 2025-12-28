FROM quay.io/fedora/fedora-bootc:43@sha256:44b545cdee8fc84d7d946d183aee5a3ef940de9ff5ead0364947346451a0f0ea
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
