FROM nginx:1.31.10-alpine@sha256:7fc0fb4af7bf006aeb31aea88069976060f8f0a0a86b667126742cc17f4e31ae

RUN sed -i 's/worker_connections.*;$/worker_connections  10240;/' /etc/nginx/nginx.conf \
    && grep -q 'worker_connections  10240;' /etc/nginx/nginx.conf \
    && echo 'worker_rlimit_nofile 20480;' >> /etc/nginx/nginx.conf

RUN mkdir -p /etc/nginx/zugi.d && { \
      echo 'server_tokens off;'; \
      echo 'client_max_body_size 1G;'; \
      echo 'proxy_read_timeout 600s;'; \
      echo 'proxy_busy_buffers_size 64k;'; \
      echo 'proxy_buffers 4 64k;'; \
      echo 'proxy_buffer_size 32k;'; \
    } > /etc/nginx/zugi.d/my_proxy.conf \
    && sed -i 's|include /etc/nginx/conf.d/\*\.conf;|include /etc/nginx/zugi.d/*.conf; &|' /etc/nginx/nginx.conf \
    && grep -q 'include /etc/nginx/zugi.d/\*\.conf; include /etc/nginx/conf.d/\*\.conf;' /etc/nginx/nginx.conf
