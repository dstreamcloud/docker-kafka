FROM openjdk:8u212-jre-alpine

ENV SCALA_VERSION=2.12
ENV KAFKA_VERSION=2.5.0
ENV GLIBC_VERSION=2.31-r0

WORKDIR /workspace

COPY install.sh /workspace/install.sh
RUN chmod a+x /workspace/install.sh && /workspace/install.sh

COPY start.sh /workspace/start.sh
RUN chmod a+x /workspace/start.sh
ENTRYPOINT ["start.sh"]
