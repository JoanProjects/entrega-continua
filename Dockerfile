# Use an official lightweight Python image
FROM python:3.12-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements file first to leverage Docker cache
COPY requirements.txt .

# Install the dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

# Expose the port (for documentation purposes, Render manages the actual port)
EXPOSE 5000

# Command to run the application using Gunicorn.
# This binds to the PORT environment variable provided by Render.
CMD ["gunicorn", "--bind", "0.0.0.0:${PORT}", "app:app"]