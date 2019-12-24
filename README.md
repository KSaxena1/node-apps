# node-apps

===========

This setup will require setting up Docker to run an instance of MSSQL

### Setup MSSQL server on MAC with dockers container - Prerequisites

Docker Engine 1.8+ on any supported Linux distribution or Docker for Mac/Windows. For more information, see Install at link] (https://docs.docker.com/install/). 1. Minimum of 2 GB of disk space. 2. Minimum of 2 GB of RAM.

---

### Pull the latest image of SQL server

## docker run -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=<STRONG_PASSWORD>' -p 1433:1433 -d mcr.microsoft.com/mssql/server:2017-latest

### Check SQL server container status

docker ps -- check the sql server status

### List of containers in docker

sudo docker ps -a

Docker container name for SQL sever
keen_rosalind

\$Docker start keen_rosalind
