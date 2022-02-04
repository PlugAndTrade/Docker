FROM docker.elastic.co/elasticsearch/elasticsearch:6.8.22

MAINTAINER Joel Gullander <jag@joelgullander.se>

RUN apk update
RUN apk add zip

RUN zip -q -d /elasticsearch/lib/log4j-core-*.jar org/apache/logging/log4j/core/lookup/JndiLookup.class


CMD ["/run.sh"]