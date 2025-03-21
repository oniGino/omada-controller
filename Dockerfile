FROM alpine:latest

LABEL com.tp-link.title="omada-controller"
LABEL com.tp-link.vendor="TP Link"
LABEL version="5.15.8.2"
ENV OMADA_URL="https://static.tp-link.com/upload/software/2025/202501/20250109/Omada_SDN_Controller_v5.15.8.2_linux_x64.tar.gz" 

#Setup MongoDB
RUN echo 'http://dl-cdn.alpinelinux.org/alpine/v3.9/main' >> /etc/apk/repositories
RUN echo 'http://dl-cdn.alpinelinux.org/alpine/v3.9/community' >> /etc/apk/repositories
RUN apk --no-cache add mongodb mongodb-tools

#Setup Omada
RUN apk --no-cache add openjdk17-jre-headless jsvc curl bash 
RUN curl -o install.tar.gz ${OMADA_URL} && \
    mkdir /Omada_Install && \
    tar --strip-components=1 -xvf install.tar.gz -C /Omada_Install && \
    cd /Omada_Install/ && \
    ./install.sh -y | tee /omada_install.log && \
    rm -r /Omada_Install /install.tar.gz

EXPOSE 8088/tcp
EXPOSE 8043/tcp

COPY --chmod=0775 entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]

HEALTHCHECK --interval=5m --timeout=3s \
  CMD curl -f http://localhost:8088/ || exit 1
