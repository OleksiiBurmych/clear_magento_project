🧠 Додаткові поради:
🔐 Захист:
Composer не потрапляє у фінальний образ.

--no-dev — жодних dev-залежностей у продакшн.

⚡ Кешування:
Для швидких CI/CD збірок можна додати:

dockerfile
Копіювати
Редагувати
COPY composer.json composer.lock ./
RUN composer install --no-dev ...
COPY . .
📦 Поради для docker-compose.yml:
yaml
Копіювати
Редагувати
services:
  app:
    build:
      context: .
      dockerfile: Dockerfile
    ports:
      - 9000:9000
    volumes:
      - .:/var/www/html
Хочеш повністю без volumes, з образом, готовим до продакшену? Просто забери volumes:.


docker-php-ext-configure gd --with-freetype --with-jpeg --with-webp --with-xpm

docker-php-ext-install intl pdo_mysql gd soudium



docker compose down
docker system prune -a
docker compose build --no-cache
docker compose up -d

