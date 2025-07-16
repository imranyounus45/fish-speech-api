# Dockerfile
FROM python:3.10-slim
WORKDIR /app

# Install git and dependencies
RUN apt-get update && apt-get install -y git

# Install Python web server packages
RUN pip install uvicorn fastapi

# Clone fish-speech repo
RUN git clone https://github.com/fishaudio/fish-speech.git .

# Install fish-speech requirements
RUN pip install -r requirements.txt

EXPOSE 8080

# Run the API server
CMD ["uvicorn", "fishaudio.api:app", "--host", "0.0.0.0", "--port", "8080"]
