FROM quay.io/fedora/fedora-bootc:43@sha256:0d51a83a1e1c6a2302bf746a5743f6d15c023115912548c4ce642c2a428da190
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
