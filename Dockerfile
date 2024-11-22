FROM nginxproxy/nginx-proxy:1.5-alpine
RUN { \
      echo 'server_tokens off;'; \
      echo 'client_max_body_size 1G;'; \
      echo 'proxy_read_timeout 600s;'; \
      echo 'deny 36.224.0.45;'; \
      echo 'deny 36.224.54.158;'; \
    } > /etc/nginx/conf.d/my_proxy.conf
