ARG version="latest"
FROM nginx:${version}

LABEL maintainir="Lionel GOUNE"

RUN apt-get update && \
    apt-get install -y git \
    && apt-clean \
    && rm-rf /var/lib/apt/list/

RUN rm -rf /usr/share/nginx/html/* \
    && git clone https://github.com/diranetafen/static-website-example.git /usr/share/nginx/html/

EXPOSE 80

ENTRYPOINT [ "/usr/sbin/nginx", "-g", "daemon off;"]