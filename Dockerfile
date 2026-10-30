FROM nginxproxy/nginx-proxy:1.11.6-alpine@sha256:99376e95c8754547213d411222a2c4dca046d974e753ae2a1c9aef09b2c03364
RUN { \
      echo 'server_tokens off;'; \
      echo 'client_max_body_size 1G;'; \
      echo 'proxy_read_timeout 600s;'; \
      echo 'proxy_busy_buffers_size 64k;'; \
      echo 'proxy_buffers 4 64k;'; \
      echo 'proxy_buffer_size 32k;'; \
    } > /etc/nginx/conf.d/my_proxy.conf
