# Camoufox + Playwright Scraper (Python)

Headless Firefox scraper using [Camoufox](https://github.com/cvzi/camoufox) for stealth and [Playwright](https://playwright.dev/python/) for browser automation.  
Configured for deployment on [Railway](https://railway.app) with Docker.

[![Deploy on Railway](https://railway.com/button.svg)](https://railway.com/deploy/camoufox-python?referralCode=dPr4mc)

---

## Requirements

- Python 3.11+
- Docker (for deployment)
- Railway account (optional)

---

## Local Setup

```bash
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
python -m camoufox fetch
python main.py
