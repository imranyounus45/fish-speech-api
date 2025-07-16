# Based on official fish-speech repo dockerfile
FROM python:3.10-slim

WORKDIR /fish-speech

# Install dependencies
RUN apt-get update && apt-get install -y ffmpeg git && rm -rf /var/lib/apt/lists/*

# Clone official repo
RUN git clone --depth 1 https://github.com/fishaudio/fish-speech.git .

# Install Python requirements
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Expose default port (choose, e.g., 5000)
EXPOSE 8000

# Run their API entrypoint
CMD ["python", "tools/start_api.py", "--host", "0.0.0.0", "--port", "5000"]
