FROM quay.io/fedora/fedora-bootc:43@sha256:150ca81a1065760720f146a3c5f332f4af1d9425df53bab909b4b70f32afa1ce
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
