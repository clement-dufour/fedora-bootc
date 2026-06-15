FROM quay.io/fedora/fedora-bootc:44@sha256:5c8f1ddaaf5dbaf1c35b6221bdf0861cd23bbd70339e258666c14659d59a970b
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
