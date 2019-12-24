# node-apps

This setup will require setting up Docker to run an instance of MSSQL

### Setup MSSQL server on MAC with dockers container - Prerequisites

Docker Engine 1.8+ on any supported Linux distribution or Docker for Mac/Windows[Link to official site]:https://docs.microsoft.com/en-us/sql/linux/quickstart-install-connect-docker?view=sql-server-ver15&pivots=cs1-bash.
For more information, see [Install at link]:https://docs.docker.com/install/

---

#### Pull the latest image of SQL server

> > \$ `docker run -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=<STRONG_PASSWORD>' -p 1433:1433 -d mcr.microsoft.com/mssql/server:2017-latest`

#### Check SQL server container status

> > \$ `docker ps -- check the sql server status`

#### List of containers in docker

> > \$ `sudo docker ps -a`

#### Note the SQL server name on Docker container, and use the following command to start the sql server

> > \$ `Docker start keen_rosalind`
