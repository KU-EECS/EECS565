### Mini Project 2

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
