#! /usr/bin/env bash

#########################################################################
# Install tools if they are not already installed in the workspace image
#########################################################################

# Install bazelisk if neither bazel nor bazelisk are installed
if ! command -v bazel &> /dev/null; then
  if ! command -v bazelisk &> /dev/null; then
    echo "Installing bazelisk ..."
    go install github.com/bazelbuild/bazelisk@latest
  fi
  echo "Adding bazel -> bazelisk alias ..."
  sudo ln -sf $(which bazelisk) /usr/bin/bazel
fi

# Install dotnet if it does not exist
if ! command -v dotnet &> /dev/null; then
  echo "Installing dotnet ..."
  curl -sSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin --channel 6.0 --install-dir ~/.dotnet
  sudo ln -sf ~/.dotnet/dotnet /usr/bin/dotnet 
fi

echo "Dotfile installation complete!"
