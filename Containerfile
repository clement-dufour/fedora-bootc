FROM quay.io/fedora/fedora-bootc:43@sha256:ace3272fea6432880e873f28aac41b509bda7d9bd6267bfa7e807e1b2f7220ca
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
