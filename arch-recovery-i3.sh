#!/bin/bash

set -e

echo "========================="
echo "=== Arch/i3 Recovery ===="
echo "========================="
echo ""

# Check if running as room
if [ "$EUID" -eq 0 ]; then
    echo "Please don't run this script as root (no sudo)."
    exit 1
fi

echo "Updating package lists..."
sudo pacman -Syu

echo ""
echo "Installing X Server and display essentials..."
sudo pacman -S --noconfirm \
    xorg \
    xinit \
    xbacklight \
    xbindkeys \
    xvkbd

echo ""
echo "Installing i3 Window Manager and related tools..."
sudo pacman -S --noconfirm \
    i3 \
    i3status \
    i3lock \
    dmenu \
    rofi \
    dunst \
    nitrogen \
    feh

echo ""
echo "Installing Alacritty terminal..."
    sudo pacman -S --noconfirm alacritty

echo ""
echo "Installing Polybar..."
    sudo pacman -S --noconfirm polybar

echo ""
echo "Installing Picom Compositor..."
sudo pacman -S --noconfirm picom

echo ""
echo "Installing essential command line tools..."
sudo pacman -S --noconfirm \
    curl \
    wget \
    git \
    htop \
    btop \
    screenfetch \
    vim \
    neovim \
    nano \
    tmux \
    ranger \
    tree \
    unzip \
    zip \
    tar \
    gzip \
    rsync \
    ssh \
    net-tools \
    dnsutils \
    traceroute \
    nmap \

echo ""
echo "Installing system utilities..."
sudo pacman -S --noconfirm \
    pavucontrol \
    pulseaudio \
    alsa-utils \
    brightnessctl \
    network-manager \
    network-manager-gnome \
    bluez \
    blueman \
    gparted \
    gnome-disk-utility \
    gnome-themes-extra

echo ""
echo "Installing fonts..."
sudo pacman -S --noconfirm \
    tty-font-awesome \
    powerline-fonts \
    noto-fonts \
    noto-fonts-emoji \
    ttf-dejavu \
    ttf-jetbrains-mono \
    papirus-icon-theme \
    plocate

echo ""
echo "Installing LightDM Display Manager..."
sudo pacman -S --noconfirm \
    lightdm \
    lightdm-gtk-greeter \
    lightdm-gtk-greeter-settings

echo ""
echo "Installing userful GUI Applications..."
sudo pacman -S --noconfirm \
    firefox \
    thunar \
    gvfs \
    gvfs-smb \
    gvfs-mtp \
    tumbler \
    mpv \
    vlc \
    gimp \
    inkscape \
    scrot \
    flameshot \
    redshift \
    redshift-gtk \
    remmina \
    freerdp \
    openssh \
    imagemagick \
    less \
    timeshift \
    restic \
    smartmontools \
    bash-completion \
    cryptsetup \
    tlp \
    tlp-rdw \
    xclip \
    wl-clipboard \


echo ""
echo "Install Libre Office Suite..."
sudo pacman -S --noconfirm libreoffice

echo ""
echo "Installing development tools..."
sudo pacman -S --noconfirm \
    gcc \
    make \
    python \
    python-pip \
    nodejs \
    npm

echo ""
echo "Creating default i3 config directory if it doesn't exist..."
mkdir -p ~/.config/i3
mkdir -p ~/.config/polybar
mkdir -p ~/.config/picom
mkdir -p ~/.config/alacritty
mkdir -p ~/.config/dunst




