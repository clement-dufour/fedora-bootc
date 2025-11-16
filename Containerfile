FROM quay.io/fedora/fedora-bootc:43@sha256:b33be5a830cd60dfe882fc6b5d33da15bb2ed34efff75807f6b03317a79d5166
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
