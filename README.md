# dotfiles

## Pre-requisites

> [!NOTE]
> Required packages are usually covered by appropriate [Ansible playbook](https://github.com/alexeydonov/playbooks.git) or [cloud-init config](https://gist.github.com/alexeydonov/62c7718502eae61f0e9a4f2bd74e716c).

### macOS

```shell
sudo port install git bat eza fzf zoxide
```

### Debian

```shell
sudo apt install zsh git bat eza fzf zoxide
chsh -s /bin/zsh
```

## Installation

```shell
curl -fsSL https://github.com/alexeydonov/dotfiles/raw/refs/heads/master/install.sh | zsh -s -- <packages-see-below>
```

### Available packages

* git
* zsh
* utils
* linux-gui
* macos

### Modifications

Refer to [GNU Stow documentation](https://www.gnu.org/software/stow/manual/stow.html)
for what to do to apply modifications.

## Color prompt

To automatically set prompt theme, call `prompt <theme-name>` during startup:

```shell
echo "prompt <theme-see-below>" >~/.zshrc.d/prompt.zsh
```

### User prompt

User prompt, appropriately named `user` is a minimal distraction-free prompt.
The format is `basename $` and it does not modify standard shell color.

### Server prompts

Prompt format is `username@hostname:basename $`.
Theme sets colors for `username`, `@`, `hostname`, and `basename`.

| Theme       | Colors                                                                                                                                                                                                                        |
|-------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| autumn      | ![user](https://placehold.co/16x16/F3B28E/F3B28E.png) ![at](https://placehold.co/16x16/C5291C/C5291C.png) ![hostname](https://placehold.co/16x16/EC6A2C/EC6A2C.png) ![basename](https://placehold.co/16x16/A46361/A46361.png) |
| barbie      | ![user](https://placehold.co/16x16/C529F6/C529F6.png) ![at](https://placehold.co/16x16/C866F7/C866F7.png) ![hostname](https://placehold.co/16x16/EF8DF9/EF8DF9.png) ![basename](https://placehold.co/16x16/F3B2FA/F3B2FA.png) |
| danger      | ![user](https://placehold.co/16x16/EA3323/EA3323.png) ![at](https://placehold.co/16x16/EA3323/EA3323.png) ![hostname](https://placehold.co/16x16/EA3323/EA3323.png) ![basename](https://placehold.co/16x16/EA3323/EA3323.png) |
| emerald     | ![user](https://placehold.co/16x16/4EAC31/4EAC31.png) ![at](https://placehold.co/16x16/61D43F/61D43F.png) ![hostname](https://placehold.co/16x16/75FB4C/75FB4C.png) ![basename](https://placehold.co/16x16/C0FD50/C0FD50.png) |
| flame       | ![user](https://placehold.co/16x16/EA3323/EA3323.png) ![at](https://placehold.co/16x16/EC6A2C/EC6A2C.png) ![hostname](https://placehold.co/16x16/EF8D34/EF8D34.png) ![basename](https://placehold.co/16x16/F9D949/F9D949.png) |
| frost       | ![user](https://placehold.co/16x16/4EACF8/4EACF8.png) ![at](https://placehold.co/16x16/61D4FA/61D4FA.png) ![hostname](https://placehold.co/16x16/75FBFD/75FBFD.png) ![basename](https://placehold.co/16x16/DFFEFF/DFFEFF.png) |
| lemon       | ![user](https://placehold.co/16x16/75FB75/75FB75.png) ![at](https://placehold.co/16x16/C0FD95/C0FD95.png) ![hostname](https://placehold.co/16x16/FFFF7A/FFFF7A.png) ![basename](https://placehold.co/16x16/FFFFFF/FFFFFF.png) |
| mono        | ![user](https://placehold.co/16x16/767676/767676.png) ![at](https://placehold.co/16x16/8A8A8A/8A8A8A.png) ![hostname](https://placehold.co/16x16/B2B2B2/B2B2B2.png) ![basename](https://placehold.co/16x16/E4E4E4/E4E4E4.png) |
| sand        | ![user](https://placehold.co/16x16/F3B28E/F3B28E.png) ![at](https://placehold.co/16x16/F9D949/F9D949.png) ![hostname](https://placehold.co/16x16/F9D992/F9D992.png) ![basename](https://placehold.co/16x16/FFFFB8/FFFFB8.png) |

> [!TIP]
> `:` and `$` always use default shell color.
