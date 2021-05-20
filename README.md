<p align="center"><img src=".github/prometheus_logo.svg" width="80"/></p>
<h2 align="center">monitoring-stack</h2>
<p align="center">My current preferred setup for systems monitoring</p> 

Systems monitoring is something that as soon as you give it a first try, you'll always feel the need.

This is my current setup for that purpose, that consists on the following elements:

- **[NGINX](https://nginx.org/en/)**
  - Mimics a real application with an API Gateway
  - Redirects the requests on `/v1` to [JSONPlaceholder](https://jsonplaceholder.typicode.com/)
- **[nginx_exporter](https://github.com/nginxinc/nginx-prometheus-exporter)** e **[nginx_log_exporter](https://github.com/martin-helmich/prometheus-nginxlog-exporter)**
  - By default, NGINX OSS provides [just a few metrics](https://github.com/nginxinc/nginx-prometheus-exporter#metrics-for-nginx-oss) (using *nginx_exporter*)
  - Therefore, I chose to use *nginx_log_exporter* to provide [a bunch of other metrics](https://github.com/martin-helmich/prometheus-nginxlog-exporter#collected-metrics), that have a certain level of customization.
- **[Prometheus](https://prometheus.io/)**
  - Monitoring tool that has satisfied me the most so far
- **[Grafana](https://grafana.com/oss/grafana/)**
  - Grafana dashboard creation are amazing

### Why this stack?

#### By alternatives

- [NGINX Amplify](https://amplify.nginx.com)
  - Only supports the few metrics that NGINX provides out-of-the-box.
  - It is hosted only by NGINX ORG itself. We haven't control 
- [Elastic Search](https://www.elastic.co/pt/what-is/elasticsearch-monitoring)
  - I haven't give a shot to the Elastic family yet. Seems interesting.

### Dependencies

- Docker (moby-engine)
  - _Maybe test with [podman](https://github.com/containers/podman) too?_ 
- docker-compose
- make 
  - for running aux scripts
- [jq](https://stedolan.github.io/jq/)
  - for running `make show-metrics`
  - comes by default in most of linux distros

### Usage

- Setup .env file
  ```bash
  cp .env.example .env
  ```
- Start services
  ```bash
  docker-compose up
  ```
- [Add Prometheus to Grafana data sources](https://grafana.com/docs/grafana/latest/datasources/prometheus/)
- Start messing around creating graphs
  - See all available metrics 
    ```bash
    make show-metrics
    ```

### TODO

- [ ] Use NGINX's _error.log_ to generate metrics with *nginx_log_exporter*
