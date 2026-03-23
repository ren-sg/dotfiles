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
