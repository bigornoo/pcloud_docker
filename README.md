Doc :  
- share option for docker bind volumes [here](https://medium.com/kokster/kubernetes-mount-propagation-5306c36a4a2d) and [here : Configure bind propagation](https://docs.docker.com/storage/bind-mounts/).
- capabilities needed : https://github.com/s3fs-fuse/s3fs-fuse/issues/647

Run :  
```
# docker run -ti -v /volumes/pcloud/mount/:/pcloud/:shared --cap-add SYS_ADMIN --device /dev/fuse --name pcloudcc bigorno/pcloudcc_in_docker:latest
```
Run with docker-compose :  
```
# IMAGE_TAG=latest docker-compose build
# IMAGE_TAG=vx.y.z docker-compose build
# IMAGE_TAG=latest docker-compose up [--build] -d
``` 

Please, use a file named **secret1** to store your pCloud password. And adapt _docker-compose_ file to your needs, and rename it to *docker-compose.yml*, without **template** extension.
