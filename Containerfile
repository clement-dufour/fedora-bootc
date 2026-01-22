FROM quay.io/fedora/fedora-bootc:43@sha256:673848a0e9775f16fb059144122a9866ac8fa69599afe55b60c0ec2946384bb6
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
