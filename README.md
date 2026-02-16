# dotfiles

## Pre-requisites

> [!NOTE]
> Required packages are usually covered by appropriate [Ansible playbook](https://github.com/alexeydonov/playbooks.git).

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
echo "prompt <name-see-below>" >~/.zshrc.d/prompt.zsh
```

> [!TIP]
> | Prompt name | user@hostname:basename $                |
> |-------------|-----------------------------------------|
> | autumn      | `#F3B28E` `#C5291C` `#EC6A2C` `#A46361` |

| barbie      | <span style="font-family: monospace;"><span style="color: #C529F6;">user</span><span style="color: #C866F7;">@</span><span style="color: #EF8DF9;">host</span>:<span style="color: #F3B2FA;">basename</span> $</span> |
| danger      | <span style="font-family: monospace;"><span style="color: #EA3323;">user@host</span>:<span style="color: #EA3323;">basename</span> $</span> |
| emerald     | <span style="font-family: monospace;"><span style="color: #4EAC31;">user</span><span style="color: #61D43F;">@</span><span style="color: #75FB4C;">host</span>:<span style="color: #C0FD50;">basename</span> $</span> |
| flame       | <span style="font-family: monospace;"><span style="color: #EA3323;">user</span><span style="color: #EC6A2C;">@</span><span style="color: #EF8D34;">host</span>:<span style="color: #F9D949;">basename</span> $</span> |
| frost       | <span style="font-family: monospace;"><span style="color: #4EACF8;">user</span><span style="color: #61D4FA;">@</span><span style="color: #75FBFD;">host</span>:<span style="color: #DFFEFF;">basename</span> $</span> |
| lemon       | <span style="font-family: monospace;"><span style="color: #75FB75;">user</span><span style="color: #C0FD95;">@</span><span style="color: #FFFF7A;">host</span>:<span style="color: #FFFFFF;">basename</span> $</span> |
| mono        | <span style="font-family: monospace;"><span style="color: #767676;">user</span><span style="color: #8A8A8A;">@</span><span style="color: #B2B2B2;">host</span>:<span style="color: #E4E4E4;">basename</span> $</span> |
| sand        | <span style="font-family: monospace;"><span style="color: #F3B28E;">user</span><span style="color: #F9D949;">@</span><span style="color: #F9D992;">host</span>:<span style="color: #FFFFB8;">basename</span> $</span> |
