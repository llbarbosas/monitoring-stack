listen {
  port = 4040
}

consul {
  enable = false
}

namespace "nginx" {
  source = {
    files = [
      "/var/log/nginx/access.log",
    ]
  }

  format = "$remote_addr - $remote_user [$time_local] \"$request\" $status $body_bytes_sent \"$http_referer\" \"$http_user_agent\" \"$http_x_forwarded_for\" \"$host\" sn=\"$server_name\" rt=$request_time ua=\"$upstream_addr\" us=\"$upstream_status\" ut=\"$upstream_response_time\" ul=\"$upstream_response_length\" cs=$upstream_cache_status"

  relabel "request" { from = "request" }
  relabel "host" { from = "host" }
  relabel "http_user_agent" { from = "http_user_agent" }
  relabel "request_time" { from = "request_time" }

  histogram_buckets = [.005, .01, .025, .05, .1, .25, .5, 1, 2.5, 5, 10]
}

namespace "nginx_error" {
  source = {
    files = [
      "/var/log/nginx/error.log",
    ]
  }

  # format = "$remote_addr - $remote_user [$time_local] \"$request\" $status $body_bytes_sent \"$http_referer\" \"$http_user_agent\" \"$http_x_forwarded_for\""
  format = "$date"

  histogram_buckets = [.005, .01, .025, .05, .1, .25, .5, 1, 2.5, 5, 10]
}