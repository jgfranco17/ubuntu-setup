#!/usr/bin/env bash

set -eux

GO_VERSION_TO_INSTALL="1.24.3"
GO_BIN_ARCHIVE="go${GO_VERSION_TO_INSTALL}.linux-amd64.tar.gz"

sudo rm -rf /usr/local/go
sudo tar -C /usr/local -xzf "go${GO_VERSION_TO_INSTALL}.linux-amd64.tar.gz"

# Add Go bin to PATH if not already there
GO_BIN_PATH="/usr/local/go/bin"
if echo $PATH | grep -q "$GO_BIN_PATH"; then
    echo "Go bin already in ${PATH}"
else
    export PATH="$PATH:/usr/local/go/bin";
fi

# Verify installation
go version
