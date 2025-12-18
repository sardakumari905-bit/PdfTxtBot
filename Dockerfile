FROM python:3.10-slim

# अपडेट करने और जरूरी फाइल्स डालने का नया तरीका
RUN apt-get update -qq && apt-get install -y --no-install-recommends \
    build-essential \
    python3-dev \
    gcc \
    &>/dev/null && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# पहले केवल requirements इंस्टॉल करें (कैश के लिए बेहतर है)
COPY requirements.txt .
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

# अब सारा कोड कॉपी करें
COPY . .

# मुख्य फाइल को चलाने की कमांड (चेक करें कि आपके कोड में main.py है या bot.py)
CMD ["python3", "main.py"]
