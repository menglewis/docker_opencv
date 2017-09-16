This Docker image contains
* Python 2
* OpenCV
* numpy
* scipy
* jupyterlab

Example usage mounts a local directory which is used as the Jupyterlab workspace and runs Jupyterlab on port 8888:

    docker run --rm -it -v $(pwd)/workspace:/workspace -w /workspace -p 8888:8888 menglewis/docker_opencv
