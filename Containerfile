FROM quay.io/fedora/fedora-bootc:43@sha256:4b07d0155fac4274c4a90c26f4b91c096d2a35d365877f6bd0412da6d99a7504
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
