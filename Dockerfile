FROM php:8.2-fpm-alpine

# Настройка рабочей директории
WORKDIR /var/www/html

# Установка Nginx
RUN apk --no-cache add nginx

# Копирование конфигурационных файлов
COPY ./default.conf /etc/nginx/http.d/default.conf

# Копирование исходного кода
COPY src/ /var/www/html/

# Expose the port nginx is reachable on
EXPOSE 80

# Запуск PHP-FPM и Nginx
CMD ["sh", "-c", "php-fpm -D && nginx -g 'daemon off;'"]
