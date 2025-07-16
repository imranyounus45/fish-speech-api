FROM python:3.10-bullseye

WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    ffmpeg \
    libasound-dev \
    portaudio19-dev \
    libportaudio2 \
    libportaudiocpp0 \
    libffi-dev \
    gcc \
    g++ \
    make \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

# Clone fish-speech CLI tools
RUN git clone https://github.com/fishaudio/fish-speech.git /app/fish-speech

# Copy your FastAPI app and other code
COPY ./app ./app
COPY ./models ./models
COPY requirements.txt .

# Install dependencies
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# ✅ Switch to your FastAPI app directory so `app.main` works
WORKDIR /app

EXPOSE 7860
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "7860"]
