FROM fsmflying/jdk8-alpine:v1
ENV TZ=Asia/Shanghai
ENV JAVA_OPTS=""
#ENV SPRING_PROFILES_ACTIVE=""
VOLUME /tmp
ADD spring-cloud-eureka-01.jar spring-cloud-eureka-01.jar
EXPOSE 8761
ENTRYPOINT exec java $JAVA_OPTS -jar /spring-cloud-eureka-01.jar
#ENTRYPOINT exec java $JAVA_OPTS -Dspring.profiles.active=${SPRING_PROFILES_ACTIVE} -jar /spring-cloud-eureka-01.jar
