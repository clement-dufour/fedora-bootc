FROM quay.io/fedora/fedora-bootc:43@sha256:0d1104e5db767dc1d67cf0c6f36533075481d9788cb8edc153431e46a4411888
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
