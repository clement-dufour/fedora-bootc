FROM quay.io/fedora/fedora-bootc:43@sha256:4f23d1dc70a7ad2d78bb42a02c54c6dbf746c80b62d383db88311b980a22bd01
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
