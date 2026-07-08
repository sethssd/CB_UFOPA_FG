FROM php:8.4-apache

# Habilitar roteamento do Apache (vital para CodeIgniter)
RUN a2enmod rewrite

# Instalar dependências e compilar extensões cruciais do sistema
RUN apt-get update && apt-get install -y \
    libicu-dev \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libzip-dev \
    libonig-dev \
    unzip \
    && rm -rf /var/lib/apt/lists/* \
    && docker-php-ext-configure intl \
    && docker-php-ext-install intl mbstring gd zip mysqli pdo_mysql

# Cria o entrypoint direto no Linux, sem depender de arquivo do Windows
RUN printf '#!/bin/bash\nset -e\n\necho "Ajustando permissões da pasta local/..."\nchown -R www-data:www-data /var/www/html/local\nchmod -R 775 /var/www/html/local\n\necho "Iniciando Apache..."\nexec apache2-foreground\n' > /usr/local/bin/entrypoint.sh \
    && chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]