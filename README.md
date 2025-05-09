# QRShare

Share files locally through a web server and a QR code displayed in the Terminal

## Usage

Add the qrshare.sh to PATH.

```sh
ln -s qrshare/qrshare.sh ~/.local/bin/qrshare
chmod +x ~/.local/bin/qrshare
```

Create the qrshared/ folder.

```sh
mkdir ~/qrshared/
```

Share a file.

```sh
qrshare file.txt
```
