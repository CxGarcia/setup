#!/usr/bin/env bash

# Install Homebrew (if not installed)

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install and setup Mongodb
# brew tap mongodb/brew
# brew install mongodb-community
# sudo mkdir -p /System/Volumes/Data/data/db
# sudo chown -R `id -un` /System/Volumes/Data/data/db

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
# brew install coreutils
# ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
# brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
# brew install findutils
# Install GNU `sed` as gsed
# brew install gnu-sed

# Install `wget` with IRI support.
brew install wget --with-iri

brew install gmp
brew install grep
brew install node

# Install useful binaries.
brew install git
brew install git-lfs
brew install github/gh/gh

#Install zsh
brew install zsh

# Installs Casks
brew tap caskroom/cask

## Apps
brew install --cask dropbox
brew install --cask firefox
brew install --cask homebrew/cask-versions/firefox-nightly # Nightly
#brew install --cask google-chrome #Chrome
brew install --cask homebrew/cask-versions/google-chrome-canary # Chrome Canary
brew install --cask iterm2
brew install --cask notion
brew install --cask spotify
brew install --cask vlc
brew install --cask tower
brew install --cask visual-studio-code
brew install --cask zoom

# Remove outdated versions from the cellar.
brew cleanup
