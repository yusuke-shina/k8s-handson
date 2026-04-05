#!/bin/bash

if ! type "kind" > /dev/null 2>&1; then
    echo "installing kind..."     #コマンドが存在しない時の処理
    [ $(uname -m) = x86_64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.31.0/kind-linux-amd64
    [ $(uname -m) = aarch64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.31.0/kind-linux-arm64
    chmod +x ./kind
    sudo mv ./kind /usr/local/bin/kind
else
    echo "installed kind : $(kind version)"     #コマンドが存在する時の処理
fi
if ! type "kubectl" > /dev/null 2>&1; then
    echo "installing kubectl..."     #コマンドが存在しない時の処理
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
    chmod +x kubectl
    sudo mv kubectl /usr/local/bin/kubectl
    kubectl version --client
else
    echo "installed kubectl : $(kubectl version --client)"     #コマンドが存在する時の処理
fi
