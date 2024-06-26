# Specify base image (choose an appropriate Python image)
FROM python:3.12

# Set working directory
WORKDIR /app

# Copy your Python dependencies file
COPY requirements.txt ./

# Install dependencies
RUN pip install -r requirements.txt

# Copy the rest of your application code 
COPY . ./

# Expose the port your backend listens on
EXPOSE 5000  

# Command to start your backend application
CMD ["python", "src/main.py"]  # Replace 'app.py' with your main file
