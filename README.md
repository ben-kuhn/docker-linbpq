# docker-linbpq
Docker LinBPQ

This project uses docker and docker-compose for management. https://docs.docker.com/compose/

# Getting Started

Download this project and unzip it: https://github.com/ben-kuhn/docker-linbpq/archive/master.zip

# Running

Edit the file `bpq32.cfg` and put it in the directory you have mounted to /opt/linbpq in the container
run `docker-compose up -d` to start.

# Updating

Updating is as simple as `docker-compose build; docker-compose down; docker-compose up -d`

# Building

If you'd like to build locally, just run `docker-compose build`

