# Fingerprint Bot Detection

Простое Vue.js приложение для проверки, является ли текущий браузер ботом, используя сервис [Fingerprint](https://fingerprint.com/).

## Функциональность

Приложение проверяет следующие параметры:
- Обнаружение ботов (Bot Detection)
- Спуфинг локации (Location Spoofing)
- Подозрительный скор (Suspect Score)

## Установка и запуск

1. Клонируйте репозиторий:
```bash
git clone <repository-url>
cd fingerprint-vue-demo
```

2. Создайте файл `.env` в корне проекта и добавьте ваши ключи:
```env
VITE_FINGERPRINT_API_KEY=your_api_key_here
VITE_FINGERPRINT_SERVER_KEY=your_server_key_here
```

3. Запустите через Docker:
```bash
docker-compose up --build
```

Приложение будет доступно по адресу: http://localhost:4999

## Разработка

Для локальной разработки:

1. Установите зависимости:
```bash
npm install
```

2. Запустите dev-сервер:
```bash
npm run dev
```

## Результат

Приложение возвращает div id="check# с результатами проверки:
```
```

## Требования

- Node.js 18+
- Docker (опционально)
- Ключи Fingerprint API (API Key и Server Key) 