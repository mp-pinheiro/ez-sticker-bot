# Use a multi-platform base image that supports both amd64 and aarch64
FROM python:3.8-slim-buster AS base

# Use the jrottenberg/ffmpeg image for FFmpeg
FROM jrottenberg/ffmpeg:4.3-vaapi AS ffmpeg

# Set the working directory for the ffmpeg stage
WORKDIR /ffmpeg

# Copy the FFmpeg binaries from the ffmpeg stage to the final stage
FROM base AS final
WORKDIR /app
COPY --from=ffmpeg /usr/local/bin/ /usr/local/bin/

# Copy the requirements file and install the dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

# Set the command to run the application
CMD ["python", "ezstickerbot.py"]