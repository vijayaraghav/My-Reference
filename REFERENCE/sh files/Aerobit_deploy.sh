#!/bin/bash

CONTAINERNAME='aerobit_node'
IMAGENAME='aerobit_node'
PORT='8000'
IP='54.174.114.151'

#APPPATH=$(cd /home/10d/geofence/android-poc)

#DELETINGIMAGE=$(sudo docker ps -a | awk '{ print $1,$2 }' | grep $IMAGENAME | awk '{print $1 }' | xargs -I {} docker rm {})
#DELETINGCONTAINER=$(sudo docker rm -f $CONTAINERNAME)

CONTAINER=$(sudo docker ps -aq -f status=running -f name=$CONTAINERNAME)
IMAGE=$(sudo docker ps -a | awk '{ print $1,$2 }' | grep $IMAGENAME | awk '{print $1 }')

#CREATINGIMAGE=$(sudo docker build -t $IMAGENAME .)
#CREATINGCONTAINER=$(sudo docker run --name $CONTAINERNAME -h $CONTAINERNAME -p $PORT:$PORT $IMAGENAME)

echo "Runing....."

updating_code () {

cd /home/aerobit/aerobit/Aerobit

git pull https://AshwinAchu10:achu6577@gitlab.com/10decoders/Aerobit.git

echo "Code updated sucessfully....."

}

delete_existing () {

if [  "$CONTAINER" ];
then
  echo "Deleting aerobit_node Container"
  #echo "To confirm Press ENTER"
  #echo "To cancel Press Ctrl+C"
  #read
  docker rm -f $CONTAINERNAME
  echo "Deleted ....."
else
  echo "aerobit_node Container is not available"
fi

if [ ! "$IMAGE" ];
then
  echo "aerobit_node Image is not available"
else
  echo "aerobit_node Container is not available"
fi

if [ ! "$IMAGE" ];
then
  echo "aerobit_node Image is not available"
else
  echo "Deleting aerobit_node Image"
  #echo "To confirm Press ENTER"
  #echo "To cancel Press Ctrl+C"
  #read
  docker rmi -f $IMAGENAME
  #docker ps -a | awk '{ print $1,$2 }' | grep $IMAGENAME | awk '{print $1 }' | xargs -I {} docker rm {}
  echo "Deleted...."
fi

}

deploying_app () {

cd ~

cd /home/aerobit/aerobit/Aerobit/Aerobit_Actual

docker build -t $IMAGENAME .

echo "Directory changed to App Location"

eval $CREATINGIMAGE

echo "image build sucessfully"

docker run --name $CONTAINERNAME -d -h $CONTAINERNAME -p $PORT:$PORT $IMAGENAME

echo "App Container created and the Application is running in http://$IP:$PORT/ "

echo "DEPLOYMENT FINISHED ......."

}

updating_code
delete_existing
deploying_app