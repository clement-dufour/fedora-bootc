FROM quay.io/fedora/fedora-bootc:43@sha256:5c22db27e5e6a9bdebb5e63cb50fb1b2735663ca871ce75110e046c92913f96a
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
