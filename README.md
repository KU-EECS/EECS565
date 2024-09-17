## KU EECS 565 Lab (by Docker)

### Set up the environment

#### Install Software

- Install [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)

    - Verify Git Installation

        ```shell
        git --version
        ```

        If you haven’t installed it yet, go ahead and install it.

    - Installing on Linux

        ```shell
        # e.g., Ubuntu, Debian
        sudo apt install git

        # e.g., Fedora
        sudo dnf install git

        # e.g., CentOS
        sudo yum install git
        ```

    - Installing on macOS

        ```shell
        brew install git
        ```

    - Installing on Windows

        Go to the [Git for Windows](https://git-scm.com/download/win) page and download the installer, and install.

    For more options, there are instructions for installing on several different platforms on the Git website, at https://git-scm.com/book/en/v2/Getting-Started-Installing-Git.

- Install [Docker](https://docs.docker.com/engine/install/)

    - Verify Docker Installation

        ```shell
        docker --version
        ```

        If you haven’t installed it yet, go ahead and install it.

    - [Installing on Linux](https://docs.docker.com/desktop/install/linux/ubuntu/)
        ```shell
        curl -fsSL https://get.docker.com -o get-docker.sh
        sudo sh get-docker.sh
        ```

        **[Optional] Manage Docker as a Non-Root User**.

        ```shell
        sudo usermod -aG docker $USER
        sudo chmod 666 /var/run/docker.sock
        ```
        **IMPORTANT:** If you don't set this up, you'll need to run Docker commands with ``sudo``, as ``sudo docker``.


    - [Installing on macOS](https://docs.docker.com/desktop/install/mac-install/)

        - Download Docker Desktop

            Go to the [Docker Desktop for Mac](https://docs.docker.com/desktop/install/mac-install/) page and download the installer.

        - Install Docker Desktop

            Open the downloaded .dmg file and drag the Docker icon to the Applications folder.

    - [Installing on Windows](https://docs.docker.com/desktop/install/windows-install/)

        - Download Docker Desktop

            Go to the [Docker Desktop for Windows](https://docs.docker.com/desktop/install/windows-install/) page and download the installer.

        - Install Docker Desktop

            Run the downloaded .exe file and follow the installation instructions. You might need to enable the WSL 2 feature (Windows Subsystem for Linux) if it’s not already enabled.


    For more options, there are instructions for installing on several different platforms on the Docker website, at https://docs.docker.com/engine/install.

#### Clone the [EECS565 Lab](https://github.com/KU-EECS/EECS565) repository
```bash
# HTTPS
git clone https://github.com/KU-EECS/EECS565.git
```
#### Change directory
```bash
cd EECS565
```

#### Build the Docker image
```bash
docker build -t eecs565 .
```

#### Deploy a Docker container
```bash
docker run -it -v ${PWD}:/eecs565 eecs565
```

**IMPORTANT:** In the Docker container, there is a ``root`` user and a non-root user with the username ``seed`` and password ``dees``.

If you successfully enter the container, the prompt should look like this (note that ``69c9825a16d9`` will be different for everyone, as it's the container ID):
```shell
root@69c9825a16d9:/eecs565#
```
**IMPORTANT:** Always perform the lab tasks within the Docker container. The prompt should look like ``root@69c9825a16d9:/eecs565#``(for root, Mini Project 2) or ``seed@69c9825a16d9:/eecs565$``(non-root, Mini Project 3).

**IMPORTANT:** You can browse the files and pictures in the MP2 and MP3 folders on the host and use a text editor on the host to edit files in these folders. These folders are shared between the host and the Docker container, so any changes made inside the container will be reflected on the host, and vice versa.

### Lab Instructions

#### Mini Project 2
see [MP2.md](MP2.md)

#### Mini Project 3
see [MP3.md](MP3.md)


### Trouble Shooting

1. If you’re encountering the ``Docker daemon not running`` issue, here are steps to troubleshoot and resolve it:
   - Linux
        ```shell
        sudo systemctl start docker
        sudo systemctl enable docker
        sudo systemctl restart docker
        ```
   - macOS && Windows
     - Open docker desktop
     - Restart docker desktop

2. If you get docker permission denied error: ``Got permission denied while trying to connect to the Docker daemon socket``
    - Change the permission
        ```shell
        sudo chmod 666 /var/run/docker.sock
        ```
    - or Run Docker Commands with sudo
        ```shell
        sudo docker run -it -v ${PWD}:/eecs565 eecs565
        ```
3. If you get ``No such file or directory`` error, such as:
    ```
    Can't open plain.txt for reading, No such file or directory

    130734400947520:error:02001002:system library:fopen:No such file or directory:../crypto/bio/bss_file.c:69:fopen('plain.txt','rb')

    130734400947520:error:2006D080:BIO routines:BIO_new_file:no such file:../crypto/bio/bss_file.c:76:
    ```

    You’re not in the mini project folder, so the system can’t find the file.

    First, navigate to the ``EECS565`` directory on your host, then deploy the Docker container within the ``EECS565`` directory.

    ```shell
    cd EECS565
    docker build -t eecs565 .
    docker run -it -v ${PWD}:/eecs565 eecs565
    ```

    Next, inside the Docker container, navigate to the mini project directory.

    ```
    # mini project 2
    cd MP2
    ```

    or

    ```
    # mini project 3
    cd MP3
    ```
