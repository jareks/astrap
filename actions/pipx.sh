#!/bin/bash

set -e

sudo apt install -y pipx
pipx install python-lsp-server[rope]
pipx inject python-lsp-server python-lsp-ruff
pipx inject python-lsp-server pylsp-mypy

# optional, not for lsp
#pipx install mypy

