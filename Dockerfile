ARG BASE_CONTAINER=jupyter/scipy-notebook
ARG NB_USER="neoma-imperial"
FROM $BASE_CONTAINER

USER root

COPY /. /.

RUN  apt-get update && \
    apt-get install emacs -y && \
    apt-get install lsof -y && \
    apt-get install -y git-core && \
    pip install -r /requirements.txt

RUN rmdir work && \
	mkdir /home/$NB_USER/data && \
    fix-permissions /home/$NB_USER

COPY /notebook/. /home/$NB_USER/.

WORKDIR /home/$NB_USER

USER $NB_USER