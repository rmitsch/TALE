FROM continuumio/miniconda3

##########################################
# 1. Copy setup files into container.
##########################################

# Copy file with python requirements into container.
COPY setup/environment.yml /tmp/environment.yml
# Copy setup file.
COPY setup/setup.sh /tmp/setup.sh
# Copy corrected base.py file.
COPY setup/base.py /tmp/base.py

##########################################
# 2. Install dependencies.
##########################################

ENV PATH /opt/conda/envs/tale/bin:$PATH
RUN apt-get update && \
    # Install system dependencies.
 	apt-get -y --no-install-recommends install gcc g++ apt-utils make cmake nano && \
    # Install conda/pip depencencies; configure default environment.
	conda env create -f /tmp/environment.yml && \
    # Execute additional setup.
	chmod +x /tmp/setup.sh && sync && ./tmp/setup.sh

##########################################
# 3. Copy code.
##########################################

COPY TALE-backend /TALE-backend
COPY TALE-frontend /TALE-frontend

##########################################
# 3. Launch server.
##########################################

# Expose and launch only if this is supposed to run frontend.
EXPOSE 2484