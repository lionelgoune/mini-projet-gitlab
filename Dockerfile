ARG version="latest"
FROM nginx:${version}

LABEL maintainer="Lionel GOUNE"

RUN apt-get update && \
    apt-get install -y --no-install-recommends git && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /usr/share/nginx/html/* && \
    git clone --depth 1 https://github.com/diranetafen/static-website-example.git /usr/share/nginx/html/ && \
    rm -rf /usr/share/nginx/html/.git

EXPOSE 80

ENTRYPOINT ["/usr/sbin/nginx", "-g", "daemon off;"]