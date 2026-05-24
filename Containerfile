FROM quay.io/fedora/fedora-bootc:44@sha256:6620b77c782a1e4848bb9b7dad2fb37ea2b0502904cb2a41bb91801fb15fc4f5
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
