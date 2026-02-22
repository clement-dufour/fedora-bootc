FROM quay.io/fedora/fedora-bootc:43@sha256:5d3aad70fb43232e2de3de921c2af2beda1800ff16e440369ac1b87f60c86ac9
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
