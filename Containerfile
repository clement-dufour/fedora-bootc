FROM quay.io/fedora/fedora-bootc:43@sha256:a3b511b1b07443cb6ff98a9c4433ee37f829a48a4ae11aee636c97b89be36ff7
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
