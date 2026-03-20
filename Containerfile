FROM quay.io/fedora/fedora-bootc:43@sha256:d4a6bc793947b4e9823957542e38c1caa9f6acb8bb88aa396d9ec88f11349165
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
