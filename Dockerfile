FROM continuumio/miniconda:4.3.14

ENV TINI_VERSION=v0.16.1

ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y libgtk2.0-dev pkg-config libavcodec-dev   \
    libavformat-dev libswscale-dev libtbb2    \
    libtbb-dev libjpeg-dev libpng-dev openexr \
    libtiff-dev libjasper-dev libdc1394-22-dev

RUN ldconfig

RUN conda install -y numpy scipy
RUN conda install -c menpo opencv
RUN pip install jupyterlab && jupyter serverextension enable --py jupyterlab --sys-prefix

RUN mkdir /root/.jupyter
COPY jupyter_notebook_config.py /root/.jupyter/jupyter_notebook_config.py

EXPOSE 8888

ENTRYPOINT ["/tini", "--"]
CMD ["jupyter", "lab", "--allow-root", "--no-browser", "--ip=0.0.0.0"]
