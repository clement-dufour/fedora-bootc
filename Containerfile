FROM quay.io/fedora/fedora-bootc:43@sha256:74e1ea3d4bb1b4dd9e364d13c2ec4ee465289ba6d373dd2f39f959644e833354
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
