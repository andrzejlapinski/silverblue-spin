#!/bin/bash
set -eux
mkdir -p ~/.local/share/fonts
curl -sfLo "$HOME/.local/share/fonts/Ubuntu Mono Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/UbuntuMono/Regular/complete/Ubuntu%20Mono%20Nerd%20Font%20Complete.ttf
curl -sfLo "$HOME/.local/share/fonts/Ubuntu Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Ubuntu/Regular/complete/Ubuntu%20Nerd%20Font%20Complete.ttf
fc-cache
current_profile=$(dconf list /org/gnome/terminal/legacy/profiles:/ | head -n1)
dconf write /org/gnome/terminal/legacy/profiles:/${current_profile}use-system-font false
dconf write /org/gnome/terminal/legacy/profiles:/${current_profile}font "'UbuntuMono Nerd Font 11'"
dconf reset -f /org/gnome/terminal/legacy/profiles:/
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k