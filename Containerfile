FROM quay.io/fedora/fedora-bootc:43@sha256:c3f57ab359112832deb3ac6ac1e9930724843c3cd7fbf169b312d7a92839b817
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
