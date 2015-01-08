#/bin/bash

archive=$1

if [ -z "$archive" ]; then
  echo "No archive provided."
  echo "Usage: $0 archive.tar"
  exit
fi

echo "Loading from $archive"

# Clean up any old stuff here
sudo docker rm data

# Start new data container
echo "Starting new  rdata container"
sudo docker run -d --name data -v /var/jenkins_home -v /nexus busybox true

# Copy in files from old data container
echo "Restoring old files into new data"
sudo docker rm restore
sudo docker run --name restore --volumes-from data -v $(pwd):/backup busybox tar xvf /backup/$archive
sudo docker rm restore