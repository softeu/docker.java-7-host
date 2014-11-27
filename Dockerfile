FROM softeu/ubuntu-base

MAINTAINER Jindrich Vimr <jvimr@softeu.com>


RUN apt-get update && apt-get install -y --no-install-recommends openjdk-7-jdk openjdk-6-jdk
RUN apt-get update && apt-get install -y maven2 maven ant ruby rbenv make software-properties-common

RUN add-apt-repository -y ppa:webupd8team/java && apt-get -qq update

RUN echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true |  /usr/bin/debconf-set-selections

RUN apt-get -qqy install oracle-java7-installer oracle-java6-installer



ENV JAVA_HOME /usr/lib/jvm/java-7-oracle/

#flexibee certs
COPY FlexiBee-cacert.crt /FlexiBee-cacert.crt

RUN keytool   -keystore $JAVA_HOME/jre/lib/security/cacerts   -storepass changeit  -importcert -trustcacerts -alias flexibee-ca -file /FlexiBee-cacert.crt -noprompt



