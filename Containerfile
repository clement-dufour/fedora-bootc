FROM quay.io/fedora/fedora-bootc:43@sha256:e9603198c12316fb7da5d2f46bdc7773d874a371848691ddf68072faeaf3b399
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
