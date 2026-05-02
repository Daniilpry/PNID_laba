FROM python:3.11-slim

WORKDIR /app

# Спочатку копіюємо requirements, щоб кешувати шари
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Копіюємо решту файлів
COPY . .

# Вказуємо шлях до модулів
ENV PYTHONPATH=/app

# При запуску контейнера будуть виконуватися тести
CMD ["pytest", "tests/"]