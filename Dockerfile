FROM python:3.8-slim-buster

RUN apt-get update && \
    apt-get install -y build-essential libffi-dev libssl-dev zlib1g-dev libjpeg-dev ffmpeg && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["python", "ezstickerbot.py"]
