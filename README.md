# 🚀 Internet Speed Test

## 📖 Описание проекта

**Internet Speed Test** — это современное WPF-приложение для тестирования скорости интернет-соединения. Приложение позволяет измерить скорость загрузки, отдачи, а также время отклика (ping) до различных популярных серверов. Поддерживает смену тем оформления и экспорт истории тестов в формат JSON.

---

## 🔑 Основные функции

- Автоматический выбор лучшего сервера для тестирования
- Измерение:
  - 🔻 Скорости загрузки
  - 🔺 Скорости отдачи
  - 📶 Времени отклика (ping)
- Отображение прогресса в реальном времени
- Поддержка светлой, серой и тёмной темы
- Экспорт истории тестов в `.json`

---

## 🛠 Используемые технологии

- Язык программирования: C#
- Фреймворк: .NET (WPF)
- MVVM: CommunityToolkit.Mvvm
- Работа с сетью: `HttpClient`, `Ping`
- Стилизация: кастомные темы

---

## 🗂 Структура проекта

- `MainViewModel.cs` — основная бизнес-логика
- `App.xaml` — ресурсы и стили
- `MainWindow.xaml` — главное окно с UI
- `speed_test_history.json` — файл для экспорта истории

---

## ▶️ Использование

1. Запустите приложение.
2. Нажмите **"Начать тестирование"**.
3. Дождитесь завершения анализа.
4. Результаты отобразятся на экране и будут сохранены в истории.
5. Вы можете экспортировать историю в JSON-файл.

---

## 🔮 Планы на будущее

- ✅ Расширенная аналитика по истории тестов
- ✅ Доработка мобильного приложения на **.NET MAUI** для Android/iOS
- ✅ Синхронизация истории между устройствами

---

## 📷 Скриншоты

![image](https://github.com/user-attachments/assets/60d714ca-41f0-40d1-ac96-59466c58bfa6)
![image](https://github.com/user-attachments/assets/0d3a7f3e-f443-473d-9ed7-621b4cccc6d1)



---

## 🗃 Пример истории в JSON

```json
[
  {
    "Timestamp": "2025-07-03T10:00:00",
    "DownloadSpeed": 84.21,
    "UploadSpeed": 33.68,
    "Ping": 21
  }
]
