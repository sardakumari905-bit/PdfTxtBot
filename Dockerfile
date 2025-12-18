FROM python:3.10-slim-buster

# सिस्टम के ज़रूरी टूल्स इंस्टॉल करें
RUN apt-get update && apt-get install -y \
    build-essential \
    libffi-dev \
    libssl-dev \
    python3-dev \
    gcc \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Requirements इंस्टॉल करें
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# बाकी कोड कॉपी करें
COPY . .

# बॉट शुरू करने की कमांड
CMD ["python3", "main.py"]
