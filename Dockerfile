FROM rocker/hadleyverse
MAINTAINER "Jonathan Owen" jonathanro@gmail.com

# Install Java.
RUN \
  echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java7-installer && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk7-installer

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-7-oracle

# Fetch h2o mirzakhani
RUN \
  wget http://h2o-release.s3.amazonaws.com/h2o/rel-noether/4/h2o-2.8.4.4.zip -O /opt/h2o.zip && \
  unzip -d /opt /opt/h2o.zip && \
  rm /opt/h2o.zip && \
  cd /opt && \
  cd `find . -name 'h2o.jar' | sed 's/.\///;s/\/h2o.jar//g'` && \ 
  cp h2o.jar /opt && \
  wget https://s3.amazonaws.com/h2o-training/mnist/train.csv.gz && \
  gunzip train.csv.gz 

EXPOSE 54321
EXPOSE 54322

# install caret related packages
RUN install2.r --error \
    RCurl \
    rjson \
    statmod \
    survival \
    stats \
    tools \
    utils \
    methods \
    h2o \
&& rm -rf /tmp/downloaded_packages/ /tmp/*.rds
