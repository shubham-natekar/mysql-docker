# mysql-docker
1) test.sql file:

In the test.sql file, I have created the commands for creating a database and user and also create a table with some default values.
So when we start the container we can assess the pucsdStudent database with pucsd user and pucsd password.

2) Dockerfile :

In the docker file, I have mentioned only two commands :
FROM mysql : create MySQL custom docker image.
COPY ./test.sql /docker-entrypoint-initdb.d/: This cmd will copy the test.sql file from local directory to docker image which we are creating .
When we create mysql docker container then my scripts in the /docker-entrypoint-initdb.d will be executed automatically on startup.

3) How to Run:

` shubham $ sudo docker build -t mysql-server . `
This cmd build the custom image of mysql-server.
build is used to create docker image.  
-t <image_name:version>  is for image tag
Finally  ‘.’ for Dockerfile path

` shubham $ sudo docker run -d --name mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=shubham mysql-server `
run cmd create the container from Docker image.
-d is for detaching mode it's run the container in the background.
--name <container_name> is give name to the container.
-e ENV_VAR is create the environment variable in a container.

` shubham $ sudo docker logs mysql `

This cmd check the logs of the container.

` shubham $ sudo docker exec -it mysql bash `
In the end, we can connect to the container using exec cmd.
After the container start, we can use the MySql service:
```
root# mysql pucsdStudent -u pucsd -p
root# Enter Password (pucsd)
```

