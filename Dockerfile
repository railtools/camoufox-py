FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Install system deps for Playwright and Camoufox (fonts, GTK, etc.)
RUN apt-get update && apt-get install -y \
    wget unzip curl gnupg \
    libnss3 libxss1 libasound2 libatk1.0-0 libatk-bridge2.0-0 libcups2 \
    libxcomposite1 libxrandr2 libgbm1 libgtk-3-0 libxdamage1 libx11-xcb1 \
    libxext6 libxfixes3 libdrm2 \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Install Playwright browsers
RUN playwright install --with-deps firefox

# Add app files
COPY . .

# Camoufox needs to fetch its fingerprints on first run
RUN python3 -m camoufox fetch

# Launch script
CMD ["python3", "main.py"]