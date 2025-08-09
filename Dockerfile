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

RUN apt-get update && apt-get install -y \
    texlive \
    texlive-extra-utils \
    texlive-lang-european \
    texlive-lang-german \
    texlive-latex-base \
    texlive-latex-extra \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y \
    texlive-bibtex-extra \
    biber

WORKDIR /work

COPY build_in_container.sh /work/build_in_container.sh
RUN chmod +x /work/build_in_container.sh

CMD ["/work/build_in_container.sh"]