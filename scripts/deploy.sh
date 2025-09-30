#!/bin/bash

# Скрипт для деплоя на R2 бакет Cloudflare winspirits-nl

# Установка переменных окружения
export CLOUDFLARE_API_TOKEN="jn83z1maEve9oSfFWd6tezXhegON5eGehornZaMe"
export CLOUDFLARE_ACCOUNT_ID="83802fb0b9b6916c3c04c4927f3c3010"

echo "🚀 Начинаю деплой на R2 бакет winspirits-nl в папку trends-all-geo..."

# Сборка проекта
echo "📦 Сборка проекта..."
npm run build

if [ $? -ne 0 ]; then
    echo "❌ Ошибка при сборке проекта"
    exit 1
fi

echo "☁️ Загрузка файлов на R2 бакет..."

# Функция для загрузки файла
upload_file() {
    local file_path="$1"
    local object_key="trends-all-geo/${file_path#dist/}"  # Добавляем префикс trends-all-geo/
    echo "📤 Загружаю: $object_key"
    node scripts/upload-direct.cjs "$file_path" "$object_key"
}

# Загрузка всех файлов из папки dist
find dist -type f \( -name "*.js" -o -name "*.css" -o -name "*.html" -o -name "*.webp" -o -name "*.svg" -o -name "*.mp4" -o -name "*.webm" -o -name "*.json" \) | while read file; do
    upload_file "$file"
done

echo "✅ Деплой завершен успешно!"
