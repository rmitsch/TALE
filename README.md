# TALE - Tool for Annotating of Low-dimensional Embeddings.

### Build Instructions

`docker build -t tale -f Dockerfile .`

Alternatively pull image from Dockerhub with

`docker pull rmitsch/tale`

### How to start

`docker run -p 2484:2484 -v [host data directory]:/data tale python /TALE-backend/source/app.py /TALE-frontend /data [experiment name] [Dropbox OAuth Token]`