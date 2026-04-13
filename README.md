### Конфиги дотфайлов
- tmux
- hypland
- waybar
- nvim


#### Исполняемые файлы php и composer через docker php-docker

Скопировать php-docker в ~/.local/php-docker

chmod +x файлов:
- php-docker/bin/php
- php-docker/bin/composer

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

#### Для поддержки phpactor в neovim:
___
```bash
sudo apt update
sudo apt install -y software-properties-common

sudo add-apt-repository ppa:ondrej/php
sudo apt update
```

Установка php
```bash
sudo apt install php8.3-cli php8.3-mbstring php8.3-xml php8.3-curl
```


