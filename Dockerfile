FROM ubuntu:focal

ARG USERNAME=seed
ARG PASSWORD=dees
ARG GROUPNAME=seed_g
ARG DIRNAME=eecs565

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

RUN groupadd $GROUPNAME && \
    useradd -m -s /bin/bash -g $GROUPNAME $USERNAME && \
    echo "$USERNAME:$PASSWORD" | chpasswd && \ 
    usermod -aG sudo $USERNAME 

RUN mkdir /home/$USERNAME/Downloads && chown -R $USERNAME:$GROUPNAME /home/$USERNAME/Downloads
RUN mkdir /home/$USERNAME/Desktop && chown -R $USERNAME:$GROUPNAME /home/$USERNAME/Desktop

# USER $USERNAME

WORKDIR /$DIRNAME

CMD ["bash"]
