# ZuGi
用nginx-proxy个docker管理virtual host。

## 用法
```
docker compose up -d --build
```

## 基本名詞說明

### Virtual Host
- 無共樣domain name，對應同IP無共樣服務。

#### 好處
- 全部服務做得放共樣主機。
- 全部服務獨立，毋使因為有新服務，愛調整網址。

#### 做法
用[nginx-proxy](https://github.com/nginx-proxy/nginx-proxy)，設定在`docker-compose.yml`。

### Let's Encrypt
- 自動簽SSL憑證，符合資安加密需求。
- 自動轉https服務。

#### 做法
用[acme-companion](https://github.com/nginx-proxy/acme-companion)，設定在`docker-compose.yml`。

### 容器架構
- `nginx-proxy`：官方nginx，對外開80、443。無掛Docker socket。
- `nginx-proxy-gen`：[docker-gen](https://github.com/nginx-proxy/nginx-proxy/blob/main/docs/README.md#separate-containers)，看Docker事件產生nginx設定，通知`nginx-proxy` reload。無接任何網路。
- `nginx-proxy-acme`：acme-companion，簽SSL憑證。
- Docker socket干焦`nginx-proxy-gen`佮`nginx-proxy-acme`有掛，攏是唯讀。

#### 注意
- `nginx-proxy-gen`負責產生動態設定，所以會影響nginx設定的環境變數（親像`ENABLE_HTTP2`、`TRUST_DOWNSTREAM_PROXY`），愛設佇`nginx-proxy-gen`。
- ZuGi ê nginx設定（`client_max_body_size`等）佇`Dockerfile`，囥`/etc/nginx/zugi.d/`。

### 維護頁面
- 後端服務出現502的時，自動顯示「網站維護中」靜態頁面。
- HTTP狀態碼猶原是502，予搜尋引擎佮監控工具知影這是暫時性的問題。

#### 注意
- 若是`/etc/nginx/vhost.d/`有某一个domain的專屬設定檔，彼个domain就袂讀`default`，愛家己加入去。
- 後端家己回傳的502，嘛會換做維護頁面。
- `vhost.d/default` ài hōo`nginx-proxy` kah `nginx-proxy-gen` 看。docker-gen若看bē tio̍h這个檔，就袂kā維護頁面加入去設定。

### 其他文件
苗栗話用个virtual host，完整英文[文件](https://github.com/nginx-proxy/acme-companion#readme)。
