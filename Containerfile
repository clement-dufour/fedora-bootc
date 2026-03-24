FROM quay.io/fedora/fedora-bootc:43@sha256:2b3ee1facb77753ad8afb33cd1049d2b7dfdbcb34ad9b590623ccb27924aab81
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
