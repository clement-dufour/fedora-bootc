FROM quay.io/fedora/fedora-bootc:43@sha256:47dd14fe954fd72932b76a218401034a1ec844973a800e3003b3f8835b98431a
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
