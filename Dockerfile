
# Use an official Python runtime as the base image
FROM python:3.8 as compiler

# Set the working directory
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

RUN apt update && apt-get install default-libmysqlclient-dev gcc -y
# Install the required packages
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container
COPY . .


# Start the application
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]