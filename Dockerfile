FROM nginxproxy/nginx-proxy
RUN { \
      echo 'server_tokens off;'; \
      echo 'client_max_body_size 1G;'; \
      echo 'deny 140.115.51.153;'; \
    } > /etc/nginx/conf.d/my_proxy.conf
