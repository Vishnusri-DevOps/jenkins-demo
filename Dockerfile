# Use base Python image
FROM python:3.9

# Set the working directory inside the container
WORKDIR /app

# Copy all files into the container
COPY . /app

# Install dependencies
RUN pip install -r requirements.txt

# Run the Flask app
CMD ["python", "app.py"]
