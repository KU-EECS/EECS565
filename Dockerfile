FROM ubuntu:focal

# ARG USERNAME=seed
# ARG PASSWORD=dees
# ARG GROUPNAME=seed_g
# ARG DIRNAME=eecs565

RUN apt-get update && \
    apt-get install -y \
    build-essential \
    vim \
    nano \
    curl \
    colordiff \
    unzip \ 
    zip \
    openssl \
    python3 \
    python3-pip \
    bsdmainutils \
    xxd \
    hexedit \
    bvi \
    sudo \
    zsh && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN cd /usr/bin && \
    ln -sf /usr/bin/python3 /usr/local/bin/python 

RUN groupadd seed_g && \
    useradd -m -s /bin/bash -g seed_g seed && \
    echo "seed:dees" | chpasswd && \ 
    usermod -aG sudo seed 

RUN mkdir /home/seed/Downloads && chown -R seed:seed_g /home/seed/Downloads
RUN mkdir /home/seed/Desktop && chown -R seed:seed_g /home/seed/Desktop

# USER seed

WORKDIR /eecs565

CMD ["bash"]
