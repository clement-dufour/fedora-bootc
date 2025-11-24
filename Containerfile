FROM quay.io/fedora/fedora-bootc:43@sha256:365e294bae51e53047cf839fdd21896d06a9ab570e683e338511dc6ff58edc51
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
