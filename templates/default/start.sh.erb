#/bin/bash

# Start nexus
sudo docker stop nexus
sudo docker rm nexus
sudo docker run -d --name nexus --volumes-from data -p 8081:8081 conceptnotfound/sonatype-nexus

# Start jenkins
sudo docker stop jenkins
sudo docker rm jenkins
sudo docker run -d --name jenkins --volumes-from data --link nexus:nexus -p 8080:8080 -u root jenkins