#!/bin/bash
set -e

# Create the directory for MongoDB logs if it doesn't exist
mkdir -p /var/log/mongodb

# Start MongoDB in the foreground
mongod --dbpath /data/db --logpath /var/log/mongodb/mongo.log --fork

# Wait for MongoDB to start
echo "Waiting for MongoDB to start..."
sleep 10

# Restore the database dump
mongorestore --db CorkDashboard --verbose /data/dump/CorkDashboard

# Stop MongoDB to clean up the environment
mongod --dbpath /data/db --shutdown

# Start MongoDB in the foreground (container will keep running)
exec mongod --dbpath /data/db --logpath /var/log/mongodb/mongo.log
