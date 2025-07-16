FROM python:3.10-slim

WORKDIR /app

# Install system deps
RUN apt-get update && apt-get install -y git ffmpeg

# Clone fish-speech and install
RUN git clone https://github.com/fishaudio/fish-speech.git .
RUN pip install -e .[stable]

EXPOSE 7860

CMD ["./entrypoint.sh"]
