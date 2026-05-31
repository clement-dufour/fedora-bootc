FROM quay.io/fedora/fedora-bootc:44@sha256:a364327aaf2b69a64493ddc6af73ae81300a37a0d59cafa9fb49c31344861053
COPY image_files /

RUN \
    sed -i "s/enabled=1/enabled=0/" \
        /etc/yum.repos.d/fedora-updates-archive.repo \
        /etc/yum.repos.d/fedora-cisco-openh264.repo \
    && \
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
