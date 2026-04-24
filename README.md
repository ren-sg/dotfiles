### Конфиги дотфайлов

- tmux
- hypland
- waybar
- nvim

### PHP cli + docker cli

---

**Arch**

```bash
sudo pacman -S nodejs npm shfmt stylua php composer
sudo npm install -g prettier
```

**Ubuntu**

```bash
sudo apt update
sudo apt install -y software-properties-common
sudo add-apt-repository ppa:ondrej/php
sudo apt update
```

```bash
sudo apt install php8.3-cli php8.3-mbstring php8.3-xml php8.3-curl
```

```bash
sudo apt install -y nodejs npm composer
sudo npm install -g prettier
```

```bash
composer global require php-cs-fixer/shim
//composer global require phpactor/phpactor

echo 'export PATH="$HOME/.config/composer/vendor/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

Скопировать php/.php_cs_fixer в ~/.config/php-cs-fixer/.php-cs-fixer.php

#### Docker-php cli

---

Скопировать php-docker в ~/.local/php-docker

chmod +x файлов:

- php-docker/bin/dphp
- php-docker/bin/dcomposer

Добавить в ~/.bashrc

```
export PATH="$HOME/.local/php-docker/bin:$PATH"
export EDITOR=nvim
```

Для php переменные окружения
PHP_IMAGE_VERSION=8.3 | 8.5 и т.п.

Собрать образы

```
docker build -t local/php-cli:8.3-dev --build-arg PHP_VERSION=8.3 ~/.local/php-docker/image
```

```
docker build -t local/php-cli:8.5-dev --build-arg PHP_VERSION=8.5 ~/.local/php-docker/image
```

### NEOVIM

---

**Shfmt + stylua**

```bash
mkdir -p ~/.local/bin

curl -L https://github.com/mvdan/sh/releases/latest/download/shfmt_v3.8.0_linux_amd64 \
  -o ~/.local/bin/shfmt

chmod +x ~/.local/bin/shfmt

mkdir -p ~/.config/stylua && printf 'indent_type = "Spaces"\nindent_width = 2\n' > ~/.config/stylua/stylua.toml
```

```bash
curl -L https://github.com/JohnnyMorganz/StyLua/releases/latest/download/stylua-linux-x86_64.zip \
  -o stylua.zip

unzip stylua.zip
mv stylua ~/.local/bin/
chmod +x ~/.local/bin/stylua
rm stylua.zip
```

#### .phpactor.json

```bash
mkdir -p ~/.local/bin
curl -Lo ~/.local/bin/phpactor https://github.com/phpactor/phpactor/releases/latest/download/phpactor.phar
chmod +x ~/.local/bin/phpactor
```

```json
{
  "$schema": "https://raw.githubusercontent.com/phpactor/phpactor/master/res/schema/phpactor.schema.json",
  "indexer.exclude_patterns": [
    "/vendor/**",
    "/node_modules/**",
    "/upload/**",
    "/bitrix/cache/**",
    "/bitrix/managed_cache/**",
    "/bitrix/stack_cache/**",
    "/bitrix/tmp/**",
    "/bitrix/backup/**",

    "/bitrix/modules/**/install/**",

    "/local/modules/**/install/**",

    "/**/install/**",

    "/.git/**"
  ],

  "indexer.follow_symlinks": false,

  "language_server.diagnostics_on_update": false,
  "language_server.diagnostics_on_save": true,

  "completion_worse.completor.class_member.visibility": [
    "public",
    "protected",
    "private"
  ],

  "code_transform.import_globals": true
}
```

### Tmux

---
```bash
$ mkdir -p ~/Git && mkdir -p ~/.config/tmux
$ git clone --single-branch https://github.com/gpakosz/.tmux.git ~/Git/gpakosz/tmux
$ ln -s $HOME/Git/gpakosz/tmux/.tmux.conf ~/.config/tmux/tmux.conf
$ cp ~/Git/gpakosz/tmux/.tmux.conf.local ~/tmux.conf.local

```

```bash
set -g default-terminal "tmux-256color"
set -ga terminal-overrides ",*:Tc"
```
