FROM phusion/baseimage

# Install some dependencies
RUN apt-get update && apt-get install -y \
        # Development
        build-essential \
        cmake \
        curl \
        g++ \
        git \
        make \
        m4 \
        nano \
        protobuf-compiler \
        software-properties-common \
        swig \
        unzip \
        wget \
        # Python libraries
        python \
        python-dev \
        python-pip \
        python-virtualenv \
        python-protobuf \
        python-numpy \
        # Libraries
        libatlas-base-dev \
        libffi-dev \
        libgflags-dev \
        libgtest-dev \
        libfreetype6-dev \
        libgoogle-glog-dev \
        libpq-dev \
        libssl-dev \
        libxml2-dev \
        libxslt1-dev \
        libjpeg8-dev \
        libprotobuf-dev \
        libpython-dev \
        zlib1g-dev \
		# Tools
		supervisor \
        && \
    apt-get clean && \
        apt-get autoremove && \
        rm -rf /var/lib/apt/lists/*

# Build 
# RUN cmake -DWITH_GPU=OFF -DWITH_DOC=OFF -DWITH_AVX=OFF

# Download source code and build:
RUN git clone https://github.com/baidu/Paddle paddle
WORKDIR /paddle

# you can add build option here, such as:    
RUN cmake -DWITH_GPU=OFF -DWITH_DOC=OFF -DWITH_AVX=OFF     
    
# please use sudo make install, if you want
# to install PaddlePaddle into the system
RUN make -j `nproc` && make install

RUN paddle
WORKDIR /
# RUN echo "source /usr/local/opt/paddle/bin" >> ~/.bashrc
