FROM quay.io/fedora/fedora-bootc:43@sha256:1cfbf52f3fc967a6047a38e6fa81c5779439c4d821a5ff0f3265c53662886958
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
