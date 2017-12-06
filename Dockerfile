FROM phusion/baseimage:0.9.17
MAINTAINER marc brown <marc@22walker.co.uk> v0.1

# Set correct environment variables.
ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive
ENV APP_NAME="MediaElch"

# Define mountable directories.
VOLUME ["/movies"]
VOLUME ["/home/mediaelch/.config/kvibes"]

# Add MediaElch Repo
RUN echo deb http://ppa.launchpad.net/kvibes/mediaelch/ubuntu xenial main >> /etc/apt/sources.list.d/mediaelch.list \
&& echo deb-src http://ppa.launchpad.net/kvibes/mediaelch/ubuntu xenial main >> /etc/apt/sources.list.d/mediaelch. \
&& apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 00DAEE81 && apt-get update \

# Install MediaElch
&& apt-get install -y mediaelch qtdeclarative5-models-plugin qml-module-qtquick-controls libqt5multimedia5-plugins \

# Create user
&& adduser --disabled-password --gecos ""  mediaelch \

#clean up
  && find /temp -mindepth 1 -delete \
  && apt-get purge -y \
  && apt-get --yes autoremove \
  && apt-get clean all \
  
CMD bash -C '/root/start.sh';'bash'
