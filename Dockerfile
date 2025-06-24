FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    wget unzip curl gnupg \
    libnss3 libxss1 libasound2 libatk1.0-0 libatk-bridge2.0-0 libcups2 \
    libxcomposite1 libxrandr2 libgbm1 libgtk-3-0 libxdamage1 libx11-xcb1 \
    libxext6 libxfixes3 libdrm2 libffi-dev build-essential \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements and install them
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Install Playwright browsers (includes Firefox)
RUN playwright install --with-deps firefox

# Add your project code
COPY . .

# Pre-fetch stealth models
RUN python3 -m camoufox fetch

# Command to run your script
CMD ["python3", "main.py"]