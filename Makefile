docker_run:
	- docker compose up -d

docker_destroy:
	- docker-compose down
	- docker container prune -f
	- docker system prune -af

k8s_run:
	- ./1.start-k8s.sh

k8s_destroy:
	- ./2.destroy-k8s.sh

helm_run:
	- helm install go-chart deployment/chart/
    - watch -n 1 kubectl port-forward service/go-api-backend-svc 8081:8081

helm_derstroy:
	- helm uninstall go-chart
