
nginx mainline version on ubuntu with http2 alpn support.

### USAGE

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
