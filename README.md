Doc :  
- share option for docker bind volumes [here](https://stackoverflow.com/questions/48407184/gcsfuse-on-datalab-vm-machine-error-fusermount-fuse-device-not-found-try-mo)
- capabilities needed : https://github.com/s3fs-fuse/s3fs-fuse/issues/647

Run :  
```
# docker run -ti -v /volumes/pcloud/mount/:/pcloud/:shared --cap-add SYS_ADMIN --device /dev/fuse --name pcloudcc bigorno/pcloudcc_in_docker:latest bash
```
Run :  
```
# IMAGE_TAG=latest docker-compose build
# IMAGE_TAG=vx.y.z docker-compose build
# IMAGE_TAG=latest docker-compose up -d
``` 
