FROM frolvlad/alpine-glibc:alpine-3.7

###### DISCLAIMER ######
#
# You must accept the Oracle Binary Code License Agreement for Java SE to use this image.
#
# Link to License: http://www.oracle.com/technetwork/java/javase/terms/license/index.html
#
###### DISCLAIMER ######

# Set java enviroment
ENV LANG=C.UTF-8 \ 
	JAVA_VERSION=8 \
	JAVA_UPDATE=172 \
	JAVA_BUILD=11 \
	JAVA_PATH=a58eab1ec242421181065cdc37240b08 \
	JAVA_TYPE=jre

ENV JAVA_HOME="/opt/java/${JAVA_TYPE}1.${JAVA_VERSION}.0_${JAVA_UPDATE}" \ 
	JAVA_TAR="${JAVA_TYPE}-${JAVA_VERSION}u${JAVA_UPDATE}-linux-x64.tar.gz"

# Download oracle jre -> extract it -> add app user & group -> cleanup
# You can use USER 'app' for you app
RUN cd "/tmp" \
	&& apk add --no-cache --virtual=build-dependencies wget ca-certificates \
	&& mkdir -p $JAVA_HOME \
	&& wget --header "Cookie: oraclelicense=accept-securebackup-cookie;" \
	--progress=dot:mega --tries=10 "http://download.oracle.com/otn-pub/java/jdk/${JAVA_VERSION}u${JAVA_UPDATE}-b${JAVA_BUILD}/${JAVA_PATH}/${JAVA_TAR}" \ 
	&& tar -xzf $JAVA_TAR -C /opt/java \
	&& addgroup -g 1000 -S app \
	&& adduser -u 1000 -S app -G app \
	&& ln -s $JAVA_HOME $JAVA_HOME/bin/* /usr/bin/ \
	&& rm -rf $JAVA_HOME/*src.zip \
	$JAVA_HOME/lib/missioncontrol \
	$JAVA_HOME/lib/visualvm \
	$JAVA_HOME/lib/*javafx* \
	$JAVA_HOME/lib/plugin.jar \
	$JAVA_HOME/lib/ext/jfxrt.jar \
	$JAVA_HOME/bin/javaws \
	$JAVA_HOME/lib/javaws.jar \
	$JAVA_HOME/lib/desktop \
	$JAVA_HOME/plugin \
	$JAVA_HOME/lib/deploy* \
	$JAVA_HOME/lib/*javafx* \
	$JAVA_HOME/lib/*jfx* \
	$JAVA_HOME/lib/amd64/libdecora_sse.so \
	$JAVA_HOME/lib/amd64/libprism_*.so \
	$JAVA_HOME/lib/amd64/libfxplugins.so \
	$JAVA_HOME/lib/amd64/libglass.so \
	$JAVA_HOME/lib/amd64/libgstreamer-lite.so \
	$JAVA_HOME/lib/amd64/libjavafx*.so \
	$JAVA_HOME/lib/amd64/libjfx*.so \
	$JAVA_HOME/bin/jjs \ 
	$JAVA_HOME/bin/keytool \
	$JAVA_HOME/bin/orbd \
	$JAVA_HOME/bin/pack200 \
	$JAVA_HOME/bin/policytool \
	$JAVA_HOME/bin/rmid \
	$JAVA_HOME/bin/rmiregistry \
	$JAVA_HOME/bin/servertool \
	$JAVA_HOME/bin/tnameserv \
	$JAVA_HOME/bin/unpack200 \
	$JAVA_HOME/lib/ext/nashorn.jar \
	$JAVA_HOME/lib/jfr.jar \
	$JAVA_HOME/lib/jfr \
	$JAVA_HOME/lib/oblique-fonts \
	&& apk del build-dependencies \
    && rm -rf /tmp/* \
    && rm -rf /var/cache/apk/*

# Add java to path
ENV PATH $PATH:$JAVA_HOME/bin
