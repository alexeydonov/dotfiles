# dotfiles

## Pre-requisites

Required packages are usually covered by appropriate [Ansible playbook](https://github.com/alexeydonov/playbooks.git).

### macOS

```shell
sudo port install bat eza
```

```shell
git clone --depth=1 https://github.com/mattmc3/antidote.git ~/.antidote
```

### Debian

```shell
sudo apt install zsh zsh-antidote bat eza
```

```shell
chsh -s /bin/zsh
```

## Installation

```shell
git clone git@github.com:alexeydonov/dotfiles.git ~/.dotfiles
```

```shell
~/.dotfiles/install
```

## Color prompt

```shell
echo "prompt autumn|barbie|danger|emerald|flame|frost|lemon|mono|sand" >~/.zshrc.d/prompt.zsh
```

Refer to [Robot Moon's Zsh prompt generator](https://robotmoon.com/zsh-prompt-generator/) for samples.
