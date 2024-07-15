#!/bin/sh

# Обновляем список пакетов
apt -y update

# Устанавливаем Git
apt -y install git

# Устанавливаем зависимости для Docker
apt -y install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

# Добавляем Docker GPG ключ
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Добавляем Docker репозиторий
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Обновляем список пакетов снова
apt -y update

# Устанавливаем Docker Engine
apt -y install docker-ce docker-ce-cli containerd.io

# Устанавливаем Docker Compose
DOCKER_COMPOSE_VERSION="2.5.0"
curl -L "https://github.com/docker/compose/releases/download/v${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose