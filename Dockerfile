FROM debian:bullseye
LABEL maintainer="cslev <cslev@gmx.com>"

ENV DEPS tshark \
	     tcpdump \
         nano \
         tar \
         bzip2 \
         wget \
         curl \
         python3 \
         python3-scapy \
         iperf3 \
         iperf \
         net-tools \
         iputils-ping \
         arping \
         nmap \
         dnsutils \
         hping3 \
         ethtool \
<<<<<<< HEAD
         knot-dnsutils \
         htop
=======
	 iproute2 \
	iptables
>>>>>>> 95022e291d3eb253725992cda19fc621f82ff291

COPY bashrc_template /root/.bashrc
COPY sources.list /etc/apt/
SHELL ["/bin/bash", "-c"]
RUN apt-get update && \
    apt-get dist-upgrade && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends $DEPS && \
    apt-get autoremove --purge -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    source /root/.bashrc

WORKDIR /root
