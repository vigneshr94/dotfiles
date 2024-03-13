#!/bin/bash

cli_pkgs=(
    "curl"
    "wget"
    "git"
    "ripgrep"
    "lazygit"
    "node"
    "npm"
    "python"
    "virtualenv"
    "tmux"
    "neovim"
)

read -p "Enter the Distro to select pkg manager: " DISTRO

case $DISTRO in
    "arch")
        pkgMgr="pacman -S"
        ;;
    "debian" | "ubuntu")
        pkgMgr="apt"
        ;;
    "fedora" | "redhat" | "centos")
        pkgMgr="yum"
        ;;
    "opensuse")
        pkgMgr="zypper"
        ;;
    *)
        echo -n "Package Manager not available for the $DISTOR you entered, Please try again."
        exit 1
esac

install_cli_pkgs() {

    for pkg in "${cli_pkgs[@]}"; do

}
