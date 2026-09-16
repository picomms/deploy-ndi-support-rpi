FROM debian:bookworm-slim

ADD https://downloads.ndi.tv/SDK/NDI_SDK_Linux/Install_NDI_SDK_v6_Linux.tar.gz Install_NDI_SDK_v6_Linux.tar.gz
RUN tar -xf Install_NDI_SDK_v6_Linux.tar.gz \
    && chmod +x Install_NDI_SDK_v6_Linux.sh \
    && yes | PAGER=cat ./Install_NDI_SDK_v6_Linux.sh \
    && mv "NDI SDK for Linux" ndi-sdk \
    && rm -f Install_NDI_SDK_v6_Linux.tar.gz Install_NDI_SDK_v6_Linux.sh

EXPOSE 5959

CMD ["./ndi-sdk/bin/aarch64-rpi4-linux-gnueabi/ndi-discovery-server"]
