# Use official lightweight Python image
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Install required system packages
RUN apt-get update && apt-get install -y git ffmpeg

# Install FastAPI server dependencies
RUN pip install uvicorn fastapi

# Clone fish-speech repo
RUN git clone https://github.com/fishaudio/fish-speech.git

# Set working directory to actual API folder
WORKDIR /app/fish-speech/server

# Install Python requirements from correct path
RUN pip install -r requirements.txt

# Expose the port used by Uvicorn
EXPOSE 8080

# Run the fish-speech API
CMD ["uvicorn", "api:app", "--host", "0.0.0.0", "--port", "8080"]
