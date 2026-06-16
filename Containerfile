FROM quay.io/fedora/fedora-bootc:44@sha256:91dfff0aa0553dfb4d6d8381d459146a246aa290c5212f2350c20e99f46def4f
COPY image_files /

RUN \
    sed -i "/enabled=/s/1/0/" \
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
