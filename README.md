
# nginx mainline version on ubuntu with http2 alpn & TLS 1.3 support

[![CircleCI](https://circleci.com/gh/hitian/docker-nginx-with-https-alpn.svg?style=svg)](https://circleci.com/gh/hitian/docker-nginx-with-https-alpn)

nginx version mainline 1.21.0

## USAGE

nginx build info:

`docker run -it --rm hitian/nginx nginx -V`

example:

```bash
docker run --name nginx -p 80:80 -p 443:443 -d \
    -v $SERVICE_CONFIG_PATH/conf.d:/etc/nginx/conf.d:ro \
    -v $SERVICE_CONFIG_PATH/www:/www:ro \
    -v $SERVICE_CONFIG_PATH/ssl:/ssl:ro \
    -v $SERVICE_CONFIG_PATH/logs:/logs \
    --link other_backend_service_docker_name \
    hitian/nginx:latest
```

### SSL recommended settings

```plain
ssl_session_timeout 5m;
ssl_protocols TLSv1 TLSv1.1 TLSv1.2 TLSv1.3;
ssl_ciphers ECDHE-RSA-AES256-GCM-SHA384:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-RSA-AES256-SHA384:ECDHE-RSA-AES128-SHA256:!ECDHE-RSA-RC4-SHA:ECDHE-RSA-AES256-SHA:DHE-RSA-AES256-SHA:DHE-RSA-AES128-SHA:!RC4-SHA:!aNULL:!eNULL:!EXPORT:!DES:!3DES:!MD5:!DSS:!PKS;
ssl_prefer_server_ciphers on;
ssl_session_cache builtin:1000 shared:SSL:10m;

add_header Strict-Transport-Security "max-age=31536000;";

ssl_stapling on;
ssl_stapling_verify on;
```
