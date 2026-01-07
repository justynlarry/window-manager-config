#!/bin/bash

set -e

# Safeguard
read -rp "This will install and configure a full Arch+i3 environment.  Continue? [y/N] " confirm [[ "$confirm" =~ ^[Yy]$ ]] || exit 1

# Log
LOG="$HOME/arch-recovery.log"
exec > >(tee -a "$LOG") 2>&1


echo "=============================="
echo "=== Arch-i3/Sway Recovery ===="
echo "=============================="
echo ""

# Check if running as root
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
    cronie \
    linux-lts \
    linux-headers \
    intel-ucode \
    libva-intel-driver \
    plocate

echo ""
echo "Installing fonts..."
sudo pacman -S --needed --noconfirm \
    ttf-font-awesome \
    powerline-fonts \
    noto-fonts \
    noto-fonts-emoji \
    ttf-dejavu \
    ttf-jetbrains-mono \
    papirus-icon-theme

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
    python-pipx \
    nodejs \
    npm

echo ""
echo "Installing Power/Hardware Utilities..."
sudo pacman -S --needed --noconfirm \
    acpid \
    thermald \
    powertop \
    fwupd \
    s-tui \
    7zip \
    unrar \
    cifs-utils \
    smbclient 

echo ""
echo "Installing networking diagnostic tools..."
sudo pacman -S --needed --noconfirm \
    inetutils \
    bind \
    tcpdump \
    ethtool

echo ""
echo "Installing Sway and Sway Support..."
sudo pacman -S --needed --noconfirm \
    sway \
    swaybg \
    swayidle \
    swaylock \
    waybar \
    wofi \
    foot \
    grim \
    slurp \
    wl-clipboard \
    conky 

echo ""
echo "Creating default i3 config directory if it doesn't exist..."
mkdir -p ~/.config/i3
mkdir -p ~/.config/polybar
mkdir -p ~/.config/picom
mkdir -p ~/.config/alacritty
mkdir -p ~/.config/dunst

mkdir -p ~/.config/sway
mkdir -p ~/.config/waybar


echo ""
echo "Installing yay (AUR Helper)..."
if ! command -v yay &> /dev/null; then
    # Install dependencies for building
    sudo pacman -S --needed --noconfirm base-devel git

    # Clone and build in a temp directory
    _tmpdir=$(mktemp -d)
    git clone https://aur.archlinux.org/yay-bin.git "$_tmpdir"
    cd "$_tmpdir"

    # -s installs dependencies, -i installs the package, --noconfirm skips prompt
    makepkg -si --noconfirm

    cd -
    rm -rf "$_tmpdir"
else
    echo "yay is already installed"
fi


echo ""
echo "Installing AUR packages..."
yay -S --noconfirm \
    mbpfan-git \
    kbdlight \
    pommed-light \
    pommed-light-debug \
    ttf-code2000 \
    unimatrix-git

echo ""
echo "Configure MbpFan...."
sudo tee /etc/mbpfan.conf > /dev/null << 'EOF'
[general]
min_fan_speed = 2500
max_fan_speed = 6200
low_temp = 40
high_temp = 50
max_temp = 65
polling_interval = 1
EOF


echo ""
echo "Enabling System Services..."
sudo systemctl enable --now mbpfan
sudo systemctl enable --now NetworkManager
sudo systemctl enable --now bluetooth
sudo systemctl enable --now lightdm
sudo systemctl enable --now tlp

echo ""
echo "Enabling user audio service..."
systemctl --user enable pipewire pipewire-pulse wireplumber


echo ""
echo "Restoring dotfiles..."
git clone https://github.com/justynlarry/window-manager-config.git ~/wm-config
rsync -av --progress ~/wm-config/ ~/.config/
# Clean up cloned repository
rm -rf ~/wm-config
