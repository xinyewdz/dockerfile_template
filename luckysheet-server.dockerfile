FROM java:8
COPY java-server/ /data
WORKDIR /data
ENV TZ=Asia/Shanghai
ENV redis.host=127.0.0.1 redis.port=6379 redis.password=
ENV postgroesql.host= postgroesql.port= postgroesql.user= postgroesql.password=
RUN envsubst </data/application-dev.yml.template> /data/application-dev.yml
VOLUME [ "/data/application-dev.yml" ]
EXPOSE 9004

ENTRYPOINT [ "java","-Xmx200m","-cp /data/","-jar","/data/luckysheet-server.jar"]