
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

        **(Optional) Manage Docker as a Non-Root User**.

        ```shell
        sudo usermod -aG docker $USER
        ```
        **Note:** If you don't set this up, you'll need to run Docker commands with ``sudo``, as ``sudo docker``.


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
- Unzip the project files
    ```shell
    unzip -q MP2.zip
    ```
- Change directory to ``MP2``
    ```shell
    cd MP2
    ```
Then follow the instructions in ``MP2_Encryption_slides.pdf`` and ``MP2_instruction.pdf`` to do the lab.

**IMPORTANT:** For ``Task 3``, we don’t use the Bless hex editor in Docker. Instead, we use one of the three methods: [hexed.it](https://hexed.it/), ``hexedit`` or ``xxd``.
- [hexed.it](https://hexed.it/)
    - Go to the [hexed.it](https://hexed.it/) website using your browser
    - Click on the ``Open file`` button or drag-and-drop a file into the editor window
    - Click on any byte in the hex view to select it, then start typing the new hex values you want to replace
    - Click on the ``Save as`` button to save to download the modified file

- hexedit
    - Open a file
        ```
        hexedit filename.bin
        ```
    - Use the arrow keys to navigate to the position you want to edit
    - Type new values using digits 0-9 and letters A-F. If you enter any other characters, it will display "Unknown command"
    - Exit using ``Ctrl+X`` and type ``Y`` to save

- xxd
    - Create a hex dump
        ```shell
        xxd filename.bin > temp.hex
        ```
    - Edit ``temp.hex`` with your preferred text editor
        ```shell
        # using vim
        vim temp.hex

        # using nano
        nano temp.hex
        ```
    - Convert the hex dump back to binary
        ```shell
        xxd -r temp.hex > filename.bin
        ```

#### Mini Project 3

- Unzip the project files and change the owner/group
    ```shell
    unzip -q MP3.zip && chown seed:seed_g MP3
    ```
- Change directory to ``MP3`` and change user to ``seed``
    ```shell
    cd MP3 && su seed
    ```
    **IMPORTANT:** The password for the user ``seed`` is ``dees``.

Then follow the instructions in ``MP3_Set-UID Program.pdf`` and ``MP3.pdf`` to do the lab.


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
    - Restart Docker Engine
        ```shell
        sudo systemctl restart docker
        ```
    - Run Docker Commands with sudo
        ```shell
        sudo docker run -it -v ${PWD}:/eecs565 eecs565
        ```
3. If you get ``No such file or directory`` error, such as:
    ```
    Can't open plain.txt for reading, No such file or directory

    130734400947520:error:02001002:system library:fopen:No such file or directory:../crypto/bio/bss_file.c:69:fopen('plain.txt','rb')

    130734400947520:error:2006D080:BIO routines:BIO_new_file:no such file:../crypto/bio/bss_file.c:76:
    ```

    You’re not in the mini project folder, so the system can’t find the file. You need to change to the mini project directory.
    ```
    # mini project 2
    cd MP2

    # mini project 3
    cd MP3
    ```