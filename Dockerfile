FROM nginxproxy/nginx-proxy:1.5-alpine
RUN { \
      echo 'server_tokens off;'; \
      echo 'client_max_body_size 1G;'; \
      echo 'proxy_read_timeout 600s;'; \
      echo 'proxy_busy_buffers_size 64k;'; \
      echo 'proxy_buffers 4 64k;'; \
      echo 'proxy_buffer_size 32k;'; \
    } > /etc/nginx/conf.d/my_proxy.conf
