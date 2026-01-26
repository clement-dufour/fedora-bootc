FROM quay.io/fedora/fedora-bootc:43@sha256:ecea65239eb896b14aa6cdaf9047dcde71f70fb31e3fad4bccf63703d2727259
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
