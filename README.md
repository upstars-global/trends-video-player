# Vue TikTok Landing

Лендинг страница в стиле TikTok для демонстрации игровых видео, построенная на Vue 3 + Vite.

## 🚀 Быстрый старт

### Установка зависимостей
```bash
npm install
```

### Разработка
```bash
npm run dev
```

### Сборка для продакшена
```bash
npm run build
```

### Предварительный просмотр сборки
```bash
npm run preview
```

## 📦 Деплой на Cloudflare R2

Проект настроен для автоматического деплоя на Cloudflare R2 бакет `winspirits-nl` в папку `trends-all-geo`.

### Команды деплоя

```bash
# Полный деплой (сборка + загрузка)
npm run deploy
```

### Как работает деплой

1. **Сборка проекта**: Выполняется команда `npm run build`, которая создает оптимизированную версию в папке `dist/`

2. **Загрузка файлов**: Все файлы из папки `dist/` загружаются на R2 бакет в папку `trends-all-geo/` с сохранением структуры директорий

3. **Поддерживаемые типы файлов**:
   - HTML файлы (`.html`)
   - JavaScript файлы (`.js`)
   - CSS файлы (`.css`)
   - Изображения (`.webp`, `.svg`)
   - Видео (`.mp4`, `.webm`)
   - Конфигурация (`.json`)

4. **Структура загрузки**:
   ```
   winspirits-nl/
   └── trends-all-geo/
       ├── index.html
       ├── shorts/
       │   ├── index-[hash].css
       │   └── index-[hash].js
       ├── video/
       │   ├── h264/
       │   ├── webm/
       │   └── posters/
       └── [другие ресурсы]
   ```

### Конфигурация деплоя

Деплой использует следующие настройки:
- **Бакет**: `winspirits-nl`
- **Папка назначения**: `trends-all-geo/`
- **Аутентификация**: API токен Cloudflare (встроен в скрипт)
- **Регион**: auto (автоматический выбор)

### Технические детали

- **Скрипт деплоя**: `scripts/deploy.sh`
- **Модуль загрузки**: `scripts/upload-direct.cjs`
- **Протокол**: HTTPS с AWS4-HMAC-SHA256 подписью
- **Эндпоинт**: `https://83802fb0b9b6916c3c04c4927f3c3010.r2.cloudflarestorage.com`

## 🛠 Дополнительные команды

```bash
# Генерация постеров для видео
npm run generate-posters

# Проверка наличия ассетов
npm run check-assets
```

## 🏗 Архитектура проекта

```
vue-tiktok-landing/
├── src/
│   ├── components/          # Vue компоненты
│   ├── gameDataSets/        # Данные игр по датам
│   ├── locale/              # Файлы локализации
│   ├── types/               # TypeScript типы
│   └── utils/               # Утилиты
├── public/
│   ├── video/               # Видео файлы и постеры
│   ├── icons/               # Иконки
│   └── smiles/              # Смайлы для рейтинга
├── scripts/
│   ├── deploy.sh            # Скрипт деплоя
│   ├── upload-direct.cjs    # Модуль загрузки на R2
│   └── check-assets.js      # Проверка ассетов
└── dist/                    # Сборка (генерируется)
```

## 🔧 Технологии

- **Vue 3** - прогрессивный JavaScript фреймворк
- **Vite** - быстрый инструмент сборки
- **TypeScript** - типизированный JavaScript
- **SCSS** - препроцессор CSS
- **VueUse** - коллекция утилит для Vue
- **Cloudflare R2** - объектное хранилище для деплоя
