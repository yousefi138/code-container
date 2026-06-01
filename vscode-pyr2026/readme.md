# VS Code with Python 3.12 and R 4.5

Uses [VS Code Tunnels](https://code.visualstudio.com/docs/remote/tunnels) to
provide a native VS Code desktop experience running inside an Apptainer container.

> **Prerequisite:** The HPC node must have outbound HTTPS (port 443) access to
> Microsoft's relay servers. Confirm this with your HPC admins before proceeding.

## 1. Build container image

```
bash scripts/build.sh vscode-pyr2026
```

## 2. Install packages

```
bash scripts/prepare-vscode.sh vscode-pyr2026
```

## 3. Start the tunnel

On the HPC node:

```
bash vscode-pyr2026/out/run-vscode.sh
```

On first run, `code tunnel` will print a device-code URL, e.g.:

```
To grant access to the server, please log into https://github.com/login/device
and use code XXXX-XXXX
```

Visit that URL in any browser (on your local machine), log in with your
GitHub or Microsoft account, and authorise the device. The tunnel name is
saved to `vscode-pyr2026/out/user-vscode-server/` and reused on subsequent runs.

## 4. Connect from VS Code desktop

1. Install the [Remote - Tunnels](https://marketplace.visualstudio.com/items?itemName=ms-vscode.remote-server) extension in your local VS Code.
2. Open the Command Palette (`Ctrl+Shift+P` / `Cmd+Shift+P`) and run **Remote Tunnels: Connect to Tunnel**.
3. Select your tunnel — VS Code will connect and open a full remote session inside the container.

## Python

To install additional Python packages, use `--target /opt/ide/user-python`, e.g.:

```
pip3 install --target /opt/ide/user-python somepackage
```

## R

To install additional R packages, set `R_LIBS_USER=/opt/ide/user-R` in your
R session or `.Renviron`.

## Troubleshooting

### `ERROR  : Installation issue: starter-suid doesn't have setuid bit set`

Try running with `--fakeroot`:

```
apptainer run --fakeroot -B ...
```

### Tunnel disconnects or fails to register

Ensure the HPC node has outbound HTTPS. If only login nodes have internet
access, run `run-vscode.sh` on a login node rather than a compute node.
