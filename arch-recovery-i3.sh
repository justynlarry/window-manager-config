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
sudo pacman -S --needed --noconfirm \
    xorg \
    xinit \
    xbacklight \
    xbindkeys \
    xvkbd

echo ""
echo "Installing i3 Window Manager and related tools..."
sudo pacman -S --needed --noconfirm \
    i3 \
    i3status \
    i3lock \
    i3blocks \
    lxappearance \
    arandr \
    xsettingsd \
    dmenu \
    rofi \
    dunst \
    nitrogen \
    feh

echo ""
echo "Installing Alacritty terminal..."
    sudo pacman -S --needed --noconfirm alacritty

echo ""
echo "Installing Polybar..."
    sudo pacman -S --needed --noconfirm polybar

echo ""
echo "Installing Picom Compositor..."
sudo pacman -S --needed --noconfirm picom

echo ""
echo "Installing essential command line tools..."
sudo pacman -S --needed --noconfirm \
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
    nmap

echo ""
echo "Installing system utilities..."
sudo pacman -S --needed --noconfirm \
    pavucontrol \
    pipewire \
    pipewire-alsa \
    pipewire-pulse \
    pipewire-jack \
    wireplumber \
    brightnessctl \
    networkmanager \
    network-manager-gnome \
    bluez \
    blueman \
    gparted \
    gnome-disk-utility \
    gnome-themes-extra \
    cronie

echo ""
echo "Installing fonts..."
sudo pacman -S --needed --noconfirm \
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
sudo pacman -S --needed --noconfirm \
    lightdm \
    lightdm-gtk-greeter \
    lightdm-gtk-greeter-settings

echo ""
echo "Installing userful GUI Applications..."
sudo pacman -S --needed --noconfirm \
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
    xclip

echo ""
echo "Install Libre Office Suite..."
sudo pacman -S --needed --noconfirm libreoffice

echo ""
echo "Installing development tools..."
sudo pacman -S --needed --noconfirm \
    gcc \
    make \
    python \
    python-pip \
    nodejs \
    npm

echo ""
echo "Installing Power/Hardware Utilities..."
sudo pacman -S --needed --noconfirm \
    acpid \
    thermald \
    powertop \
    fwupd

echo ""
echo "Installing networking diagnostic tools..."
sudo pacman -S --needed --noconfirm \
    inetutils \
    bind \
    tcpdump \
    ethtool

echo ""
echo "Creating default i3 config directory if it doesn't exist..."
mkdir -p ~/.config/i3
mkdir -p ~/.config/polybar
mkdir -p ~/.config/picom
mkdir -p ~/.config/alacritty
mkdir -p ~/.config/dunst

echo ""
echo "Enabling System Services..."
sudo systemctl enable NetworkManager
sudo systemctl enable bluetooth
sudo systemctl enable lightdm
sudo systemctl enable tlp


echo ""
echo "Restoring dotfiles..."
git clone https://github.com/justynlarry/window-manager-config.git ~/wm-config
rsync -av --progress ~/wm-config/ ~/.config/
# Clean up cloned repository
rm -rf ~/wm-config
