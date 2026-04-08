FROM quay.io/fedora/fedora-bootc:43@sha256:9d7a12d886dd2a50589d141b3d71d5dad520b3e131680356dccd484bc171e03e
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
