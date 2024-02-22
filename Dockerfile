# BASE IMAGE
FROM node:20-alpine 

# ADDS GROUP AND USER  
RUN addgroup app && adduser -S -G app app

# SET WORKING DIRECTORY
WORKDIR /app


# COPY FILES FROM SOURCE TO DESTINATION
COPY package*.json ./

# CHANGE TO ROOT USER TO AVOID ACCESS DENIED
USER root

# CHANGE THE READING AND WRITING RIGHTS FOR WORKING DIRECTORY
RUN chown -R app:app ./

# CHANGE BACK TO NON ROOT USER
USER app

# EXICUTE NODE PACAKAGE INSTALL
RUN npm install

# COPY THE REST OF THE FILES TO WORKING DIR.
COPY . .


# EXPOSE PORT ON WHICH THE APP RUNS ON
EXPOSE  5173


# FINAL CMD TO RUN THE APP
CMD npm run dev

# creates build 
# docker build -t docker-react . 

# runs image 
# docker run docker-react . 

# Mapping eposed port to machines port to access the app
# docker run -p 5173:5173 docker-react

# List of all current containers
# docker ps -a 

# Stop containers
# docker stop  container name/id  

# Stop containers which are inactive
# docker container prune

# Stop any containers 
# docker rm container name/id --force  

# mounts current directory to conatiners image , v stands for volume
# docker run -p 5173:5173 -v "$(pwd):/app" -v /app/node_modules docker-react - mac
# docker run -p 5173:5173 -v "%cd%:/app" -v /app/node_modules docker-react - win
