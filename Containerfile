FROM quay.io/fedora/fedora-bootc:43@sha256:a7e73d92d4c3d635ea66b9473ec531d6eed43fdeba83be7d32cf76b8dc7ec9e7
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
