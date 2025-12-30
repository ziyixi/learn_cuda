FROM nvidia/cuda:13.1.0-devel-ubuntu24.04

# Prevent interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies (wget/curl/git/zsh/sudo/clangd)
RUN apt-get update && \
    apt-get install -y wget curl git zsh sudo vim clangd && \
    rm -rf /var/lib/apt/lists/*

# Install Oh My Zsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Force RobbyRussell theme and Git plugin
RUN sed -i 's/ZSH_THEME=".*"/ZSH_THEME="robbyrussell"/' ~/.zshrc && \
    sed -i 's/plugins=(.*)/plugins=(git)/' ~/.zshrc

# Set Zsh as default
RUN chsh -s $(which zsh)