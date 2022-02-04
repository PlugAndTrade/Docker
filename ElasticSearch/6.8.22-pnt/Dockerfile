FROM elasticsearch:6.8.22

MAINTAINER Mihaly Bak <mihaly@plug-n-trade.com>

RUN apk update
RUN apk add zip

RUN zip -q -d /elasticsearch/lib/log4j-core-*.jar org/apache/logging/log4j/core/lookup/JndiLookup.class


CMD ["/run.sh"]