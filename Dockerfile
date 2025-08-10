FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    git \
    wget \
    curl \
    unzip \
    ca-certificates \
    python3 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# install latex etc.
COPY install.sh /install.sh
RUN chmod +x install.sh && \
    /install.sh && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /work

COPY build_in_container.sh /work/build_in_container.sh
RUN chmod +x /work/build_in_container.sh

CMD ["/work/build_in_container.sh"]
