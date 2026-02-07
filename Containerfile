FROM quay.io/fedora/fedora-bootc:43@sha256:eb84096b12976901d462fc5593e07260df6c28fdadad66711bfe408d6149eafb
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
