# paddle-docker
This is a Docker image for Baidu's deep learning framework [Paddle](https://github.com/baidu/Paddle).

While they have an official Docker image available, I had difficulty running it directly. The precompiled binaries in the image expect your machine to have AVX instruction set; if you don't you'll have to build from the source. That is what this Dockerfile does. It builds Paddle from the source files.

Note that is only the CPU build. It is available on Docker Hub at [https://hub.docker.com/r/floydhub/paddle-cpu/](https://hub.docker.com/r/floydhub/paddle-cpu/). If you need a GPU version, please follow the instructions on Paddle's docs to modify this Dockerfile: [http://www.paddlepaddle.org/doc/build/docker_install.html](http://www.paddlepaddle.org/doc/build/docker_install.html)
