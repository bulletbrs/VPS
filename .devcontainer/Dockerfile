FROM mcr.microsoft.com/devcontainers/base:ubuntu-22.04

# Отключаем интерактивные запросы
ENV DEBIAN_FRONTEND=noninteractive

# Предустанавливаем настройки локалей и клавиатуры
RUN apt-get update && \
    apt-get install -y locales && \
    sed -i 's/^# *\(en_US.UTF-8\)/\1/' /etc/locale.gen && \
    locale-gen en_US.UTF-8 && \
    update-locale LANG=en_US.UTF-8

# Устанавливаем пакеты без интерактивных диалогов
RUN apt-get install -y \
    xfce4 \
    xfce4-goodies \
    tightvncserver \
    novnc \
    websockify \
    firefox \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Возвращаем дефолтное значение для переменной
ENV DEBIAN_FRONTEND=
