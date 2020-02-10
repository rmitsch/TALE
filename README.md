# TALE - Tool for Annotating of Low-dimensional Embeddings

### Build Instructions

`docker build -t tale -f Dockerfile .`

Alternatively pull the image from Dockerhub:

`docker pull rmitsch/tale`

### Run TALE server 

`docker run -p 2484:2484 -v [host data directory]:/data tale python /TALE-backend/source/app.py /TALE-frontend /data [experiment name] [Dropbox OAuth Token]`

### Run data generation

`docker run -v [host data directory]:/data tale python /TALE-backend/source/generate_data.py [dataset name] [DR kernel name] /data`    