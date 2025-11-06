FROM quay.io/fedora/fedora-bootc:43@sha256:930f897721b986b7004eb8bf8b61ba5158959ab78abbc06deaf1917037dbc637
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
