### Конфиги дотфайлов
- tmux
- hypland
- waybar
- nvim


#### Исполняемые файлы php и composer через docker

chmod +x файлов:
bin/php
bin/composer

Размещение файлов в ~/.local/bin/

Добавить в ~/.bashrc
```
export PATH="$HOME/.local/bin:$PATH"
export EDITOR=nvim
```

Для php переменные окружения
PHP_IMAGE_VERSION=8.3 | 8.5 и т.п.
