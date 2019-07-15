FROM biohaz/basic_ubuntu:V1

#MAINTAINER BioH4z <https://github.com/BioH4z>

# Set the working directory to /home
WORKDIR /home

# Set shell for conda
SHELL ["/bin/bash", "-c"] 

#set User ROOT
USER root

# config problems about region and time 
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

# install libraries
RUN apt-get install -y fastqc \
        && pip3 install --user --upgrade cutadapt \
	multiqc
	

RUN curl -fsSL https://github.com/FelixKrueger/TrimGalore/archive/0.6.0.tar.gz -o trim_galore.tar.gz \
	&& tar xvzf trim_galore.tar.gz \
	&& ln -sf /root/.local/bin/cutadapt /usr/local/bin \
	&& ln -sf /root/.local/bin/multiqc /usr/local/bin \
	&& rm trim_galore.tar.gz
