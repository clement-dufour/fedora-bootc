FROM quay.io/fedora/fedora-bootc:43@sha256:8227be40103bdd35ca6b6a9449814e8b38ba04f3d3b0856c076a4becaa63d68d
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
