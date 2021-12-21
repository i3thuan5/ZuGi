# ZuGi
苗栗話用个virtual host，

## Virtual Host
- 無共樣domain name，對應同IP無共樣服務。

### 好處
- 全部服務做得放共樣主機。
- 全部服務獨立，毋使因為有新服務，愛調整網址。

### 做法
用[nginx-proxy](https://github.com/nginx-proxy/nginx-proxy)，設定在`docker-compse.yml`。

## Let's Encrypt
- 自動簽SSL憑證，符合資安加密需求。
- 自動轉https服務。

### 做法
用[acme-companion](https://github.com/nginx-proxy/acme-companion)，設定在`docker-compse.yml`。
