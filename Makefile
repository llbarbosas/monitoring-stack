show-metrics:
	@curl -s http://localhost:9090/api/v1/label/__name__/values | jq '.data | .[]' -r