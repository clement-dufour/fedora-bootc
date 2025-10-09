FROM quay.io/fedora/fedora-bootc:42@sha256:bd463eec6fc3a39e69ed81dfc9761f1e9edb4deb2ecbe0919ab3f438e94d6abe
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
