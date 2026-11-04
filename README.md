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

### 維護頁面
- 後端服務出現502的時，自動顯示「網站維護中」靜態頁面。
- 服務的container停去的時，nginx-proxy預設server回傳的503，走http嘛會顯示仝一頁，毋過https會先出現瀏覽器憑證警告，看無維護頁面。
- HTTP狀態碼猶原是502、503，予搜尋引擎佮監控工具知影這是暫時性的問題。

#### 注意
- 頁面的檔名一定愛是`50x.html`，若改名，維護頁面會無去，嘛袂出現錯誤訊息。
- 若是`/etc/nginx/vhost.d/`有某一个domain的專屬設定檔，彼个domain就袂讀`default`，愛家己加入去。
- 後端家己回傳的502，嘛會換做維護頁面。
- 改`vhost.d/default`了後愛`docker compose restart nginx-proxy`。

### 其他文件
苗栗話用个virtual host，完整英文[文件](https://github.com/nginx-proxy/acme-companion#readme)。
