# Dockerfile for Tabula

## How to run

1. Build: `docker build -t tabula .`
2. Create data directory: `mkdir /path/to/tabula-data`
3. Run: `docker run -v /path/to/tabula-data:/tabula-data -p 9292:9292 tabula`

Tabula will be available in: `http://<DOCKER_IP>:9292`
