# Use a base image with Python for Windows
FROM python:alpine
# Set environment variables for Flask
ENV FLASK_APP=main.py
ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_RUN_PORT=80

# Create and set the working directory in the container
WORKDIR D:\Article-Generator

COPY node_modules .\node_modules
COPY static .\static
COPY templates .\templates
COPY venv .\venv
COPY Dockerfile .\Dockerfile
COPY main.py .\main.py
COPY package-lock.json .\package-lock.json
COPY package.json .\package.json
COPY requirements.txt .\requirements.txt
COPY tailwind.config.js .\tailwind.config.js

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt





# Expose port 80 for the Flask app
EXPOSE 80

# Command to run your Flask application
CMD ["flask", "run"]
