FROM quay.io/fedora/fedora-bootc:43@sha256:93c7f7852c0264340232a921ebe4f4011c30f7578cc8f29f28a52766402e9dc7
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
