## Build image

```sh
docker build -t backend .
```

## Build image for platform

```
docker buildx build --platform linux/amd64,linux/arm64 --push -t mmladshev/webinartest .
```

## Run backend

```sh
docker rm apache --force && docker run --name apache -d -p 80:80 apache
```

## Push

```
docker image tag backend:latest mmladshev/webinartest:latest
docker image push mmladshev/webinartest:latest
```

## Docker Compose with scale

```sh
docker-compose up --scale backend=3
```

## Apache error logs

```sh
tail -f /var/log/apache2/error.log
```

## OS Prepare

```
sudo apt-get install -y postgresql-client python3 python3-pip libpq-dev
```

## Postgres restore

psql -h localhost -U postgres -f dumpfile.sql webinar

createdb -h localhost -U postgres webinar