
# Use an official Python runtime as the base image
FROM python:3.8 as compiler

# Set the working directory
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Install the required packages
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container
COPY . .

# Run migrations
RUN python manage.py makemigrations
RUN python manage.py migrate

# Start the application
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]