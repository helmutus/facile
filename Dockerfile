FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# RUN apt-get update && apt-get install -y --no-install-recommends \
#     build-essential \
#     git \
#     wget \
#     curl \
#     unzip \
#     ca-certificates \
#     python3 \
#     python3-pip \
#     && rm -rf /var/lib/apt/lists/*

# do not install documentation
RUN echo 'path-exclude=/usr/share/doc/*' > /etc/dpkg/dpkg.cfg.d/01_nodoc \
 && echo 'path-exclude=/usr/share/man/*' >> /etc/dpkg/dpkg.cfg.d/01_nodoc \
 && echo 'path-exclude=/usr/share/texlive/texmf-dist/doc/*' >> /etc/dpkg/dpkg.cfg.d/01_nodoc

# install latex etc.
COPY script/install.sh /install.sh
RUN chmod +x install.sh && \
    /install.sh && \
    rm -rf /var/lib/apt/lists/* && \
    rm install.sh

WORKDIR /work

COPY script/generate.sh /work/generate.sh
RUN chmod +x /work/generate.sh

COPY book /work/

CMD ["/work/generate.sh"]
