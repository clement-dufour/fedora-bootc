FROM quay.io/fedora/fedora-bootc:43@sha256:a417faefe77fd874109d3408a2121e267f7cf67339c2b47a23ab3e22415fb770
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
