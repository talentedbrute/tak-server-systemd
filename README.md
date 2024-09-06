# tak-server-systemd
Scripts to support the TAK Server via systemd

The five services are broken out into individual service files.

You only need the `config`, `messaging`, and `api` services to be running.

# Installation

1. Clone the repo
2. Run `./install.sh` to install these scripts, generate the environment file and remove the stock startup scripts
