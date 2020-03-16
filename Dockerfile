FROM debian:buster

RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get -y install \
	nginx \
	libnginx-mod-rtmp && \
    rm -rf /tmp/* /var/lib/apt/lists/* /var/cache/apt/*

COPY nginx.conf /etc/nginx/nginx.conf
RUN nginx -T

EXPOSE 1935

STOPSIGNAL SIGTERM

CMD ["nginx", "-g", "daemon off;"]
