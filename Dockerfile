FROM python:2.7.13

USER root

RUN apt-get clean && apt-get update \
	&& apt-get install -y build-essential unzip \
	&& wget -O Apache-Log-Generator.zip https://github.com/bguhu/Tomcat-Apache-Log-Generator/archive/master.zip \
	&& unzip Apache-Log-Generator.zip \
	&& mv Tomcat-Apache-Log-Generator-master /apache-log-generator \
	&& rm Apache-Log-Generator.zip \
	&& cd apache-log-generator \
	&& pip install -r requirements.txt \
	&& apt-get clean \
    && rm -rf /var/lib/apt/listss/* /tmp/* /var/tmp/* \
	&& mkdir -p /var/log/apache
	
WORKDIR /apache-log-generator

CMD ["python", "apache-log-gen.py", "-o", "LOG", "-p", "/var/log/apache/apache", "-n", "0", "-s", "3"]
