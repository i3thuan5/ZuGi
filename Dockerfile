FROM nginxproxy/nginx-proxy
RUN { \
      echo 'client_max_body_size 500m;'; \
    } > /etc/nginx/conf.d/my_proxy.conf
