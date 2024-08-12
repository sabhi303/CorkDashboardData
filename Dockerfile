# Use the official MongoDB image from the Docker Hub
FROM mongo:latest

# Set the working directory
WORKDIR /data

# Copy MongoDB dump folder to the container
COPY CorkDashboard /data/dump/CorkDashboard

# Copy the entrypoint script into the container
COPY entrypoint.sh /entrypoint.sh

# Make the entrypoint script executable
RUN chmod +x /entrypoint.sh

# Expose MongoDB port
EXPOSE 27017

# Run the entrypoint script
CMD ["/entrypoint.sh"]
