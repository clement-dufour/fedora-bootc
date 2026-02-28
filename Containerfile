FROM quay.io/fedora/fedora-bootc:43@sha256:5dc10b6a6773a5a6ec46f84d2bd2e859a13dfc1126b2b26899b03a5782cf78f9
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
