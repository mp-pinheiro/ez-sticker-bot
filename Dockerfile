FROM jrottenberg/ffmpeg:4.3-ubuntu2004

RUN apt-get update && \
    apt-get install -y python3.8 python3-pip && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . /app/
RUN pip3 install -r requirements.txt

ENTRYPOINT ["python3.8", "ezstickerbot.py"]
