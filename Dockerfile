FROM nginxproxy/nginx-proxy:1.5-alpine
RUN { \
      echo 'server_tokens off;'; \
      echo 'client_max_body_size 1G;'; \
      echo 'proxy_read_timeout 600s;'; \
    } > /etc/nginx/conf.d/my_proxy.conf
