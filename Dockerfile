FROM debian:jessie

RUN apt-get update
RUN apt-get install -y --no-install-recommends \
                        fftw3-dev \
                        wget \
                        make \
                        g++

RUN wget -P /tmp http://www.bi.cs.titech.ac.jp/megadock/archives/megadock-4.0.2.tgz && \
    tar xvf /tmp/megadock-4.0.2.tgz -C /opt &&
    rm /tmp/megadock-4.0.2.tgz
COPY Makefile /opt/megadock-4.0.2/Makefile
RUN cd /opt/megadock-4.0.2 && make