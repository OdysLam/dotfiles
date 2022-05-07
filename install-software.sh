#!/usr/bin/env bash


# Oh my tmux
 cd
 git clone https://github.com/gpakosz/.tmux.git
 ln -s -f .tmux/.tmux.conf
 cp .tmux/.tmux.conf.local .

# Oh my zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# Populate secrets
echo -e "export BALENA_TOKEN=\nexport ETHERSCAN_API_KEY\nexport ETH_RPC_URL=" > ~/.zsh/zsh_secrets

sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew update
brew upgrade

# Add radicle tap
brew tap radicle/cli https://seed.alt-clients.radicle.xyz/radicle-cli-homebrew.git

apps=(
  node
  ag
  bat
  exa
  git
  git-delta
  git-extras
  htop
  python3
  tree
  wget
  yarn
  libusb
  radicle/cli/core
  cloudflare-wrangler
)

for app in ${apps[*]}
  do
    brew install "${app}"
done

casks=(
  flux
  raycast
  docker
  slack
  spotify
  discord
  cron
  signal
  telegram
  whatsapp
  brave-browser
  todoist
  rotki
  cask
  private-internet-access
)

for app in ${casks[*]}
  do
    brew install --cask "${cask}"
done

export DOTFILES_BREW_PREFIX_COREUTILS=`brew --prefix coreutils`
set-config "DOTFILES_BREW_PREFIX_COREUTILS" "$DOTFILES_BREW_PREFIX_COREUTILS" "$DOTFILES_CACHE"

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

xcode-select --install
