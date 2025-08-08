FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    git \
    wget \
    curl \
    unzip \
    ca-certificates \
    pandoc \
    python3 \
    python3-pip \
    imagemagick \
    ghostscript \
    fonts-dejavu-core \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y --no-install-recommends texlive-full && rm -rf /var/lib/apt/lists/*

WORKDIR /work

COPY build_in_container.sh /work/build_in_container.sh
RUN chmod +x /work/build_in_container.sh

CMD ["/work/build_in_container.sh"]