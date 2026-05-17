FROM quay.io/fedora/fedora-bootc:44@sha256:efcbfada8a0d0c48ce38785a232928a6f35ca38fa3027f7bcdde79dea88c1d18
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
