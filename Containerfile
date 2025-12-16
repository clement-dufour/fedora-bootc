FROM quay.io/fedora/fedora-bootc:43@sha256:89182a4b3186bdaee396c882f4ddc313a1519361922ebb0f959483fa5e0d24b5
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
