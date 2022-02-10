
FROM techblog/fastapi:latest

LABEL maintainer="baileycw15@gmail.com"
ENV DEEPSTACK_HOST_ADDRESS="http://192.168.50.37:5255"
ENV DEEPSTACK_API_KEY="s4SXKDbL28zBjsyfC52W"
ENV MIN_CONFIDANCE=0.70
ENV PYTHONIOENCODING=utf-8
ENV LANG=C.UTF-8

RUN apt update -yqq

RUN apt -y install python3-pip
    
RUN  pip3 install --upgrade pip --no-cache-dir && \
     pip3 install --upgrade setuptools --no-cache-dir
     
RUN mkdir -p /opt/trainer/photos/uploads
RUN mkdir -p /opt/trainer/db
 
COPY trainer /opt/trainer
 
EXPOSE 8080
 
WORKDIR /opt/trainer/
 
ENTRYPOINT ["/usr/bin/python3", "trainer.py"]
