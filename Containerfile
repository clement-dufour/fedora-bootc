FROM quay.io/fedora/fedora-bootc:43@sha256:1cda520c73b088be9c600e0ccefb903835fc23b6a7171d50a9335efb42b12ae3
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
