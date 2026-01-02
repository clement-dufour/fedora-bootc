FROM quay.io/fedora/fedora-bootc:43@sha256:97748837871d9bef97a1787597b68839466677c81a4f2174be25d82143b1107a
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
