FROM nginx:1.25-alpine

# openssl で自己署名証明書を生成
RUN apk add --no-cache openssl \
  && mkdir -p /etc/nginx/certs \
  && openssl req -x509 -nodes -days 3650 \
      -newkey rsa:2048 \
      -keyout /etc/nginx/certs/localhost-key.pem \
      -out /etc/nginx/certs/localhost.pem \
      -subj "/C=JP/ST=Tokyo/L=Local/O=Dev/OU=Dev/CN=localhost" \
      -addext "subjectAltName=DNS:localhost,IP:127.0.0.1,IP:::1"
