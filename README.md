<p align="center"><img src=".github/prometheus_logo.svg" width="80"/></p>
<h2 align="center">monitoring-stack</h2>
<p align="center">My current preferred setup for systems monitoring</p> 

Systems monitoring is something that as soon as you give it a first try, you'll always feel the need.

This is my current setup for that purpose, that consists on the following elements:

- **NGINX**
  - Mimics a real application with an API Gateway
  - Redirects the requests on `/v1` to [JSONPlaceholder](https://jsonplaceholder.typicode.com/)
- **nginx_exporter** e **nginx_log_exporter**
  - By default, NGINX OSS provides [just a few metrics](https://github.com/nginxinc/nginx-prometheus-exporter#metrics-for-nginx-oss) (using *nginx_exporter*)
  - Therefore, I chose to use *nginx_log_exporter* to provide [a bunch of other metrics](https://github.com/martin-helmich/prometheus-nginxlog-exporter#collected-metrics), that have a certain level of customization.
- **Prometheus**
  - Monitoring tool that has satisfied me the most so far
- **Grafana**
  - Grafana dashboard creation are amazing

### Why this stack?

#### By alternatives

- NGINX Amplify
  - Only supports the few metrics that NGINX provides out-of-the-box.
  - It is hosted only by NGINX ORG itself. We haven't control 
- Elastic Search
  - I haven't give a shot to the Elastic family yet. Seems interesting.

### Dependencies

- Docker (moby-engine)
  - _Maybe test with podman too?_ 
- docker-compose
- make 
  - for running aux scripts
- jq
  - for running `make show-metrics`

### Usage

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
